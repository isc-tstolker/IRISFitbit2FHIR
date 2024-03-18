Class Fitbit.Api.Client.requests.addFoods Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1/user/-/foods.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The calories in the default serving size.
Property querycalories As %String(MAXLEN = "");

/// The ID of the default measurement unit. Full list of units can be retrieved via the Get Food Units endpoint.
Property querydefaultFoodMeasurementUnitId As %String(MAXLEN = "");

/// The size of the default serving. Nutrition values should be provided for this serving size.
Property querydefaultServingSize As %String(MAXLEN = "");

/// The description of the food.
Property querydescription As %String(MAXLEN = "");

/// Form type; LIQUID or DRY.
Property queryformType As %String(MAXLEN = "");

/// The food name.
Property queryname As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	If (..queryname '= "") {
		Do httpRequest.SetParam("name",..queryname)
	}
	If (..querydefaultFoodMeasurementUnitId '= "") {
		Do httpRequest.SetParam("defaultFoodMeasurementUnitId",..querydefaultFoodMeasurementUnitId)
	}
	If (..querydefaultServingSize '= "") {
		Do httpRequest.SetParam("defaultServingSize",..querydefaultServingSize)
	}
	If (..querycalories '= "") {
		Do httpRequest.SetParam("calories",..querycalories)
	}
	If (..queryformType '= "") {
		Do httpRequest.SetParam("formType",..queryformType)
	}
	If (..querydescription '= "") {
		Do httpRequest.SetParam("description",..querydescription)
	}
	Quit sc
}

Storage Default
{
<Data name="addFoodsDefaultData">
<Subscript>"addFoods"</Subscript>
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
<Value>querydefaultFoodMeasurementUnitId</Value>
</Value>
<Value name="6">
<Value>querydefaultServingSize</Value>
</Value>
<Value name="7">
<Value>querydescription</Value>
</Value>
<Value name="8">
<Value>queryformType</Value>
</Value>
<Value name="9">
<Value>queryname</Value>
</Value>
</Data>
<DefaultData>addFoodsDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
