Include Ensemble

/// Add or Update User after Authorization
/// This means:
/// - Add Subscriptions
/// - Perform initial download of data
/// - Start BP GetUserData when configured
Class Fitbit.BP.AddOrUpdateUser Extends Ens.BusinessProcess [ ClassType = persistent ]
{

Parameter SETTINGS = "GetUserData:Basic,FitbitWebAPI:Basic";

/// Make empty when you do not want to start the initial download.
Property GetUserData As Ens.DataType.ConfigName [ InitialExpression = "GetUserData" ];

/// Where to send the API requests
Property FitbitWebAPI As Ens.DataType.ConfigName [ InitialExpression = "FitbitWebAPI" ];

/// AddOrUpdateUser is called Async
Method OnRequest(pRequest As Fitbit.Api.Client.requests.GenericRequest, Output pResponse As Ens.Response) As %Status
{
	#dim sc As %Status = $$$OK

	try
	{
		// Determine which subscriptions are allowed
		set scopes = ##class(Fitbit.DB.UserTokens).GetScopesForUser(pRequest.UserId)

		// Determine if these Subscriptions already exist, otherwise add!
		#dim subscriptions as Fitbit.Api.Client.model.Subscriptions = ..GetSubscriptions(pRequest.UserId)

		if (scopes [ "activity") && (scopes [ "nutrition") && (scopes [ "profile") && (scopes [ "settings") && (scopes [ "sleep") && (scopes [ "weight")
		{
			do subscriptions.Subscribe($THIS, pRequest.UserId ) // Subscribe all
		}
		else // Subscribe what is allowed
		{
			if scopes [ "activity" { do subscriptions.Subscribe($THIS, pRequest.UserId , "activities") }
			if scopes [ "weight" { do subscriptions.Subscribe($THIS, pRequest.UserId , "body") }
			if scopes [ "nutrition" { do subscriptions.Subscribe($THIS, pRequest.UserId , "foods") }
			if scopes [ "sleep" { do subscriptions.Subscribe($THIS, pRequest.UserId , "sleep") }

			do subscriptions.Subscribe($THIS, pRequest.UserId , "userRevokedAccess") // Always allowed
		}

		do subscriptions.DeleteUnusedSubscriptions($THIS)

		if ..GetUserData '= ""
		{
			$$$ThrowOnError(..SendRequestAsync(..GetUserData, pRequest, 0))
		}
	}
	catch ex
	{
		set sc = ex.AsStatus()

		$$$LOGERROR("Fout tijdens uitvoeren van " _ $CLASSNAME() _ ": " _ $System.Status.GetErrorText(sc))
	}

	return sc
}

/// Get subscriptions
Method GetSubscriptions(userId As %String) As Fitbit.Api.Client.model.Subscriptions
{
	set request = ##class(Fitbit.Api.Client.requests.getSubscriptionsList).%New()
	set request.UserId = userId

	$$$ThrowOnError(..SendRequestSync(..FitbitWebAPI, request, .response))
	#dim response as Fitbit.Api.Client.responses.getSubscriptionsList

	return response.Subscriptions
}

Storage Default
{
<Data name="AddOrUpdateUserDefaultData">
<Subscript>"AddOrUpdateUser"</Subscript>
<Value name="1">
<Value>GetUserData</Value>
</Value>
<Value name="2">
<Value>FitbitWebAPI</Value>
</Value>
</Data>
<DefaultData>AddOrUpdateUserDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
