Class Fitbit.Api.Client.requests.getAZMByDateIntraday Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "get";

Parameter URL = "/1/user/-/activities/active-zone-minutes/date/{date}/1d/{detail-level}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The date in the format yyyy-MM-dd or today
Property pathdate As %String(MAXLEN = "");

/// The detail for which data will be returned. **Supported:** 1min | 5min | 15min
Property pathdetaillevel As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{date}", ..pathdate)
	Set ..%URL = $Replace(..%URL,"{detail-level}", ..pathdetaillevel)
	Quit sc
}

Storage Default
{
<Data name="getAZMByDateIntradayDefaultData">
<Subscript>"getAZMByDateIntraday"</Subscript>
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
</Data>
<DefaultData>getAZMByDateIntradayDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
