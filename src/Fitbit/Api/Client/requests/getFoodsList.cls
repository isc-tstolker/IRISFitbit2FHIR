Class Fitbit.Api.Client.requests.getFoodsList Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "get";

Parameter URL = "/1/foods/search.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The URL-encoded search query.
Property queryquery As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	If (..queryquery '= "") {
		Do httpRequest.SetParam("query",..queryquery)
	}
	Quit sc
}

Storage Default
{
<Data name="getFoodsListDefaultData">
<Subscript>"getFoodsList"</Subscript>
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
<Value>queryquery</Value>
</Value>
</Data>
<DefaultData>getFoodsListDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
