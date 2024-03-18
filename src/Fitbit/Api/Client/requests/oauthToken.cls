Class Fitbit.Api.Client.requests.oauthToken Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/oauth2/token";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The Authorization header must be set to 'Basic' followed by a space, then the Base64 encoded string of your application's client id and secret concatenated with a colon. For example, 'Basic Y2xpZW50X2lkOmNsaWVudCBzZWNyZXQ='. The Base64 encoded string, 'Y2xpZW50X2lkOmNsaWVudCBzZWNyZXQ=', is decoded as 'client_id:client secret'.
Property headerAuthorization As %String(MAXLEN = "");

/// This is your Fitbit API application id from your settings on dev.fitbit.com.
Property queryclientid As %String(MAXLEN = "");

/// Authorization code received in the redirect as URI parameter. Required if using the Authorization Code flow.
Property querycode As %String(MAXLEN = "");

/// Specify the desired access token lifetime. Defaults to 28800 for 8 hours. The other valid value is 3600 for 1 hour.
Property queryexpiresin As %String(MAXLEN = "");

/// Authorization grant type. Valid values are 'authorization_code' and 'refresh_token'.
Property querygranttype As %String(MAXLEN = "");

/// Uri to which the access token will be sent if the request is successful. Required if specified in the redirect to the authorization page. Must be exact match.
Property queryredirecturi As %String(MAXLEN = "");

/// Refresh token issued by Fitbit. Required if 'grant_type' is 'refresh_token'.
Property queryrefreshtoken As %String(MAXLEN = "");

/// Required if specified in the redirect uri of the authorization page. Must be an exact match.
Property querystate As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Do httpRequest.SetHeader("Authorization", ..headerAuthorization)
	If (..querycode '= "") {
		Do httpRequest.SetParam("code",..querycode)
	}
	If (..queryclientid '= "") {
		Do httpRequest.SetParam("client_id",..queryclientid)
	}
	If (..queryexpiresin '= "") {
		Do httpRequest.SetParam("expires_in",..queryexpiresin)
	}
	If (..querygranttype '= "") {
		Do httpRequest.SetParam("grant_type",..querygranttype)
	}
	If (..queryredirecturi '= "") {
		Do httpRequest.SetParam("redirect_uri",..queryredirecturi)
	}
	If (..queryrefreshtoken '= "") {
		Do httpRequest.SetParam("refresh_token",..queryrefreshtoken)
	}
	If (..querystate '= "") {
		Do httpRequest.SetParam("state",..querystate)
	}
	Quit sc
}

Storage Default
{
<Data name="oauthTokenDefaultData">
<Subscript>"oauthToken"</Subscript>
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
<Value>headerAuthorization</Value>
</Value>
<Value name="5">
<Value>queryclientid</Value>
</Value>
<Value name="6">
<Value>querycode</Value>
</Value>
<Value name="7">
<Value>queryexpiresin</Value>
</Value>
<Value name="8">
<Value>querygranttype</Value>
</Value>
<Value name="9">
<Value>queryredirecturi</Value>
</Value>
<Value name="10">
<Value>queryrefreshtoken</Value>
</Value>
<Value name="11">
<Value>querystate</Value>
</Value>
</Data>
<DefaultData>oauthTokenDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
