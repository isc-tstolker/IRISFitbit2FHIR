Include Ensemble

/// REST Helper routines
Class Fitbit.Api.RestHelper Extends (%REST.Impl, Fitbit.Api.HTTPStatusHelper)
{

/// Create response for unexpected status
ClassMethod ReturnError(message As %String = "", httpStatus As %Integer = 200) As %DynamicObject
{
    return ..ReturnJSON({ "code": (httpStatus), "message": (message) }, httpStatus)
}

/// Returns the data passed in with Content-Type json. data may be
/// a string, a json-enabled class, or a %DynamicAbstractObject.
ClassMethod ReturnJSON(data As %String = "", HttpStatus As %String = "") As %String
{
	do ..%SetContentType("application/json")
	do ..%SetHeader("Access-Control-Allow-Origin", "*")

	if HttpStatus = ""
	{
		set HttpStatus = ..#HTTP200OK
	}

	do ..%SetStatusCode(##class(Fitbit.Api.HTTPStatusHelper).GetHTTPStatusCode(HttpStatus))

	; data may be string
	if '$IsObject(data)
	{
		return data
	}
	
	; ..or a json-enabled class
	if data.%Extends("%JSON.Adaptor")
	{
		#dim object as %JSON.Adaptor = data

		do object.%JSONExportToString(.json)

		return json
	}
	
	; ...or a %DynamicAbstractObject
	return data.%ToJSON()
}

}
