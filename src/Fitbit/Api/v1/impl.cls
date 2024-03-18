/// Business logic class defined by OpenAPI in Fitbit.Api.v1.spec<br/>
Class Fitbit.Api.v1.impl Extends Fitbit.Api.RestHelper [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 0;

/// Get Swagger spec of this API
ClassMethod OpenAPI() As %DynamicObject
{
	#dim %request As %CSP.Request

	set specification = {}.%FromJSON(##class(%Dictionary.XDataDefinition).%OpenId(..%PackageName()_".spec||OpenAPI").Data)
	
	; Dynamically place host in response
	set specification.host = %request.GetCgiEnv("HTTP_HOST")
	
	; If called without https, change the scheme
	if '%request.Secure
    {
        Set specification.schemes = ["http"]
    }
	
	return specification
}

/// Handle OAuth2 flow
ClassMethod OAuth2Redirect() As %DynamicObject
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

}
