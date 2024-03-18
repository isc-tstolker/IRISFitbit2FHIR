Class Fitbit.Api.Client.responses.getHrvIntradayByInterval Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// Implement operationId : getHrvIntradayByInterval
/// get /1/user/-/hrv/date/{startDate}/{endDate}/all.json
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
