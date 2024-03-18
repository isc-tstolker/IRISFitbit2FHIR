Class Fitbit.Api.Client.requests.addWeightLog Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1/user/-/body/log/weight.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// Log entry date in the format yyyy-MM-dd.
Property querydate As %String(MAXLEN = "");

/// Time of the measurement; hours and minutes in the format of HH:mm:ss, which is set to the last second of the day if not provided.
Property querytime As %String(MAXLEN = "");

/// Weight in the format of X.XX.
Property queryweight As %Integer;

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	If (..queryweight '= "") {
		Do httpRequest.SetParam("weight",..queryweight)
	}
	If (..querydate '= "") {
		Do httpRequest.SetParam("date",..querydate)
	}
	If (..querytime '= "") {
		Do httpRequest.SetParam("time",..querytime)
	}
	Quit sc
}

Storage Default
{
<Data name="addWeightLogDefaultData">
<Subscript>"addWeightLog"</Subscript>
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
<Value>querydate</Value>
</Value>
<Value name="5">
<Value>querytime</Value>
</Value>
<Value name="6">
<Value>queryweight</Value>
</Value>
</Data>
<DefaultData>addWeightLogDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
