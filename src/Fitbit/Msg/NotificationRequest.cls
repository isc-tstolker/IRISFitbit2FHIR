/// Notification as received from Fitbit
Class Fitbit.Msg.NotificationRequest Extends (Fitbit.Api.Client.requests.GenericRequest, %JSON.Adaptor)
{

/// Sample Notification from https://dev.fitbit.com/build/reference/web-api/developer-guide/using-subscriptions/#Aggregation-of-Updates
XData UpdateNotification [ MimeType = application/json ]
{
[
    {
        "collectionType": "foods",
        "date": "2010-03-01",
        "ownerId": "USER_1",
        "ownerType": "user",
        "subscriptionId": "1234"
    }, {
        "collectionType": "foods",
        "date": "2010-03-02",
        "ownerId": "USER_1",
        "ownerType": "user",
        "subscriptionId": "1234"
    }, {
        "collectionType": "activities",
        "date": "2010-03-01",
        "ownerId": "X1Y2Z3",
        "ownerType": "user",
        "subscriptionId": "2345"
    }
]
}

/// Sample Notification from https://dev.fitbit.com/build/reference/web-api/developer-guide/using-subscriptions/#Notifications-of-Users-Revoking-Consent
XData RevokedConsent [ MimeType = application/json ]
{
[
  {
    "collectionType": "userRevokedAccess",
    "date": "2020-06-02",
    "ownerId": "X1Y2Z3",
    "ownerType": "user",
    "subscriptionId": "2345"
  }
]
}

/// Sample Notification from https://dev.fitbit.com/build/reference/web-api/developer-guide/using-subscriptions/#Notification-of-Deleted-Users
XData Deleteduser [ MimeType = application/json ]
{
{
    "collectionType": "deleteUser",
    "date": "2018-04-20",
    "ownerId": "X1Y2Z3",
    "ownerType": "user",
    "subscriptionId": "123"
}
}

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
