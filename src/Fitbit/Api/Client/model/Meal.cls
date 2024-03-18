Class Fitbit.Api.Client.model.Meal Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor) [ Inheritance = left, ProcedureBlock ]
{

Property description As %String(MAXLEN = "");

Property mealFoods As list Of Fitbit.Api.Client.model.FoodItem;

Property name As %String(MAXLEN = "");

Storage Default
{
<Data name="MealState">
<Value name="1">
<Value>description</Value>
</Value>
<Value name="2">
<Value>mealFoods</Value>
</Value>
<Value name="3">
<Value>name</Value>
</Value>
</Data>
<State>MealState</State>
<StreamLocation>^Fitbit54AD.MealS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
