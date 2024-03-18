Class Fitbit.Api.Client.requests.getAlarms Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "get";

Parameter URL = "/1/user/-/devices/tracker/{tracker-id}/alarms.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The ID of the tracker for which data is returned. The tracker-id value is found via the Get Devices endpoint.
Property pathtrackerid As %Integer;

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{tracker-id}", ..pathtrackerid)
	Quit sc
}

Storage Default
{
<Data name="getAlarmsDefaultData">
<Subscript>"getAlarms"</Subscript>
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
<Value>pathtrackerid</Value>
</Value>
</Data>
<DefaultData>getAlarmsDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
