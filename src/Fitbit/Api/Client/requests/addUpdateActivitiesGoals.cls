Class Fitbit.Api.Client.requests.addUpdateActivitiesGoals Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1/user/-/activities/goals/{period}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// daily or weekly.
Property pathperiod As %String(MAXLEN = "");

/// goal type
Property querytype As %String(MAXLEN = "");

/// goal value
Property queryvalue As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{period}", ..pathperiod)
	If (..querytype '= "") {
		Do httpRequest.SetParam("type",..querytype)
	}
	If (..queryvalue '= "") {
		Do httpRequest.SetParam("value",..queryvalue)
	}
	Quit sc
}

Storage Default
{
<Data name="addUpdateActivitiesGoalsDefaultData">
<Subscript>"addUpdateActivitiesGoals"</Subscript>
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
<Value name="5">
<Value>querytype</Value>
</Value>
<Value name="6">
<Value>queryvalue</Value>
</Value>
</Data>
<DefaultData>addUpdateActivitiesGoalsDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
