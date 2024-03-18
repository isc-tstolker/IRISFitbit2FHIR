Class Fitbit.Api.Client.requests.deleteMeal Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "delete";

Parameter URL = "/1/user/-/meals/{meal-id}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// Id of the meal to delete.
Property pathmealid As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{meal-id}", ..pathmealid)
	Quit sc
}

Storage Default
{
<Data name="deleteMealDefaultData">
<Subscript>"deleteMeal"</Subscript>
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
<Value>pathmealid</Value>
</Value>
</Data>
<DefaultData>deleteMealDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
