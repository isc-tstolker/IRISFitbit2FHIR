/// Weight List
Class Fitbit.Api.Client.model.WeightList Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor) [ Inheritance = left, ProcedureBlock ]
{

/// List of Weight
Property Weights As list Of Fitbit.Api.Client.model.Weight(%JSONFIELDNAME = "weight");

Storage Default
{
<Data name="WeightListState">
<Value name="1">
<Value>Weights</Value>
</Value>
</Data>
<State>WeightListState</State>
<StreamLocation>^Fitbit.Api.Clie2A66.WeightListS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
