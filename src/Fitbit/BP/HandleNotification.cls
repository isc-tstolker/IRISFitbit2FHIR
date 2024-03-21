Include Ensemble

/// HandleNotification is called by the REST API for notifications received from Fitbit
Class Fitbit.BP.HandleNotification Extends Fitbit.BP.FHIRBase [ ClassType = persistent ]
{

Parameter SETTINGS = "FitbitWebAPI:Basic,FHIRInterop:Basic";

/// Where to send the API requests
Property FitbitWebAPI As Ens.DataType.ConfigName [ InitialExpression = "FitbitWebAPI" ];

/// HandleNotification is called Async
Method OnRequest(pRequest As Fitbit.Msg.NotificationRequest, Output pResponse As Ens.Response) As %Status
{
	#dim sc As %Status = $$$OK

	try
	{
		if pRequest.CollectionType = "activities" // Activity
		{

		}
		elseif pRequest.CollectionType = "body" // Weight
		{
			set timezone = ##class(Fitbit.DB.UserTokens).GetTimezoneForUser(pRequest.UserId)

			do ..SaveWeightObservations(pRequest.UserId, timezone, ..GetWeightForDate(pRequest.UserId, pRequest.Date))
		}
		elseif pRequest.CollectionType = "foods" // Nutrition
		{
			$$$LOGERROR("Unsupported collectionType " _ pRequest.CollectionType)
		}
		elseif pRequest.CollectionType = "sleep" // Sleep
		{

		}
		elseif pRequest.CollectionType = "userRevokedAccess" // Users has revoked consent to the application
		{

		}
		elseif pRequest.CollectionType = "deleteUser" // Users has deleted their Fitbit account
		{
		}
		else
		{
			$$$LOGERROR("Unexpected collectionType " _ pRequest.CollectionType)
		}
	}
	catch ex
	{
		set sc = ex.AsStatus()

		$$$LOGERROR("Fout tijdens uitvoeren van " _ $CLASSNAME() _ ": " _ $System.Status.GetErrorText(sc))
	}

	return sc
}

/// Get weight for specified date
Method GetWeightForDate(userId As %String, date As %String) As Fitbit.Api.Client.model.WeightList
{
	set request = ##class(Fitbit.Api.Client.requests.getWeightByDate).%New()
	set request.UserId = userId
	set request.pathdate = date

	$$$ThrowOnError(..SendRequestSync(..FitbitWebAPI, request, .response))

	#dim response as Fitbit.Api.Client.responses.getWeightByDate

	return response.WeightList
}

Storage Default
{
<Data name="HandleNotificationDefaultData">
<Subscript>"HandleNotification"</Subscript>
<Value name="1">
<Value>FitbitWebAPI</Value>
</Value>
</Data>
<DefaultData>HandleNotificationDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
