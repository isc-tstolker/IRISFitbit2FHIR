Class Fitbit.Api.Client.requests.getActivitiesGoals Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "get";

Parameter URL = "/1/user/-/activities/goals/{period}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// daily or weekly.
Property pathperiod As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{period}", ..pathperiod)
	Quit sc
}

Storage Default
{
<Data name="getActivitiesGoalsDefaultData">
<Subscript>"getActivitiesGoals"</Subscript>
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
<Value>pathperiod</Value>
</Value>
</Data>
<DefaultData>getActivitiesGoalsDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
