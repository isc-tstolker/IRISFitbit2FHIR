/// Activity Resource Value
Class Fitbit.Api.Client.model.ActivityResourceValue Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor) [ Inheritance = left, ProcedureBlock ]
{

/// "dateTime": "2024-01-01",
Property DateTime As %String(%JSONFIELDNAME = "dateTime");

/// "value": "13773"
Property Value As %String(%JSONFIELDNAME = "value");

Storage Default
{
<Data name="ActivityResourceValueState">
<Value name="1">
<Value>DateTime</Value>
</Value>
<Value name="2">
<Value>Value</Value>
</Value>
</Data>
<State>ActivityResourceValueState</State>
<StreamLocation>^Fitbit.Api2A66.ActivityRes30FBS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
