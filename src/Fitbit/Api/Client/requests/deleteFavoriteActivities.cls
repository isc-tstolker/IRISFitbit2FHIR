Class Fitbit.Api.Client.requests.deleteFavoriteActivities Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "delete";

Parameter URL = "/1/user/-/activities/favorite/{activity-id}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The ID of the activity to be removed.
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
<Data name="deleteFavoriteActivitiesDefaultData">
<Subscript>"deleteFavoriteActivities"</Subscript>
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
<DefaultData>deleteFavoriteActivitiesDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
