Class Fitbit.Api.Client.responses.getBreathingRateSummaryByDate Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// Implement operationId : getBreathingRateSummaryByDate
/// get /1/user/-/br/date/{date}.json
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
