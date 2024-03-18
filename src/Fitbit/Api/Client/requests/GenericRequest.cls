/// Generic Request class, holds the user context
Class Fitbit.Api.Client.requests.GenericRequest Extends (Ens.Request, %JSON.Adaptor)
{

/// Fitbit UserId
Property UserId As %String(%JSONFIELDNAME = "ownerId") [ InitialExpression = "4D8CR2" ];

/// Sync or Async?
Property Async As %Boolean(%JSONINCLUDE = "NONE") [ InitialExpression = 0 ];

Storage Default
{
<Data name="GenericRequestDefaultData">
<Subscript>"GenericRequest"</Subscript>
<Value name="1">
<Value>UserId</Value>
</Value>
<Value name="2">
<Value>Async</Value>
</Value>
</Data>
<DefaultData>GenericRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
