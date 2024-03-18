Class Fitbit.Api.Client.responses.getVo2MaxSummaryByInterval Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// Implement operationId : getVo2MaxSummaryByInterval
/// get /1/user/-/cardioscore/date/{startDate}/{endDate}.json
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
