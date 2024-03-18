Class Fitbit.Api.Client.requests.addUpdateWaterGoal Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1/user/-/foods/log/water/goal.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The target water goal in the format X.X is set in unit based on locale.
Property querytarget As %Integer;

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	If (..querytarget '= "") {
		Do httpRequest.SetParam("target",..querytarget)
	}
	Quit sc
}

Storage Default
{
<Data name="addUpdateWaterGoalDefaultData">
<Subscript>"addUpdateWaterGoal"</Subscript>
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
<Value>querytarget</Value>
</Value>
</Data>
<DefaultData>addUpdateWaterGoalDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
