Class Fitbit.Api.Client.requests.UpdateBodyFatGoal Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1/user/-/body/log/fat/goal.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// Target body fat percentage; in the format X.XX.
Property queryfat As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	If (..queryfat '= "") {
		Do httpRequest.SetParam("fat",..queryfat)
	}
	Quit sc
}

Storage Default
{
<Data name="UpdateBodyFatGoalDefaultData">
<Subscript>"UpdateBodyFatGoal"</Subscript>
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
<Value>queryfat</Value>
</Value>
</Data>
<DefaultData>UpdateBodyFatGoalDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
