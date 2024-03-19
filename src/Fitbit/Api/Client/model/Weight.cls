/// Weight
Class Fitbit.Api.Client.model.Weight Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor) [ Inheritance = left, ProcedureBlock ]
{

/// "bmi": 25.87,
Property BMI As %Numeric(%JSONFIELDNAME = "bmi");

/// "date": "2024-03-18",
Property Date As %String(%JSONFIELDNAME = "date");

/// "fat": 22.496999740600587,
Property Fat As %Numeric(%JSONFIELDNAME = "fat");

/// "logId": 1710747275000,
Property LogId As %Integer(%JSONFIELDNAME = "logId");

/// "source": "Aria",
Property Source As %String(%JSONFIELDNAME = "source");

/// "time": "07:34:35",
Property Time As %String(%JSONFIELDNAME = "time");

/// "weight": 100.4
Property Weight As %Numeric(%JSONFIELDNAME = "weight");

Storage Default
{
<Data name="WeightState">
<Value name="1">
<Value>BMI</Value>
</Value>
<Value name="2">
<Value>Date</Value>
</Value>
<Value name="3">
<Value>Fat</Value>
</Value>
<Value name="4">
<Value>logId</Value>
</Value>
<Value name="5">
<Value>Source</Value>
</Value>
<Value name="6">
<Value>Time</Value>
</Value>
<Value name="7">
<Value>Weight</Value>
</Value>
<Value name="8">
<Value>LogId</Value>
</Value>
</Data>
<State>WeightState</State>
<StreamLocation>^Fitbit.Api.Client.m2A66.WeightS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
