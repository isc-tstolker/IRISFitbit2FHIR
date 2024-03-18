Class Fitbit.Api.Client.model.FoodItem Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor) [ Inheritance = left, ProcedureBlock ]
{

Property amount As %Integer;

Property foodId As %Integer;

Property unitId As %Integer;

Storage Default
{
<Data name="FoodItemState">
<Value name="1">
<Value>amount</Value>
</Value>
<Value name="2">
<Value>foodId</Value>
</Value>
<Value name="3">
<Value>unitId</Value>
</Value>
</Data>
<State>FoodItemState</State>
<StreamLocation>^Fitbit.Api.Client2A66.FoodItemS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
