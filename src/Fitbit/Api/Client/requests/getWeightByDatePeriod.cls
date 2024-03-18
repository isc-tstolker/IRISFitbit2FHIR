Class Fitbit.Api.Client.requests.getWeightByDatePeriod Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "get";

Parameter URL = "/1/user/-/body/log/weight/date/{date}/{period}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The date in the format yyyy-MM-dd.
Property pathdate As %String(MAXLEN = "");

/// The range for which data will be returned. Options are 1d, 7d, 30d, 1w, 1m, 3m, 6m, 1y, or max.
Property pathperiod As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{date}", ..pathdate)
	Set ..%URL = $Replace(..%URL,"{period}", ..pathperiod)
	Quit sc
}

Storage Default
{
<Data name="getWeightByDatePeriodDefaultData">
<Subscript>"getWeightByDatePeriod"</Subscript>
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
<Value name="5">
<Value>pathperiod</Value>
</Value>
</Data>
<DefaultData>getWeightByDatePeriodDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
