/// Local version of HS.FHIRServer.RestHandler that allows application/json
Class MyFHIRServer.RestHandler Extends HS.FHIRServer.RestHandler
{

Parameter isInteropAdapter As Boolean = 0;

XData UrlMap
{
<Routes>

<Route Url="/.well-known/:suffix" 	 	Method="GET" 		Call="processWellKnown"/>
<Route Url="/(.*)"  					Method="GET" 		Call="processRequest"/>
<Route Url="/(.*)"  					Method="POST" 		Call="processRequest"/>
<Route Url="/(.*)"  					Method="PUT" 		Call="processRequest"/>
<Route Url="/(.*)"  					Method="DELETE" 	Call="processRequest"/>
<Route Url="/(.*)"  					Method="PATCH" 		Call="processRequest"/>
<Route Url="/(.*)"  					Method="HEAD" 		Call="processRequest"/>
</Routes>
}

/// Translate valid values of the Content-Type header into a "format code"
/// Added application/json so that we become a little bit more lenient!
ClassMethod GetFormatForContentType(mimeType As %String)
{
	Return $Case(mimeType,
		"application/x-www-form-urlencoded": $$$FHIRContentCodeForm,
		"application/xml-patch+xml": $$$FHIRContentCodeXPatch,
		"application/json-patch+json": $$$FHIRContentCodeJPatch,
		"application/json+fhir": $$$FHIRContentCodeJSON,
		"application/fhir+json": $$$FHIRContentCodeJSON,
		"application/json": $$$FHIRContentCodeJSON,
		"application/xml+fhir": $$$FHIRContentCodeXML,
		"application/fhir+xml": $$$FHIRContentCodeXML,
		:"")
}

/// PrelimTokenCheck is overridden because we do not want the request to be rejected when http is used 
ClassMethod PrelimTokenCheck(Output pAccessToken As %String, Output pHTTPStatus As %String, Output pException As %Exception.AbstractException, Output pFailReason As %String) [ Internal ]
{
	Set pAccessToken = ""
	Set pHTTPStatus = ""
	Set pException = ""
	Set pFailReason = ""
}

}
