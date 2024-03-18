Class Fitbit.Api.Client.requests.getHrvSummaryInterval Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "get";

Parameter URL = "/1/user/-/hrv/date/{startDate}/{endDate}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The date in the format of yyyy-MM-dd or today.
Property pathendDate As %String(MAXLEN = "");

/// The date in the format of yyyy-MM-dd or today.
Property pathstartDate As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{startDate}", ..pathstartDate)
	Set ..%URL = $Replace(..%URL,"{endDate}", ..pathendDate)
	Quit sc
}

Storage Default
{
<Data name="getHrvSummaryIntervalDefaultData">
<Subscript>"getHrvSummaryInterval"</Subscript>
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
<Value>pathendDate</Value>
</Value>
<Value name="5">
<Value>pathstartDate</Value>
</Value>
</Data>
<DefaultData>getHrvSummaryIntervalDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
