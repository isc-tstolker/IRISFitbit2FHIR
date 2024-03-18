Class Fitbit.Api.Client.requests.addFoodsLog Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1/user/-/foods/log.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The amount consumed in the format X.XX in the specified unitId.
Property queryamount As %String(MAXLEN = "");

/// Brand name of food. Valid only with foodName parameters.
Property querybrandName As %String(MAXLEN = "");

/// Calories for this serving size. This is allowed with foodName parameter (default to zero); otherwise it is ignored.
Property querycalories As %Integer;

/// Log entry date in the format yyyy-MM-dd.
Property querydate As %String(MAXLEN = "");

/// The `true` value will add the food to the user's favorites after creating the log entry; while the `false` value will not. Valid only with foodId value.
Property queryfavorite As %Boolean;

/// The ID of the food to be logged. Either foodId or foodName must be provided.
Property queryfoodId As %String(MAXLEN = "");

/// Food entry name. Either foodId or foodName must be provided.
Property queryfoodName As %String(MAXLEN = "");

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
	If (..queryfoodId '= "") {
		Do httpRequest.SetParam("foodId",..queryfoodId)
	}
	If (..queryfoodName '= "") {
		Do httpRequest.SetParam("foodName",..queryfoodName)
	}
	If (..querymealTypeId '= "") {
		Do httpRequest.SetParam("mealTypeId",..querymealTypeId)
	}
	If (..queryunitId '= "") {
		Do httpRequest.SetParam("unitId",..queryunitId)
	}
	If (..queryamount '= "") {
		Do httpRequest.SetParam("amount",..queryamount)
	}
	If (..querydate '= "") {
		Do httpRequest.SetParam("date",..querydate)
	}
	If (..queryfavorite '= "") {
		Do httpRequest.SetParam("favorite",..queryfavorite)
	}
	If (..querybrandName '= "") {
		Do httpRequest.SetParam("brandName",..querybrandName)
	}
	If (..querycalories '= "") {
		Do httpRequest.SetParam("calories",..querycalories)
	}
	Quit sc
}

Storage Default
{
<Data name="addFoodsLogDefaultData">
<Subscript>"addFoodsLog"</Subscript>
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
<Value>queryamount</Value>
</Value>
<Value name="5">
<Value>querybrandName</Value>
</Value>
<Value name="6">
<Value>querycalories</Value>
</Value>
<Value name="7">
<Value>querydate</Value>
</Value>
<Value name="8">
<Value>queryfavorite</Value>
</Value>
<Value name="9">
<Value>queryfoodId</Value>
</Value>
<Value name="10">
<Value>queryfoodName</Value>
</Value>
<Value name="11">
<Value>querymealTypeId</Value>
</Value>
<Value name="12">
<Value>queryunitId</Value>
</Value>
</Data>
<DefaultData>addFoodsLogDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
