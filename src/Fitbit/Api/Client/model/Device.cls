/// Fitbit Device
Class Fitbit.Api.Client.model.Device Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor) [ Inheritance = left, ProcedureBlock ]
{

/// Ignore invalid fields
Parameter %JSONIGNOREINVALIDFIELD = 1;

/// DeviceId
Property DeviceId As %String(%JSONFIELDNAME = "id");

/// MacAddress
Property MACAddress As %String(%JSONFIELDNAME = "mac");

/// Name
Property Name As %String(%JSONFIELDNAME = "deviceVersion");

/// Type e.g. TRACKER, SCALE
Property Type As %String(%JSONFIELDNAME = "type");

/// lastSyncTime e.g. "2024-03-18T22:55:04.000"
Property LastSyncTime As %String(%JSONFIELDNAME = "lastSyncTime");

/// Battery Level e.g. High / Low / empty
Property BatteryLevel As %String(%JSONFIELDNAME = "battery");

/// Battery percentage
Property BatteryPercentage As %Integer(%JSONFIELDNAME = "batteryLevel");

Storage Default
{
<Data name="DeviceState">
<Value name="1">
<Value>DeviceId</Value>
</Value>
<Value name="2">
<Value>MACAddress</Value>
</Value>
<Value name="3">
<Value>Name</Value>
</Value>
<Value name="4">
<Value>Type</Value>
</Value>
<Value name="5">
<Value>LastSyncTime</Value>
</Value>
<Value name="6">
<Value>BatteryLevel</Value>
</Value>
<Value name="7">
<Value>BatteryPercentage</Value>
</Value>
</Data>
<State>DeviceState</State>
<StreamLocation>^Fitbit.Api.Client.m2A66.DeviceS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
