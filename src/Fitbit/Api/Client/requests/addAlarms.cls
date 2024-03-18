Class Fitbit.Api.Client.requests.addAlarms Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1/user/-/devices/tracker/{tracker-id}/alarms.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The ID of the tracker for which data is returned. The tracker-id value is found via the Get Devices endpoint.
Property pathtrackerid As %Integer;

/// true or false. If false, alarm does not vibrate until enabled is set to true.
Property queryenabled As %Boolean;

/// true or false. If false, the alarm is a single event.
Property queryrecurring As %String(MAXLEN = "");

/// Time of day that the alarm vibrates with a UTC timezone offset, e.g. 07:15-08:00.
Property querytime As %String(MAXLEN = "");

/// Comma separated list of days of the week on which the alarm vibrates, e.g. MONDAY, TUESDAY.
Property queryweekDays As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{tracker-id}", ..pathtrackerid)
	If (..querytime '= "") {
		Do httpRequest.SetParam("time",..querytime)
	}
	If (..queryenabled '= "") {
		Do httpRequest.SetParam("enabled",..queryenabled)
	}
	If (..queryrecurring '= "") {
		Do httpRequest.SetParam("recurring",..queryrecurring)
	}
	If (..queryweekDays '= "") {
		Do httpRequest.SetParam("weekDays",..queryweekDays)
	}
	Quit sc
}

Storage Default
{
<Data name="addAlarmsDefaultData">
<Subscript>"addAlarms"</Subscript>
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
<Value name="5">
<Value>queryenabled</Value>
</Value>
<Value name="6">
<Value>queryrecurring</Value>
</Value>
<Value name="7">
<Value>querytime</Value>
</Value>
<Value name="8">
<Value>queryweekDays</Value>
</Value>
</Data>
<DefaultData>addAlarmsDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
