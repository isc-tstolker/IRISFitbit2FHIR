/// Activity Goals
Class Fitbit.Api.Client.model.ActivityGoals Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor) [ Inheritance = left, ProcedureBlock ]
{

/// Ignore invalid fields
Parameter %JSONIGNOREINVALIDFIELD = 1;

/// "activeMinutes": 30,
Property ActiveMinutes As %Integer(%JSONFIELDNAME = "activeMinutes");

/// "caloriesOut": 3069,
Property CaloriesOut As %Integer(%JSONFIELDNAME = "caloriesOut");

/// "distance": 8.05,
Property DistanceInKm As %Numeric(%JSONFIELDNAME = "distance");

/// "floors": 10,
Property Floors As %Integer(%JSONFIELDNAME = "floors");

/// "steps": 10000
Property Steps As %Integer(%JSONFIELDNAME = "steps");

Storage Default
{
<Data name="ActivityGoalsState">
<Value name="1">
<Value>ActiveMinutes</Value>
</Value>
<Value name="2">
<Value>CaloriesOut</Value>
</Value>
<Value name="3">
<Value>DistanceInKm</Value>
</Value>
<Value name="4">
<Value>Floors</Value>
</Value>
<Value name="5">
<Value>Steps</Value>
</Value>
</Data>
<State>ActivityGoalsState</State>
<StreamLocation>^Fitbit.Api.C2A66.ActivityGoalsS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
