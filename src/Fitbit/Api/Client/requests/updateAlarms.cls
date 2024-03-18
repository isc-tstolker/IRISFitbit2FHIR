Class Fitbit.Api.Client.requests.updateAlarms Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1/user/-/devices/tracker/{tracker-id}/alarms/{alarm-id}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The ID of the alarm to be updated. The alarm-id value is found in the response of the Get Activity endpoint.
Property pathalarmid As %Integer;

/// The ID of the tracker for which data is returned. The tracker-id value is found via the Get Devices endpoint.
Property pathtrackerid As %Integer;

/// true or false. If false, the alarm does not vibrate until enabled is set to true.
Property queryenabled As %Boolean;

/// true or false. If false, the alarm is a single event.
Property queryrecurring As %String(MAXLEN = "");

/// Maximum snooze count.
Property querysnoozeCount As %Integer;

/// Minutes between alarms.
Property querysnoozeLength As %Integer;

/// Time of day that the alarm vibrates with a UTC timezone offset, e.g. 07:15-08:00.
Property querytime As %String(MAXLEN = "");

/// Comma seperated list of days of the week on which the alarm vibrates, e.g. MONDAY, TUESDAY.
Property queryweekDays As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{tracker-id}", ..pathtrackerid)
	Set ..%URL = $Replace(..%URL,"{alarm-id}", ..pathalarmid)
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
	If (..querysnoozeLength '= "") {
		Do httpRequest.SetParam("snoozeLength",..querysnoozeLength)
	}
	If (..querysnoozeCount '= "") {
		Do httpRequest.SetParam("snoozeCount",..querysnoozeCount)
	}
	Quit sc
}

Storage Default
{
<Data name="updateAlarmsDefaultData">
<Subscript>"updateAlarms"</Subscript>
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
<Value name="6">
<Value>queryenabled</Value>
</Value>
<Value name="7">
<Value>queryrecurring</Value>
</Value>
<Value name="8">
<Value>querysnoozeCount</Value>
</Value>
<Value name="9">
<Value>querysnoozeLength</Value>
</Value>
<Value name="10">
<Value>querytime</Value>
</Value>
<Value name="11">
<Value>queryweekDays</Value>
</Value>
</Data>
<DefaultData>updateAlarmsDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
