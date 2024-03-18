/// Page called after redirection
Class Fitbit.OAuth2Redirect Extends %CSP.Page
{

/// https://iris.dev.iscdev.nl/csp/healthshare/connectors/Fitbit.OAuth2Redirect.cls
/// The code verifier is created before Authorize and kept in the %session for use in the call to the token endpoint
ClassMethod OnPage() As %Status
{
	#dim %request As %CSP.Request
	#dim %response As %CSP.Response
	#dim %session as %CSP.Session

	set code = %request.Get("code")
	set token = ..GetToken(code, .sc)

	if $$$ISERR(sc)
	{
		return ..ErrorPage("GetToken failed:", sc)
	}

	set sc = ##class(Fitbit.DB.UserTokens).CreateOrUpdateUserFromToken(token)

	&html<<!doctype html>
<html>
<head>
<title>Module</title>
#(..CSS())#
</head>

<body>
<table>
  <tr><th>Issuer:</th><td>#(%session.Get("BaseURL"))#</td></tr>>
	
	&html<
  <tr><th colspan=2>Token properties:</th></tr>
#(..RenderTokenProperties(token))#

</table>
</body>
</html>>
	
	return $$$OK
}

/// Displays an error.
ClassMethod ErrorPage(message As %String = "", sc As %Status = "", args... As %String) As %Status
{
	for i = 1:1:$Get(args)
	{
		set message = $Replace(message, "{}", $Get(args(i)), , 1)
	}

	if 'sc, sc '= ""
	{
		if message '= ""
		{
			set message = message _ ": "
		}

		set message = message _ $System.Status.GetErrorText(sc)
	}
	
	&html<<!doctype html>
<html>
<head>
<title>Module</title>
</head>

<body>
<h1>Fout</h1>

<div class=Error>
#(..EscapeHTML(message))#
</div>

</body>
</html>>
	
	return $$$OK
}

/// Writes the CSS to use in the page
ClassMethod CSS() As %String
{
	&html<<style>

body {
  max-width: 200em;
  margin: 0.1em auto;
  background-color: AntiqueWhite;
  font-family: system-ui, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", "Liberation Sans", sans-serif;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
}
 
table {
  border-collapse: collapse;
  border-spacing: 1em 0;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
td, th {
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  padding: 0.6em 0.2em 0.6em 0.5em;
  vertical-align: baseline;
}

th {
  background-color: white;
  font-weight: normal;
  text-align: left;
}

th[colspan="2"] {
  background-color: #cdf;
}
th.sep {
  padding: 3px 0;
  background-color: goldenrod;
  border-top: 3px solid white;
  border-bottom: 3px solid white;
  border-radius: 5px;
}

td {
  background-color: #eef;
}
.jv td {
  background-color: #eee;
}

th+td {
  padding-left: 2em;
}
 
a {
  color: blue;
}

span.cos_00 {color: #FF0000; bgcolor: #ffffff; text-decoration: underline; }
span.cos_01 {}
span.cos_02 {}
span.cos_03 {color: #ff0000; }
span.cos_04 {color: #000000; }
span.cos_05 {color: #000080; }
span.cos_06 {color: #008000; }
span.cos_07 {color: #008000; }
span.cos_08 {color: #000000; }
span.cos_09 {color: #800080; }
span.cos_0A {color: #0000ff; }
span.cos_0B {color: #0000ff; }
span.cos_0C {color: #0000ff; }
span.cos_0D {color: #000000; }
span.cos_0E {color: #000000; }
span.cos_0F {color: #0000ff; }
span.cos_10 {color: #000000; }
span.cos_11 {color: #0000ff; }
span.cos_12 {color: #000000; }
span.cos_13 {color: #000000; }
span.cos_14 {color: #800000; }
span.cos_15 {color: #000000; }
span.cos_16 {color: #000000; }
span.cos_17 {color: #000000; }
span.cos_18 {color: #000000; }
span.cos_19 {color: #000000; }
span.cos_1A {color: #000000; }
span.cos_1B {color: #0000ff; }
span.cos_1C {color: #0000ff; }
span.cos_1D {color: #800080; }
span.cos_1E {color: #0000ff; }
span.cos_1F {color: #008080; }
span.cos_20 {color: #0000ff; }
span.cos_21 {color: #000000; }
span.cos_22 {}
span.cos_23 {color: #0000ff; }
span.cos_24 {color: #0000ff; }
span.cos_25 {color: #000080; }
span.cos_26 {}
span.cos_27 {}
span.cos_28 {}
span.cos_29 {color: #808000; }
span.cos_2A {color: #800080; }
span.cos_2B {color: #800080; }
span.cos_2C {color: #800080; }
span.cos_2D {color: #000080; }
span.cos_2E {color: #808000; }
span.cos_2F {color: #800080; }
span.cos_30 {color: #ff00ff; }
span.cos_31 {color: #000000; }
span.cos_32 {color: #808000; }
span.cos_33 {color: #0000ff; }
span.cos_34 {color: #808000; }
span.cos_35 {color: #808000; }
span.cos_36 {color: #808000; }
span.cos_37 {color: #0000ff; }
span.cos_38 {color: #ff00ff; }
span.cos_39 {color: #808080; }
span.cos_3A {color: #0000ff; }
span.cos_3B {color: #000000; }
span.cos_3C {color: #000000; }

</style>>

	return ""
}

/// Get Token with Authorization Code
ClassMethod GetToken(code As %String, Output sc As %Status) As %DynamicObject
{
	set $ZTrap = "Error"
	
	#dim %session as %CSP.Session
	set request = ##class(%Net.HttpRequest).%New()
	set request.SSLConfiguration = "Default"
	set request.FollowRedirect = 1
	do request.InsertFormData("grant_type", "authorization_code")
	do request.InsertFormData("code", code)
	do request.InsertFormData("client_id", ##class(Fitbit.Api.Client.bo.Operation).GetConfigValue("OAuth2ClientID"))
	do request.InsertFormData("redirect_uri", ##class(Fitbit.Api.Client.bo.Operation).GetConfigValue("RedirectUrl", 0))
	do request.InsertFormData("expires_in", "28800")
	do request.InsertFormData("code_verifier", %session.Get("CodeVerifier"))
	
	set sc = request.Post("https://api.fitbit.com/oauth2/token")

	if $$$ISERR(sc)
	{
		return {}
	}

	set token = request.HttpResponse.Data.Read()
	
	if request.HttpResponse.StatusCode '= 200
	{
		set sc = $$$ERROR($$$GeneralError, "HTTP status "_ request.HttpResponse.StatusCode_", message: " _ token)
		return {}
	}
	
	return ##class(%DynamicAbstractObject).%FromJSON(token)
	
Error
	set $ZTrap = ""
	set sc = $$$ERROR($$$GeneralError, $ZError)
	return {}
}

/// Render Token Properties
ClassMethod RenderTokenProperties(json As %DynamicObject) As %String
{
	#dim it As %Iterator.Object
	set it = json.%GetIterator()

	while it.%GetNext(.key, .value)
	{
		set key = $ZConvert(key, "O", "HTML")
		set class = ""
		
		if $lf($lfs("iat,exp,nbf"), key)
		{
			set Timestamp = ##class(%OAuth2.Utils).TimeInH(value)
			set Timestamp = $ZDateTimeH(Timestamp, -3) ; To local time
			set Timestamp = $ZDateTime(Timestamp, 3, 1)
			set value = value_" ("_Timestamp_")"
			
		}
		elseif $IsObject(value)
		{
			set value = ..EscapedJSON(value, 0, 1)
			set class = " class=""json"""
			
		}
		else
		{
			set value = $ZConvert(value, "O", "HTML")
		}
		
		&html<  <tr class="jv"><th>#(key)#</th><td#(class)#>#(value)#</td></tr>>
	}
	
	return ""
}

/// Escape Json
ClassMethod EscapedJSON(color As %DynamicAbstractObject, NewLines As %Boolean = 1, doColor As %Boolean = 1) As %String
{
	set value = ..FormattedJSON(color, NewLines)

	if 'doColor
	{
		return $ZConvert(value, "O", "HTML")
	}

	set value = ..ColorJSON(value, .ok)

	if 'ok
	{
		return $ZConvert(value, "O", "HTML")
	} 
	
	return value
}

/// Returns a %DynamicObject as a formatted JSON string
ClassMethod FormattedJSON(color As %DynamicAbstractObject, addNewlines As %Boolean = 1) As %String
{
	set f = ##class(%JSON.Formatter).%New()
	set f.Indent = addNewlines
	do f.FormatToString(color, .out)

	if 'addNewlines
	{
		set out = $Replace(out, """:", """: ")
		set out = $Replace(out, """,""", """, """)
		set out = $Replace(out, "{""", "{ """)
		set out = $Replace(out, "},""", "}, """)
		set out = $Replace(out, "},{", "}, {")
	}

	return out
}

/// Translate color
ClassMethod ColorJSON(color As %String, Output ok As %Boolean) As %String
{
	set ok = 0
	
	if '##class(%Dictionary.ClassDefinition).%ExistsId("%Library.SyntaxColor")
	{
		return color
	}
	
	set inStream = ##class(%Stream.TmpCharacter).%New()
	set outStream = ##class(%Stream.TmpCharacter).%New()
	
	do inStream.Write(" s x=")
	do inStream.Write(color)
	
	set syntaxColor = ##class(%SyntaxColor).%New()
	set ok = syntaxColor.doColor(inStream, outStream, "COS", "spf")

	if 'ok
	{
		return color
	}
	
	do outStream.Rewind()
	set result = outStream.Read()
	set result = $Piece(result, "</SPAN>", 6, *)
	set result = $Replace(result, "<SPAN CLASS=""COS", "<span class=""cos")
	set result = $Replace(result, "</SPAN>", "</span>")
	
	return result
}

/// OnPreHTTP
ClassMethod OnPreHTTP() As %Boolean [ ServerOnly = 1 ]
{
	return 1
}

}
