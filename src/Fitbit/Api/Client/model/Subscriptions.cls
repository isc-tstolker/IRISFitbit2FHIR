/// Subscriptions List
Class Fitbit.Api.Client.model.Subscriptions Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor) [ Inheritance = left, ProcedureBlock ]
{

/// List of subscriptions
Property Subscriptions As list Of Fitbit.Api.Client.model.Subscription(%JSONFIELDNAME = "apiSubscriptions");

/// Subscribe for the specified data source(s)
Method Subscribe(process As Fitbit.BP.AddOrUpdateUser, userId As %String, collection As %String = "")
{
    if '..HasSubscriptionFor(collection)
    {
        set request = ##class(Fitbit.Api.Client.requests.addSubscriptions).%New()
        set request.UserId = userId
        // This is the resource of the collection to receive notifications from (foods, activities, sleep, or body).
        // If not present, subscription will be created for all collections.
        // If you have both all and specific collection subscriptions, you will get duplicate notifications on that collections' updates.
        // Each subscriber can have only one subscription for a specific user's collection.
        set request.pathcollectionpath = collection

        // Unique ID of the subscription created by the API client application. 
        // Each ID must be unique across the entire set of subscribers and collections.
        // The Fitbit servers will pass this ID back along with any notifications about the user indicated by the user parameter in the URL path.
        set request.pathsubscriptionid = $ZCONVERT($System.Util.CreateGUID(), "L")

        $$$ThrowOnError(process.SendRequestSync(process.FitbitWebAPI, request, .response))
    }
}

/// HasSubscriptionFor
Method HasSubscriptionFor(collectionType As %String = "") As %Boolean
{
    if (collectionType = "")
    {
        set collectionType = "user"
    }

    for index = 1:1:..Subscriptions.Count()
    {
        #dim subscription as Fitbit.Api.Client.model.Subscription = ..Subscriptions.GetAt(index)

        if subscription.CollectionType = collectionType
        {
            set subscription.IsInUse = 1
            return 1
        }
    }

    return 0
}

/// Delete subscriptions
Method DeleteUnusedSubscriptions(process As Fitbit.BP.AddOrUpdateUser)
{
    for index = 1:1:..Subscriptions.Count()
    {
        #dim subscription as Fitbit.Api.Client.model.Subscription = ..Subscriptions.GetAt(index)

        if 'subscription.IsInUse
        {
            set request = ##class(Fitbit.Api.Client.requests.deleteSubscriptions).%New()
            set request.UserId = subscription.OwnerId
            set request.pathcollectionpath = subscription.CollectionType
            set request.pathsubscriptionid = subscription.SubscriptionId

            $$$ThrowOnError(process.SendRequestSync(process.FitbitWebAPI, request, .response))
        }
    }
}

Storage Default
{
<Data name="SubscriptionsState">
<Value name="1">
<Value>Subscriptions</Value>
</Value>
</Data>
<State>SubscriptionsState</State>
<StreamLocation>^Fitbit.Api.C2A66.SubscriptionsS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
