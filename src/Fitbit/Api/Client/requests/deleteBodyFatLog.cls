Class Fitbit.Api.Client.requests.deleteBodyFatLog Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "delete";

Parameter URL = "/1/user/-/body/log/fat/{body-fat-log-id}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The ID of the body fat log entry.
Property pathbodyfatlogid As %Integer;

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{body-fat-log-id}", ..pathbodyfatlogid)
	Quit sc
}

Storage Default
{
<Data name="deleteBodyFatLogDefaultData">
<Subscript>"deleteBodyFatLog"</Subscript>
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
<Value>pathbodyfatlogid</Value>
</Value>
</Data>
<DefaultData>deleteBodyFatLogDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
