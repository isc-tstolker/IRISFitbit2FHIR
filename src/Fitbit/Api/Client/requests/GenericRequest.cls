/// Generic Request class, holds the user context
Class Fitbit.Api.Client.requests.GenericRequest Extends Ens.Request
{

/// Fitbit UserId
Property UserId As %String [ InitialExpression = "4D8CR2" ];

Storage Default
{
<Data name="GenericRequestDefaultData">
<Subscript>"GenericRequest"</Subscript>
<Value name="1">
<Value>UserId</Value>
</Value>
</Data>
<DefaultData>GenericRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
