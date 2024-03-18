Class Fitbit.Api.Client.requests.deleteSleep Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "delete";

Parameter URL = "/1.2/user/-/sleep/{log-id}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The ID of the sleep log to be deleted.
Property pathlogid As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{log-id}", ..pathlogid)
	Quit sc
}

Storage Default
{
<Data name="deleteSleepDefaultData">
<Subscript>"deleteSleep"</Subscript>
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
<Value>pathlogid</Value>
</Value>
</Data>
<DefaultData>deleteSleepDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
