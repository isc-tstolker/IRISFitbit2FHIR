Class Fitbit.Api.Client.requests.getSleepList Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "get";

Parameter URL = "/1.2/user/-/sleep/list.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The date in the format yyyy-MM-ddTHH:mm:ss.
Property queryafterDate As %String(MAXLEN = "");

/// The date in the format yyyy-MM-ddTHH:mm:ss. Only yyyy-MM-dd is required. Either beforeDate or afterDate should be specified.
Property querybeforeDate As %String(MAXLEN = "");

/// The maximum number of entries returned (maximum;100).
Property querylimit As %Integer;

/// The offset number of entries.
Property queryoffset As %Integer;

/// The sort order of entries by date asc (ascending) or desc (descending).
Property querysort As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	If (..querybeforeDate '= "") {
		Do httpRequest.SetParam("beforeDate",..querybeforeDate)
	}
	If (..queryafterDate '= "") {
		Do httpRequest.SetParam("afterDate",..queryafterDate)
	}
	If (..querysort '= "") {
		Do httpRequest.SetParam("sort",..querysort)
	}
	If (..queryoffset '= "") {
		Do httpRequest.SetParam("offset",..queryoffset)
	}
	If (..querylimit '= "") {
		Do httpRequest.SetParam("limit",..querylimit)
	}
	Quit sc
}

Storage Default
{
<Data name="getSleepListDefaultData">
<Subscript>"getSleepList"</Subscript>
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
<Value>queryafterDate</Value>
</Value>
<Value name="5">
<Value>querybeforeDate</Value>
</Value>
<Value name="6">
<Value>querylimit</Value>
</Value>
<Value name="7">
<Value>queryoffset</Value>
</Value>
<Value name="8">
<Value>querysort</Value>
</Value>
</Data>
<DefaultData>getSleepListDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
