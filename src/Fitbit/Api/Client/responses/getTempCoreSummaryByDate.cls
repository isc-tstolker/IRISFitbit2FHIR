Class Fitbit.Api.Client.responses.getTempCoreSummaryByDate Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// Implement operationId : getTempCoreSummaryByDate
/// get /1/user/-/temp/core/date/{date}.json
Method LoadFromResponse(httpResponse As %Net.HttpResponse, caller As %String = "") As %Status
{
	Set sc = $$$OK
	Do ##super(httpResponse, caller)
	Return sc
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
