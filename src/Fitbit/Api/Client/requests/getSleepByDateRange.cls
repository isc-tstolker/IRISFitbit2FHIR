Class Fitbit.Api.Client.requests.getSleepByDateRange Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "get";

Parameter URL = "/1.2/user/-/sleep/date/{base-date}/{end-date}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The date of records to be returned. In the format yyyy-MM-dd.
Property pathbasedate As %String(MAXLEN = "");

/// The date of records to be returned. In the format yyyy-MM-dd.
Property pathenddate As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{base-date}", ..pathbasedate)
	Set ..%URL = $Replace(..%URL,"{end-date}", ..pathenddate)
	Quit sc
}

Storage Default
{
<Data name="getSleepByDateRangeDefaultData">
<Subscript>"getSleepByDateRange"</Subscript>
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
<Value>pathbasedate</Value>
</Value>
<Value name="5">
<Value>pathenddate</Value>
</Value>
</Data>
<DefaultData>getSleepByDateRangeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
