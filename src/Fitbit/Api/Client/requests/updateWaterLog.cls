Class Fitbit.Api.Client.requests.updateWaterLog Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1/user/-/foods/log/water/{water-log-id}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The ID of the waterUnit log entry to be deleted.
Property pathwaterlogid As %String(MAXLEN = "");

/// Amount consumed; in the format X.X and in the specified waterUnit or in the unit system that corresponds to the Accept-Language header provided.
Property queryamount As %String(MAXLEN = "");

/// Water measurement unit. 'ml', 'fl oz', or 'cup'.
Property queryunit As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{water-log-id}", ..pathwaterlogid)
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
<Data name="updateWaterLogDefaultData">
<Subscript>"updateWaterLog"</Subscript>
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
<Value>pathwaterlogid</Value>
</Value>
<Value name="5">
<Value>queryamount</Value>
</Value>
<Value name="6">
<Value>queryunit</Value>
</Value>
</Data>
<DefaultData>updateWaterLogDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
