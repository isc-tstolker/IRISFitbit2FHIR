/// Start OAuth Authorization flow that allows use of Fitbit
Class Fitbit.Authorize Extends %CSP.Page
{

/// https://iris.dev.iscdev.nl/csp/healthshare/connectors/Fitbit.Authorize.cls
ClassMethod OnPage() As %Status [ ServerOnly = 1 ]
{
	&html<<html>
	<head><title>Fitbit OAuth2 Authorization</title>
	#(..Style())#
	</head>
	<body>
	<header>
	<h1>Click the Authorize button to login to Fitbit and grant access to your data</h1>
	<form method=post action=""><button name=authorize type=submit>Authorize</button></form>
	</header>
	</body>
	</html>>

	return $$$OK
}

/// Style
ClassMethod Style() As %String
{
	&html<<style>
	header {
	background-color: #eee;
	border-radius: 5px;
	padding: 0 0.5em;
	margin: 0 0 1em 0;
	}
	h1 { margin: 0; }
	form { float:left; margin-top:0.5em; }
	div { font-family: Cambria; }
	.where { color: #999; }
	.msg {
	margin-bottom: 0.3em;
	}
	.msg span {
	font-family: monospace;
	color: #fff;
	background-color: #c66;
	padding: 0 1px 1px 0;
	margin: 0 1px;
	}
	.msg span::before { content: '(' }
	.msg span::after { content: ')' }
	</style>>

	return ""
}

/// OnPreHTTP
ClassMethod OnPreHTTP() As %Boolean [ ServerOnly = 1 ]
{
	#dim %request As %CSP.Request
	#dim %response As %CSP.Response
	
	if %request.Method = "POST"
	{
		if %request.IsDefined("authorize")
		{
			// Call Fitbit Authorize endpoint
			// Determine CodeChallenge en CodeVerifier
			set codeVerifier = ##class(%OAuth2.Utils).Base64UrlEncode($System.Encryption.GenCryptRand(32))
			do %session.Set("CodeVerifier", codeVerifier)  // Keep in session

			set %response.Redirect = "https://www.fitbit.com/oauth2/authorize?response_type=code" _
									"&client_id=" _  ##class(Fitbit.Api.Client.bo.Operation).GetConfigValue("OAuth2ClientID") _
									"&redirect_uri=" _ ##class(Fitbit.Api.Client.bo.Operation).GetConfigValue("RedirectUrl", 0) _
									"&code_challenge=" _ ##class(%OAuth2.Utils).Base64UrlEncode($System.Encryption.SHAHash(256, codeVerifier)) _
									"&code_challenge_method=S256" _
									"&scope=" _ ##class(Fitbit.Api.Client.bo.Operation).GetConfigValue("DefaultScope") _
									"&state=" _ "sate"

		}
	}
	
	return 1
}

}
