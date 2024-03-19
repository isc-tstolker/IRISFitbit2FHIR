Include HS.FHIRServer

/// Base process used as superclass for processes that want top handle FHIR
Class Fitbit.BP.FHIRBase Extends (Ens.BusinessProcess, Fitbit.Util.FHIRClientHelper)
{

Parameter SessionApplication As STRING = "/fitbitfhir";

/// Where to send the FHIR requests
Property FHIRInterop As Ens.DataType.ConfigName [ InitialExpression = "FHIRInterop" ];

/// Get single FHIR resource
Method GetSingleFHIRResource(resourceType As %String, query As %String, ByRef vars As %String) As %DynamicObject
{
	set bundle = ..FHIRSearch(resourceType, query, .vars)

	return ..FindResourceInBundle(bundle, resourceType)
}

/// Execute a FHIR Search and return the Bundle
Method FHIRSearch(resourceType As %String, query As %String, ByRef vars As %String) As %DynamicObject
{
	#dim request as HS.FHIRServer.Interop.Request = ##class(HS.FHIRServer.Interop.Request).%New()
	set queryString = ..PrepareQuery(resourceType, query, .vars, .requestPath)
    set request.Request.SessionApplication = ..#SessionApplication
    set request.Request.RequestMethod = "GET" 
    set request.Request.RequestPath = requestPath
    set request.Request.QueryString = queryString
    set request.Request.ResponseFormatCode = $$$FHIRContentCodeJSON
    
    return ..SendFHIRRequest(request)
}

// Send a FHIR resource to the target system

Method SendFHIRResource(method As %String, resource As %DynamicObject, requestPath As %String, queryString As %String = "") As %DynamicObject
{
	#dim request as HS.FHIRServer.Interop.Request = ##class(HS.FHIRServer.Interop.Request).%New()
    set request.Request.SessionApplication = ..#SessionApplication
    set request.Request.RequestMethod = method
    set request.Request.RequestPath = requestPath
    set request.Request.QueryString = queryString
    set request.Request.RequestFormatCode = $$$FHIRContentCodeJSON
    set request.Request.ResponseFormatCode = $$$FHIRContentCodeJSON
    set request.QuickStreamId = ##class(Fitbit.Util.QuickStreamHelper).CreateQuickStream(resource)
    
    return ..SendFHIRRequest(request)
}

/// POST or PUT a FHIR Interop Request to the designated Hospital Connector
/// Send a FHIR Interop Request to the designated Hospital Connector
Method SendFHIRRequest(pRequest As HS.FHIRServer.Interop.Request) As %DynamicObject
{
    $$$ThrowOnError(..SendRequestSync(..FHIRInterop, pRequest, .response))

    #dim response as HS.FHIRServer.Interop.Response

	#dim reply as %DynamicObject = ##class(Fitbit.Util.QuickStreamHelper).ReadQuickstream(response.QuickStreamId)

    if '##class(Fitbit.Api.HTTPStatusHelper).HTTPStatusIsOK(response.Response.Status)
    {
        $$$LOGERROR("Status=" _ response.Response.Status _ "; json='" _ reply.%ToJSON() _ "'" )
		return ""
    }

    return reply
}

Storage Default
{
<Data name="FHIRBaseDefaultData">
<Subscript>"FHIRBase"</Subscript>
<Value name="1">
<Value>FHIRInterop</Value>
</Value>
</Data>
<DefaultData>FHIRBaseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
