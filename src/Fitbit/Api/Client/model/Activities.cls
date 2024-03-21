/// Activities
Class Fitbit.Api.Client.model.Activities Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor) [ Inheritance = left, ProcedureBlock ]
{

/// Summary for the day
Property Activities As list Of Fitbit.Api.Client.model.Activity(%JSONFIELDNAME = "activities");

/// Goals
Property Goals As Fitbit.Api.Client.model.ActivityGoals(%JSONFIELDNAME = "goals");

/// Summary for the day
Property Summary As Fitbit.Api.Client.model.ActivitySummary(%JSONFIELDNAME = "summary");

Storage Default
{
<Data name="ActivitiesState">
<Value name="1">
<Value>Activities</Value>
</Value>
<Value name="2">
<Value>Goals</Value>
</Value>
<Value name="3">
<Value>Summary</Value>
</Value>
</Data>
<State>ActivitiesState</State>
<StreamLocation>^Fitbit.Api.Clie2A66.ActivitiesS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
