Class Fitbit.Api.Client.requests.deleteActivitiesLog Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "delete";

Parameter URL = "/1/user/-/activities/{activity-log-id}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The id of the activity log entry.
Property pathactivitylogid As %Integer;

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{activity-log-id}", ..pathactivitylogid)
	Quit sc
}

Storage Default
{
<Data name="deleteActivitiesLogDefaultData">
<Subscript>"deleteActivitiesLog"</Subscript>
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
<Value>pathactivitylogid</Value>
</Value>
</Data>
<DefaultData>deleteActivitiesLogDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
