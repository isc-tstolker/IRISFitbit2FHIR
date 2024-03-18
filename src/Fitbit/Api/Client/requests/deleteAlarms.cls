Class Fitbit.Api.Client.requests.deleteAlarms Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "delete";

Parameter URL = "/1/user/-/devices/tracker/{tracker-id}/alarms/{alarm-id}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The ID of the alarm to be updated. The alarm-id value is found via the Get Alarms endpoint.
Property pathalarmid As %Integer;

/// The ID of the tracker whose alarms is managed. The tracker-id value is found via the Get Devices endpoint.
Property pathtrackerid As %Integer;

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{tracker-id}", ..pathtrackerid)
	Set ..%URL = $Replace(..%URL,"{alarm-id}", ..pathalarmid)
	Quit sc
}

Storage Default
{
<Data name="deleteAlarmsDefaultData">
<Subscript>"deleteAlarms"</Subscript>
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
<Value>pathalarmid</Value>
</Value>
<Value name="5">
<Value>pathtrackerid</Value>
</Value>
</Data>
<DefaultData>deleteAlarmsDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
