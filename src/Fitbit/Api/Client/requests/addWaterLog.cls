Class Fitbit.Api.Client.requests.addWaterLog Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1/user/-/foods/log/water.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The amount consumption in the format X.XX and in the specified waterUnit or in the unit system that corresponds to the Accept-Language header provided.
Property queryamount As %Integer;

/// The date of records to be returned in the format yyyy-MM-dd.
Property querydate As %String(MAXLEN = "");

/// Water measurement unit; `ml`, `fl oz`, or `cup`.
Property queryunit As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	If (..querydate '= "") {
		Do httpRequest.SetParam("date",..querydate)
	}
	If (..queryamount '= "") {
		Do httpRequest.SetParam("amount",..queryamount)
	}
	If (..queryunit '= "") {
		Do httpRequest.SetParam("unit",..queryunit)
	}
	Quit sc
}

Storage Default
{
<Data name="addWaterLogDefaultData">
<Subscript>"addWaterLog"</Subscript>
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
<Value>queryamount</Value>
</Value>
<Value name="5">
<Value>querydate</Value>
</Value>
<Value name="6">
<Value>queryunit</Value>
</Value>
</Data>
<DefaultData>addWaterLogDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
