/// Response from getSubscriptionList
Class Fitbit.Api.Client.responses.getSubscriptionsList Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// http status code = 200 content-type = application/json
Property Subscriptions As Fitbit.Api.Client.model.Subscriptions;

/// Implement operationId : getSubscriptionsList
/// get /1/user/-/{collection-path}/apiSubscriptions.json
Method LoadFromResponse(httpResponse As %Net.HttpResponse, caller As %String = "") As %Status
{
	set sc = $$$OK
	do ##super(httpResponse, caller)

	if $$$LOWER($Piece(httpResponse.ContentType,";",1))="application/json",httpResponse.StatusCode = "200"
	{
		set ..Subscriptions = ##class(Fitbit.Api.Client.model.Subscriptions).%New()
		set ..status = ..Subscriptions.%JSONImport(httpResponse.Data)

		return sc
	}

	return sc
}

Storage Default
{
<Data name="getSubscriptionsListDefaultData">
<Subscript>"getSubscriptionsList"</Subscript>
<Value name="1">
<Value>Subscriptions</Value>
</Value>
</Data>
<DefaultData>getSubscriptionsListDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
