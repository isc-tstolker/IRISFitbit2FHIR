Include Ensemble

/// HandleNotification is called by the REST API for notifications received from Fitbit
Class Fitbit.BP.HandleNotification Extends Ens.BusinessProcess [ ClassType = persistent ]
{

Parameter SETTINGS = "FitbitWebAPI:Basic";

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
		}
		elseif pRequest.CollectionType = "foods" // Nutrition
		{

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

/// Subscribe for the specified data source(s)
Method Subscribe() As %String
{
	set request = ##class(Fitbit.Api.Client.requests.addSubscriptions).%New()
	// This is the resource of the collection to receive notifications from (foods, activities, sleep, or body).
	// If not present, subscription will be created for all collections.
	// If you have both all and specific collection subscriptions, you will get duplicate notifications on that collections' updates.
	// Each subscriber can have only one subscription for a specific user's collection.
	set request.pathcollectionpath = ""

	// Unique ID of the subscription created by the API client application. 
	// Each ID must be unique across the entire set of subscribers and collections.
	// The Fitbit servers will pass this ID back along with any notifications about the user indicated by the user parameter in the URL path.
	set request.pathsubscriptionid = ""

	$$$ThrowOnError(..SendRequestSync(..FitbitWebAPI, request, .response))
	#dim response as Fitbit.Api.Client.responses.addSubscriptions

	return ""
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
