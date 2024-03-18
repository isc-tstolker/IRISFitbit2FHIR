/// Generic Response Class
Class Fitbit.Api.Client.responses.GenericResponse Extends Ens.Response [ Inheritance = left, ProcedureBlock ]
{

Property body As %Stream.GlobalCharacter;

Property headers As array Of %String(MAXLEN = 128, TRUNCATE = 1);

Property httpStatusCode As %Integer;

Property operation As %String(MAXLEN = 128, TRUNCATE = 1);

/// Status for parts of the response handling like JSON Parsing. 
/// This allows for returning the response body that will not be returned if the request fails.
Property status As %Status;

Method LoadFromResponse(httpResponse As %Net.HttpResponse, caller As %String = "") As %Status
{
	Set sc = $$$OK
	Do ..body.CopyFrom(httpResponse.Data)
	Set ..httpStatusCode = httpResponse.StatusCode
	Set ..operation = caller
	Set key = ""
	For  {
		Set key = $Order(httpResponse.Headers(key), 1, headerValue)
		Quit:key=""
		Do ..headers.SetAt(headerValue, key)
	}
	Quit sc
}

Storage Default
{
<Data name="GenericResponseDefaultData">
<Subscript>"GenericResponse"</Subscript>
<Value name="1">
<Value>body</Value>
</Value>
<Value name="2">
<Value>httpStatusCode</Value>
</Value>
<Value name="3">
<Value>operation</Value>
</Value>
<Value name="4">
<Value>status</Value>
</Value>
</Data>
<Data name="headers">
<Attribute>headers</Attribute>
<Structure>subnode</Structure>
<Subscript>"Fitbit.Api.Client.responses.GenericResponse.headers"</Subscript>
</Data>
<DefaultData>GenericResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
