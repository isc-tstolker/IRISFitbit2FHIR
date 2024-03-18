Class Fitbit.Api.Client.requests.getAZMByIntervalTimeSeriesIntraday Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "get";

Parameter URL = "/1/user/-/activities/active-zone-minutes/date/{start-date}/{end-date}/time/{start-time}/{end-time}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The detail for which data will be returned. **Support:** 1min | 5min | 15min
Property pathdetaillevel As %String(MAXLEN = "");

/// The date in the format yyyy-MM-dd or today
Property pathenddate As %String(MAXLEN = "");

/// The end of the period in the format HH:mm.
Property pathendtime As %String(MAXLEN = "");

/// The date in the format yyyy-MM-dd or today
Property pathstartdate As %String(MAXLEN = "");

/// The start of the period in the format HH:mm.
Property pathstarttime As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{start-date}", ..pathstartdate)
	Set ..%URL = $Replace(..%URL,"{end-date}", ..pathenddate)
	Set ..%URL = $Replace(..%URL,"{detail-level}", ..pathdetaillevel)
	Set ..%URL = $Replace(..%URL,"{start-time}", ..pathstarttime)
	Set ..%URL = $Replace(..%URL,"{end-time}", ..pathendtime)
	Quit sc
}

Storage Default
{
<Data name="getAZMByIntervalTimeSeriesIntradayDefaultData">
<Subscript>"getAZMByIntervalTimeSeriesIntraday"</Subscript>
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
<Value>pathdetaillevel</Value>
</Value>
<Value name="5">
<Value>pathenddate</Value>
</Value>
<Value name="6">
<Value>pathendtime</Value>
</Value>
<Value name="7">
<Value>pathstartdate</Value>
</Value>
<Value name="8">
<Value>pathstarttime</Value>
</Value>
</Data>
<DefaultData>getAZMByIntervalTimeSeriesIntradayDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
