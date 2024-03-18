Class Fitbit.Api.Client.requests.getHeartByDateTimestampIntraday Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "get";

Parameter URL = "/1/user/-/activities/heart/date/{date}/1d/{detail-level}/time/{start-time}/{end-time}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The date in the format of yyyy-MM-dd or today.
Property pathdate As %String(MAXLEN = "");

/// The number of data points to include either 1sec, 1min, 5min or 15min.
Property pathdetaillevel As %String(MAXLEN = "");

/// The end time of the period in the format of HH:mm.
Property pathendtime As %String(MAXLEN = "");

/// The start of the period in the format of HH:mm.
Property pathstarttime As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{date}", ..pathdate)
	Set ..%URL = $Replace(..%URL,"{detail-level}", ..pathdetaillevel)
	Set ..%URL = $Replace(..%URL,"{start-time}", ..pathstarttime)
	Set ..%URL = $Replace(..%URL,"{end-time}", ..pathendtime)
	Quit sc
}

Storage Default
{
<Data name="getHeartByDateTimestampIntradayDefaultData">
<Subscript>"getHeartByDateTimestampIntraday"</Subscript>
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
<Value>pathdetaillevel</Value>
</Value>
<Value name="6">
<Value>pathendtime</Value>
</Value>
<Value name="7">
<Value>pathstarttime</Value>
</Value>
</Data>
<DefaultData>getHeartByDateTimestampIntradayDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
