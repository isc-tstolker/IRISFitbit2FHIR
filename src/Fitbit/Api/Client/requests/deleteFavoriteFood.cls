Class Fitbit.Api.Client.requests.deleteFavoriteFood Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "delete";

Parameter URL = "/1/user/-/foods/log/favorite/{food-id}.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The ID of the food to be deleted from user's favorites.
Property pathfoodid As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{food-id}", ..pathfoodid)
	Quit sc
}

Storage Default
{
<Data name="deleteFavoriteFoodDefaultData">
<Subscript>"deleteFavoriteFood"</Subscript>
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
<Value>pathfoodid</Value>
</Value>
</Data>
<DefaultData>deleteFavoriteFoodDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
