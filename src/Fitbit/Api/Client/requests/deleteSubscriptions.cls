Class Fitbit.Api.Client.requests.deleteSubscriptions Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "delete";

Parameter URL = "/1/user/-/{collection-path}/apiSubscriptions/{subscription-id}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// This is the resource of the collection to receive notifications from (foods, activities, sleep, or body). If not present, subscription will be created for all collections. If you have both all and specific collection subscriptions, you will get duplicate notifications on that collections' updates. Each subscriber can have only one subscription for a specific user's collection.
Property pathcollectionpath As %String(MAXLEN = "");

/// This is the resource of the collection to receive notifications from (foods, activities, sleep, or body). If not present, subscription will be created for all collections. If you have both all and specific collection subscriptions, you will get duplicate notifications on that collections' updates. Each subscriber can have only one subscription for a specific user's collection.
Property pathsubscriptionid As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{collection-path}", ..pathcollectionpath)
	Set ..%URL = $Replace(..%URL,"{subscription-id}", ..pathsubscriptionid)
	Quit sc
}

Storage Default
{
<Data name="deleteSubscriptionsDefaultData">
<Subscript>"deleteSubscriptions"</Subscript>
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
<Value name="5">
<Value>pathsubscriptionid</Value>
</Value>
</Data>
<DefaultData>deleteSubscriptionsDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
