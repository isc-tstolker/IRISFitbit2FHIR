Class Fitbit.Api.Client.requests.addUpdateFoodsGoal Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1/user/-/foods/log/goal.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// Manual calorie consumption goal in either calories or intensity must be provided.
Property querycalories As %Integer;

/// Food plan intensity (MAINTENANCE, EASIER, MEDIUM, KINDAHARD, or HARDER). Either calories or intensity must be provided.
Property queryintensity As %String(MAXLEN = "");

/// Food plan type; true or false.
Property querypersonalized As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	If (..querycalories '= "") {
		Do httpRequest.SetParam("calories",..querycalories)
	}
	If (..queryintensity '= "") {
		Do httpRequest.SetParam("intensity",..queryintensity)
	}
	If (..querypersonalized '= "") {
		Do httpRequest.SetParam("personalized",..querypersonalized)
	}
	Quit sc
}

Storage Default
{
<Data name="addUpdateFoodsGoalDefaultData">
<Subscript>"addUpdateFoodsGoal"</Subscript>
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
<Value>querycalories</Value>
</Value>
<Value name="5">
<Value>queryintensity</Value>
</Value>
<Value name="6">
<Value>querypersonalized</Value>
</Value>
</Data>
<DefaultData>addUpdateFoodsGoalDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
