/// Notification as received from Fitbit
Class Fitbit.Msg.NotificationRequest Extends (Fitbit.Api.Client.requests.GenericRequest, %JSON.Adaptor)
{

/// Collection Type
Property CollectionType As %String(%JSONFIELDNAME = "collectionType");

/// Date
Property Date As %String(%JSONFIELDNAME = "date");

/// ownerId is mapped to GenericRequest.UserId  
/// Owner Type
Property OwnerType As %String(%JSONFIELDNAME = "ownerType");

/// Owner Type
Property SubscriptionId As %String(%JSONFIELDNAME = "subscriptionId", MAXLEN = 50);

Storage Default
{
<Data name="NotificationRequestDefaultData">
<Subscript>"NotificationRequest"</Subscript>
<Value name="1">
<Value>CollectionType</Value>
</Value>
<Value name="2">
<Value>Date</Value>
</Value>
<Value name="3">
<Value>OwnerType</Value>
</Value>
<Value name="4">
<Value>SubscriptionId</Value>
</Value>
</Data>
<DefaultData>NotificationRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
