/// GetActivities request
Class Fitbit.Api.Client.requests.getActivitiesByDate Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "get";

Parameter URL = "/1/user/-/activities/date/{date}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The date in the format yyyy-MM-dd
Property pathdate As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{date}", ..pathdate)
	Quit sc
}

Storage Default
{
<Data name="getActivitiesByDateDefaultData">
<Subscript>"getActivitiesByDate"</Subscript>
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
<Value>pathdate</Value>
</Value>
</Data>
<DefaultData>getActivitiesByDateDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
