/// Subscription returned from getSubscriptionsList
Class Fitbit.Api.Client.model.Subscription Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor) [ Inheritance = left, ProcedureBlock ]
{

/// Collection Type
Property CollectionType As %String(%JSONFIELDNAME = "collectionType");

/// Owner Id
Property OwnerId As %String(%JSONFIELDNAME = "ownerId");

/// Owner Type
Property OwnerType As %String(%JSONFIELDNAME = "ownerType");

/// Subscriber Id
Property SubscriberId As %String(%JSONFIELDNAME = "subscriberId", MAXLEN = 50);

/// Owner Type
Property SubscriptionId As %String(%JSONFIELDNAME = "subscriptionId", MAXLEN = 50);

/// Is In Use?
Property IsInUse As %Boolean(%JSONINCLUDE = "NONE");

Storage Default
{
<Data name="SubscriptionState">
<Value name="1">
<Value>CollectionType</Value>
</Value>
<Value name="2">
<Value>OwnerId</Value>
</Value>
<Value name="3">
<Value>OwnerType</Value>
</Value>
<Value name="4">
<Value>SubscriberId</Value>
</Value>
<Value name="5">
<Value>SubscriptionId</Value>
</Value>
<Value name="6">
<Value>IsInUse</Value>
</Value>
</Data>
<State>SubscriptionState</State>
<StreamLocation>^Fitbit.Api.Cl2A66.SubscriptionS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
