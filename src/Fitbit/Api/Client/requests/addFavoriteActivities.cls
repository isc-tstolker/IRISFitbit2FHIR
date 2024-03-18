Class Fitbit.Api.Client.requests.addFavoriteActivities Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1/user/-/activities/favorite/{activity-id}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The encoded ID of the activity.
Property pathactivityid As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{activity-id}", ..pathactivityid)
	Quit sc
}

Storage Default
{
<Data name="addFavoriteActivitiesDefaultData">
<Subscript>"addFavoriteActivities"</Subscript>
<Value name="1">
<Value>%Consume</Value>
</Value>
<Value name="2">
<Value>%ContentType</Value>
</Value>
<Value name="3">
<Value>%URL</Value>
</Value>
<Value name="4">
<Value>pathactivityid</Value>
</Value>
</Data>
<DefaultData>addFavoriteActivitiesDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
