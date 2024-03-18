Class Fitbit.Api.Client.requests.deleteWeightLog Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "delete";

Parameter URL = "/1/user/-/body/log/weight/{body-weight-log-id}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The ID of the body weight log entry.
Property pathbodyweightlogid As %Integer;

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{body-weight-log-id}", ..pathbodyweightlogid)
	Quit sc
}

Storage Default
{
<Data name="deleteWeightLogDefaultData">
<Subscript>"deleteWeightLog"</Subscript>
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
<Value>pathbodyweightlogid</Value>
</Value>
</Data>
<DefaultData>deleteWeightLogDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
