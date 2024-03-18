Class Fitbit.Api.Client.requests.introspect Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1.1/oauth2/introspect";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "") [ InitialExpression = "application/x-www-form-urlencoded" ];

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// Use this property for body content with content-type = application/x-www-form-urlencoded.
Property body As %Stream.Object;

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	If $Piece($$$LOWER(..%ContentType),";",1) = "application/x-www-form-urlencoded" Do httpRequest.EntityBody.CopyFrom(..body)
	Quit sc
}

Storage Default
{
<Data name="introspectDefaultData">
<Subscript>"introspect"</Subscript>
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
<Value>body</Value>
</Value>
</Data>
<DefaultData>introspectDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
