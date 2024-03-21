/// Activity Summary
Class Fitbit.Api.Client.model.ActivitySummary Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor) [ Inheritance = left, ProcedureBlock ]
{

/// Ignore invalid fields
Parameter %JSONIGNOREINVALIDFIELD = 1;

/// "activityCalories": 2834,
Property ActivityCalories As %Integer(%JSONFIELDNAME = "activityCalories");

/// "caloriesBMR": 1956,
Property CaloriesBMR As %Integer(%JSONFIELDNAME = "caloriesBMR");

/// "caloriesOut": 4266,
Property CaloriesOut As %Integer(%JSONFIELDNAME = "caloriesOut");

/// "lightlyActiveMinutes": 287,
Property LightlyActiveMinutes As %Integer(%JSONFIELDNAME = "lightlyActiveMinutes");

/// "marginalCalories": 1220,
Property MarginalCalories As %Integer(%JSONFIELDNAME = "marginalCalories");

/// "restingHeartRate": 59,
Property RestingHeartRate As %Integer(%JSONFIELDNAME = "restingHeartRate");

/// "sedentaryMinutes": 582,
Property SedentaryMinutes As %Integer(%JSONFIELDNAME = "sedentaryMinutes");

/// "steps": 12403,
Property Steps As %Integer(%JSONFIELDNAME = "steps");

/// "veryActiveMinutes": 59
Property VeryActiveMinutes As %Integer(%JSONFIELDNAME = "veryActiveMinutes");

Storage Default
{
<Data name="ActivitySummaryState">
<Value name="1">
<Value>LightlyActiveMinutes</Value>
</Value>
<Value name="2">
<Value>MarginalCalories</Value>
</Value>
<Value name="3">
<Value>RestingHeartRate</Value>
</Value>
<Value name="4">
<Value>SedentaryMinutes</Value>
</Value>
<Value name="5">
<Value>Steps</Value>
</Value>
<Value name="6">
<Value>VeryActiveMinutes</Value>
</Value>
<Value name="7">
<Value>ActivityCalories</Value>
</Value>
<Value name="8">
<Value>CaloriesBMR</Value>
</Value>
<Value name="9">
<Value>CaloriesOut</Value>
</Value>
</Data>
<State>ActivitySummaryState</State>
<StreamLocation>^Fitbit.Api2A66.ActivitySum7655S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
