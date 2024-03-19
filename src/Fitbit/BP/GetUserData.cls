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

	try
	{
		// Get User profile and create/update FHIR Patient
		#dim profile As Fitbit.Api.Client.model.Profile = ..GetProfile(pRequest.UserId)
		$$$ThrowOnError(##class(Fitbit.DB.UserTokens).UpdateTimezone(pRequest.UserId, profile.Timezone))
		do ..CreateOrUpdatePatient(profile)

		// Get weights
		do ..SyncWeight(pRequest.UserId, profile.Timezone, profile.MemberSince)
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
							"code": (profile.LanguageLocale)
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

/// Sync Weight Observations
Method SyncWeight(userId As %String = "", timezone As %String = "", memberSince As %String = "2016-03-10")
{
	set startday = $ZDATEH(memberSince, 3)
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
