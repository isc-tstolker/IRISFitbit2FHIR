Class Fitbit.Api.Client.requests.getActivitiesResourceByDateRangeIntraday Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "get";

Parameter URL = "/1/user/-/activities/{resource-path}/date/{base-date}/{end-date}/{detail-level}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The date in the format yyyy-MM-dd or today.
Property pathbasedate As %String(MAXLEN = "");

/// Number of data points to include. Either 1min or 15min. Optional.
Property pathdetaillevel As %String(MAXLEN = "");

/// The date in the format yyyy-MM-dd or today.
Property pathenddate As %String(MAXLEN = "");

/// The resource-path; see options in the Resource Path Options section in the full documentation.
Property pathresourcepath As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{resource-path}", ..pathresourcepath)
	Set ..%URL = $Replace(..%URL,"{base-date}", ..pathbasedate)
	Set ..%URL = $Replace(..%URL,"{end-date}", ..pathenddate)
	Set ..%URL = $Replace(..%URL,"{detail-level}", ..pathdetaillevel)
	Quit sc
}

Storage Default
{
<Data name="getActivitiesResourceByDateRangeIntradayDefaultData">
<Subscript>"getActivitiesResourceByDateRangeIntraday"</Subscript>
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
<Value>pathdetaillevel</Value>
</Value>
<Value name="6">
<Value>pathenddate</Value>
</Value>
<Value name="7">
<Value>pathresourcepath</Value>
</Value>
</Data>
<DefaultData>getActivitiesResourceByDateRangeIntradayDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
