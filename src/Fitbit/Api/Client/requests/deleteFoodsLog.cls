Class Fitbit.Api.Client.requests.deleteFoodsLog Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "delete";

Parameter URL = "/1/user/-/foods/log/{food-log-id}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The ID of the food log entry to be deleted.
Property pathfoodlogid As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{food-log-id}", ..pathfoodlogid)
	Quit sc
}

Storage Default
{
<Data name="deleteFoodsLogDefaultData">
<Subscript>"deleteFoodsLog"</Subscript>
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
<Value>pathfoodlogid</Value>
</Value>
</Data>
<DefaultData>deleteFoodsLogDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
