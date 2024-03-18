Class Fitbit.Api.Client.requests.addSleep Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1.2/user/-/sleep.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// Log entry in the format yyyy-MM-dd.
Property querydate As %String(MAXLEN = "");

/// Duration in milliseconds.
Property queryduration As %Integer;

/// Start time includes hours and minutes in the format HH:mm.
Property querystartTime As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	If (..querystartTime '= "") {
		Do httpRequest.SetParam("startTime",..querystartTime)
	}
	If (..queryduration '= "") {
		Do httpRequest.SetParam("duration",..queryduration)
	}
	If (..querydate '= "") {
		Do httpRequest.SetParam("date",..querydate)
	}
	Quit sc
}

Storage Default
{
<Data name="addSleepDefaultData">
<Subscript>"addSleep"</Subscript>
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
<Value>querydate</Value>
</Value>
<Value name="5">
<Value>queryduration</Value>
</Value>
<Value name="6">
<Value>querystartTime</Value>
</Value>
</Data>
<DefaultData>addSleepDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
