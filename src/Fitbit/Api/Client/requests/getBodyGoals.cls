Class Fitbit.Api.Client.requests.getBodyGoals Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "get";

Parameter URL = "/1/user/-/body/log/{goal-type}/goal.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// weight or fat.
Property pathgoaltype As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{goal-type}", ..pathgoaltype)
	Quit sc
}

Storage Default
{
<Data name="getBodyGoalsDefaultData">
<Subscript>"getBodyGoals"</Subscript>
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
<Value>pathgoaltype</Value>
</Value>
</Data>
<DefaultData>getBodyGoalsDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
