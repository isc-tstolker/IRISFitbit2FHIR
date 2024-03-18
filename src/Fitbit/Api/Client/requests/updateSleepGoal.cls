Class Fitbit.Api.Client.requests.updateSleepGoal Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1.2/user/-/sleep/goal.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// Duration of sleep goal.
Property queryminDuration As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	If (..queryminDuration '= "") {
		Do httpRequest.SetParam("minDuration",..queryminDuration)
	}
	Quit sc
}

Storage Default
{
<Data name="updateSleepGoalDefaultData">
<Subscript>"updateSleepGoal"</Subscript>
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
<Value>queryminDuration</Value>
</Value>
</Data>
<DefaultData>updateSleepGoalDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
