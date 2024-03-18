Class Fitbit.Api.Client.requests.editFoodsLog Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1/user/-/foods/log/{food-log-id}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The ID of the food log entry to be edited.
Property pathfoodlogid As %String(MAXLEN = "");

/// The amount consumed in the format X.XX in the specified unitId.
Property queryamount As %String(MAXLEN = "");

/// Calories for this serving size. This is allowed with foodName parameter (default to zero); otherwise it is ignored.
Property querycalories As %Integer;

/// Meal types. 1=Breakfast; 2=Morning Snack; 3=Lunch; 4=Afternoon Snack; 5=Dinner; 7=Anytime.
Property querymealTypeId As %String(MAXLEN = "");

/// The ID of units used. Typically retrieved via a previous call to Get Food Logs, Search Foods, or Get Food Units.
Property queryunitId As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{food-log-id}", ..pathfoodlogid)
	If (..querymealTypeId '= "") {
		Do httpRequest.SetParam("mealTypeId",..querymealTypeId)
	}
	If (..queryunitId '= "") {
		Do httpRequest.SetParam("unitId",..queryunitId)
	}
	If (..queryamount '= "") {
		Do httpRequest.SetParam("amount",..queryamount)
	}
	If (..querycalories '= "") {
		Do httpRequest.SetParam("calories",..querycalories)
	}
	Quit sc
}

Storage Default
{
<Data name="editFoodsLogDefaultData">
<Subscript>"editFoodsLog"</Subscript>
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
<Value>pathfoodlogid</Value>
</Value>
<Value name="5">
<Value>queryamount</Value>
</Value>
<Value name="6">
<Value>querycalories</Value>
</Value>
<Value name="7">
<Value>querymealTypeId</Value>
</Value>
<Value name="8">
<Value>queryunitId</Value>
</Value>
</Data>
<DefaultData>editFoodsLogDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
