Class Fitbit.Api.Client.responses.getWeightByDatePeriod Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// Implement operationId : getWeightByDatePeriod
/// get /1/user/-/body/log/weight/date/{date}/{period}.json
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
