/// List of Activity values 
Class Fitbit.Api.Client.model.ActivityResourceValueList Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor) [ Inheritance = left, ProcedureBlock ]
{

/// List of Values
Property Values As list Of Fitbit.Api.Client.model.ActivityResourceValue(%JSONFIELDNAME = "activities");

Storage Default
{
<Data name="ActivityResourceValueListState">
<Value name="1">
<Value>Values</Value>
</Value>
</Data>
<State>ActivityResourceValueListState</State>
<StreamLocation>^Fitbit.Api2A66.ActivityResB0D2S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
