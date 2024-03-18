Class Fitbit.Api.Client.requests.getSubscriptionsList Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "get";

Parameter URL = "/1/user/-/{collection-path}apiSubscriptions.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// This is the resource of the collection to receive notifications from (foods, activities, sleep, or body). If not present, subscription will be created for all collections. If you have both all and specific collection subscriptions, you will get duplicate notifications on that collections' updates. Each subscriber can have only one subscription for a specific user's collection.
Property pathcollectionpath As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)

	if ..pathcollectionpath '= ""
	{
		set ..pathcollectionpath = ..pathcollectionpath _ "/"
	}
	
	Set ..%URL = $Replace(..#URL,"{collection-path}", ..pathcollectionpath)
	Quit sc
}

Storage Default
{
<Data name="getSubscriptionsListDefaultData">
<Subscript>"getSubscriptionsList"</Subscript>
<Value name="1">
<Value>%Consume</Value>
</Value>
<Value name="2">
<Value>%ContentType</Value>
</Value>
<Value name="3">
<Value>%URL</Value>
</Value>
<Value name="4">
<Value>pathcollectionpath</Value>
</Value>
</Data>
<DefaultData>getSubscriptionsListDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
