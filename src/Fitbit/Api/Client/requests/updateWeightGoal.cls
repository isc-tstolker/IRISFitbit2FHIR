Class Fitbit.Api.Client.requests.updateWeightGoal Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1/user/-/body/log/weight/goal.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// Weight goal start date; in the format yyyy-MM-dd.
Property querystartDate As %String(MAXLEN = "");

/// Weight goal start weight; in the format X.XX, in the unit systems that corresponds to the Accept-Language header provided.
Property querystartWeight As %String(MAXLEN = "");

/// Weight goal target weight; in the format X.XX, in the unit systems that corresponds to the Accept-Language header provided; required if user doesn't have an existing weight goal.
Property queryweight As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	If (..querystartDate '= "") {
		Do httpRequest.SetParam("startDate",..querystartDate)
	}
	If (..querystartWeight '= "") {
		Do httpRequest.SetParam("startWeight",..querystartWeight)
	}
	If (..queryweight '= "") {
		Do httpRequest.SetParam("weight",..queryweight)
	}
	Quit sc
}

Storage Default
{
<Data name="updateWeightGoalDefaultData">
<Subscript>"updateWeightGoal"</Subscript>
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
<Value>querystartDate</Value>
</Value>
<Value name="5">
<Value>querystartWeight</Value>
</Value>
<Value name="6">
<Value>queryweight</Value>
</Value>
</Data>
<DefaultData>updateWeightGoalDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
