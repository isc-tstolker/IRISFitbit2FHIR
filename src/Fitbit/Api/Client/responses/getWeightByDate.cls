Class Fitbit.Api.Client.responses.getWeightByDate Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// Implement operationId : getWeightByDate
/// get /1/user/-/body/log/weight/date/{date}.json
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
