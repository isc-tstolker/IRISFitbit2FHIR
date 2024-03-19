/// Returned from getProfile
Class Fitbit.Api.Client.model.User Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor) [ Inheritance = left, ProcedureBlock ]
{

/// List of subscriptions
Property Profile As Fitbit.Api.Client.model.Profile(%JSONFIELDNAME = "user");

Storage Default
{
<Data name="UserState">
<Value name="1">
<Value>Profile</Value>
</Value>
</Data>
<State>UserState</State>
<StreamLocation>^Fitbit.Api.Client.model.UserS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
