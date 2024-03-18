Class Fitbit.Api.Client.requests.addBodyFatLog Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1/user/-/body/log/fat.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// Log entry date in the format yyyy-MM-dd.
Property querydate As %String(MAXLEN = "");

/// Body fat in the format of X.XX in the unit system that corresponds to the Accept-Language header provided.
Property queryfat As %Integer;

/// Time of the measurement in hours and minutes in the format HH:mm:ss that is set to the last second of the day if not provided.
Property querytime As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	If (..queryfat '= "") {
		Do httpRequest.SetParam("fat",..queryfat)
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
<Data name="addBodyFatLogDefaultData">
<Subscript>"addBodyFatLog"</Subscript>
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
<Value>queryfat</Value>
</Value>
<Value name="6">
<Value>querytime</Value>
</Value>
</Data>
<DefaultData>addBodyFatLogDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
