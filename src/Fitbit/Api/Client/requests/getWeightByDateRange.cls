Class Fitbit.Api.Client.requests.getWeightByDateRange Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "get";

Parameter URL = "/1/user/-/body/log/weight/date/{base-date}/{end-date}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The range start date in the format yyyy-MM-dd or today.
Property pathbasedate As %String(MAXLEN = "");

/// The end date of the range.
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
<Data name="getWeightByDateRangeDefaultData">
<Subscript>"getWeightByDateRange"</Subscript>
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
<DefaultData>getWeightByDateRangeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
