Class Fitbit.Api.Client.requests.getAZMTimeSeriesByInterval Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "get";

Parameter URL = "/1/user/-/activities/active-zone-minutes/date/{start-date}/{end-date}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The date in the format yyyy-MM-dd or today
Property pathenddate As %String(MAXLEN = "");

/// The date in the format yyyy-MM-dd or today
Property pathstartdate As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{start-date}", ..pathstartdate)
	Set ..%URL = $Replace(..%URL,"{end-date}", ..pathenddate)
	Quit sc
}

Storage Default
{
<Data name="getAZMTimeSeriesByIntervalDefaultData">
<Subscript>"getAZMTimeSeriesByInterval"</Subscript>
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
<Value>pathenddate</Value>
</Value>
<Value name="5">
<Value>pathstartdate</Value>
</Value>
</Data>
<DefaultData>getAZMTimeSeriesByIntervalDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
