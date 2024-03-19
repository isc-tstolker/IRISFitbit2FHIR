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
		#; do ..CreateOrUpdatePatient(..GetProfile(pRequest.UserId))

		// Get historic weight
		do ..GetWeightByDatePeriod(pRequest.UserId)
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

/// Get weight for maximum period
Method GetWeightByDatePeriod(userId As %String, period As %String = "1y")
{
	set request = ##class(Fitbit.Api.Client.requests.getWeightByDateRange).%New()
	set request.UserId = userId
	// maximum numbber of days is 1095
	set request.pathbasedate = "today"
	set request.pathenddate = $ZDATE(-1094 + $HOROLOG, 3)

	$$$ThrowOnError(..SendRequestSync(..FitbitWebAPI, request, .response))

	#dim response as Fitbit.Api.Client.responses.getWeightByDateRange
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
