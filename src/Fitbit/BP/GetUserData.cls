Include (%occErrors, Ensemble)

/// GetUserData. This is called after adding a new user, but can also be called at a later moment in time to re-synchronize
Class Fitbit.BP.GetUserData Extends Fitbit.BP.FHIRBase [ ClassType = persistent ]
{

Parameter SETTINGS = "FitbitWebAPI:Basic,FHIRInterop:Basic";

/// Where to send the API requests
Property FitbitWebAPI As Ens.DataType.ConfigName [ InitialExpression = "FitbitWebAPI" ];

/// GetUserData
Method OnRequest(pRequest As Fitbit.Api.Client.requests.GenericRequest, Output pResponse As Ens.Response) As %Status
{
	#dim sc As %Status = $$$OK
	#dim profile As Fitbit.Api.Client.model.Profile

	try
	{
		set scopes = ##class(Fitbit.DB.UserTokens).GetScopesForUser(pRequest.UserId, .startdate)

		if scopes [ "profile"
		{
			set profile = ..GetProfile(pRequest.UserId) // Get User profile
			$$$ThrowOnError(##class(Fitbit.DB.UserTokens).UpdateTimezone(pRequest.UserId, profile.Timezone))
			do ..CreateOrUpdatePatient(profile)
			do ..CreateOrUpdateHeightObservation(profile.UserId, profile.Timezone, profile.Height)
		}
		else // Assume defaults
		{
			set profile = ##class(Fitbit.Api.Client.model.Profile).%New()
			set profile.Timezone = "Europe/Amsterdam"
			set profile.MemberSince = $ZDATE(-366 + $H, 3) // Assume data for one year
		}

		if scopes [ "settings"
		{
			do ..GetAndSaveDevices(pRequest.UserId, profile.Timezone)
		}

		if (startdate = "") || (startdate = $CHAR(0))
		{
			set startdate = profile.MemberSince
		}

		set newstartDate = $ZDATETIME($HOROLOG, 3, 5)

		if scopes [ "activity"
		{
			do ..SyncActivity(pRequest.UserId, profile.Timezone, startdate)
		}

		if scopes [ "weight"
		{
			do ..SyncWeight(pRequest.UserId, profile.Timezone, startdate)
		}

		do ##class(Fitbit.DB.UserTokens).UpdateLastSynchronized(pRequest.UserId, newstartDate)
	}
	catch ex
	{
		set sc = ex.AsStatus()

		$$$LOGERROR("Fout tijdens uitvoeren van " _ $CLASSNAME() _ ": " _ $System.Status.GetErrorText(sc))
	}

	return sc
}

/// Save the Fitbit profile as FHIR Patient
Method CreateOrUpdatePatient(profile As Fitbit.Api.Client.model.Profile)
{
	set patient = {
		"resourceType": "Patient",
		"id": (profile.UserId),
		"identifier": [
			{
				"system": (..#PatientIdentifierSystem),
				"value": (profile.UserId)
			}
		],
		"active": true,
		"name": [
			{
				"use": "official",
				"text": (profile.FullName),
				"family": (profile.LastName),
				"given": [ (profile.FirstName) ]
			},
			{
				"use": "usual",
				"text": (profile.DisplayName)
			}
		],
		"gender": ($ZCONVERT(profile.Gender, "L")),
		"birthDate": (profile.DateOfBirth),
		"address": [
			{
				"country": (profile.Country)
			}
		],
		"communication": [
			{
				"language": {
					"coding": [
						{
							"system": "urn:ietf:bcp:47",
							"code": ($Replace(profile.LanguageLocale, "_", "-"))
						}
					]
				}
			}
		]
	}
	do patient.%Set("active", profile.IsUserVisible, "boolean")

	if (..SendFHIRResource("PUT", patient, "Patient/" _ profile.UserId) = "")
	{
		$$$ThrowOnError($$$ERROR($$$GeneralError, "Failed to save Fitbit User '" _ profile.UserId _ "' as Patient in the FHIR Store"))
	}
}

/// Get the users profile
Method GetProfile(userId As %String) As Fitbit.Api.Client.model.Profile
{
	set request = ##class(Fitbit.Api.Client.requests.getProfile).%New()
	set request.UserId = userId

	$$$ThrowOnError(..SendRequestSync(..FitbitWebAPI, request, .response))

	#dim response as Fitbit.Api.Client.responses.getProfile

	return response.User.Profile
}

/// Sync historic Activity Observations
/// This can best be done by retrieving Get Activity Time Series by Date Range for steps and calories
Method SyncActivity(userId As %String, timezone As %String, startdate As %String)
{
	set max = 1094 // maximum number of days is 1095
	set startday = $ZDATEH(startdate, 3)
	set yesterday = -1 + $HOROLOG

	for day = startday:(max + 1):yesterday
	{
		set request = ##class(Fitbit.Api.Client.requests.getActivitiesResourceByDateRange).%New()
		set request.UserId = userId
		set request.pathbasedate = $ZDATE(day, 3)

		if (day + max) > yesterday
		{
			set request.pathenddate = $ZDATE(yesterday, 3)
		}
		else
		{
			set request.pathenddate = $ZDATE(day + max, 3)
		}

		do ..SyncActivityRange(request, timezone, "steps")
		do ..SyncActivityRange(request, timezone, "calories")
	}
}

/// Description
Method SyncActivityRange(request As Fitbit.Api.Client.requests.getActivitiesResourceByDateRange, timezone As %String, activity As %String)
{
	set request = request.%ConstructClone() // Avoid that all visual trace entries show "calories"
	set request.pathresourcepath = activity

	$$$ThrowOnError(..SendRequestSync(..FitbitWebAPI, request, .response))

	#dim response as Fitbit.Api.Client.responses.getActivitiesResourceByDateRange

	do ..SaveActivityObservationRange(request.UserId, timezone, response.ValueList, activity)
}

/// Sync Weight Observations
Method SyncWeight(userId As %String, timezone As %String, startdate As %String)
{
	set startday = $ZDATEH(startdate, 3)
	set today = +$HOROLOG

	for day = startday:32:today
	{
		set request = ##class(Fitbit.Api.Client.requests.getWeightByDateRange).%New()
		set request.UserId = userId
		// maximum number of days is 31
		set request.pathbasedate = $ZDATE(day, 3)

		if (day + 31) > today
		{
			set request.pathenddate = $ZDATE(today, 3)
		}
		else
		{
			set request.pathenddate = $ZDATE(day + 31, 3)
		}

		$$$ThrowOnError(..SendRequestSync(..FitbitWebAPI, request, .response))

		#dim response as Fitbit.Api.Client.responses.getWeightByDateRange

		do ..SaveWeightObservations(userId, timezone, response.WeightList)
	}
}

/// Get active devices and Save to FHIR
Method GetAndSaveDevices(userId As %String, timezone As %String)
{
	set request = ##class(Fitbit.Api.Client.requests.getDevices).%New()
	set request.UserId = userId

	$$$ThrowOnError(..SendRequestSync(..FitbitWebAPI, request, .response))
	#dim response As Fitbit.Api.Client.responses.getDevices

	for index = 1:1:response.Devices.Count()
	{
		#dim device as Fitbit.Api.Client.model.Device = response.Devices.GetAt(index)

		/// Save Device
		do ..SaveDevice(userId, timezone, device)
	}
}

Storage Default
{
<Data name="GetUserDataDefaultData">
<Subscript>"GetUserData"</Subscript>
<Value name="1">
<Value>FitbitWebAPI</Value>
</Value>
<Value name="2">
<Value>FHIRInterop</Value>
</Value>
</Data>
<DefaultData>GetUserDataDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
