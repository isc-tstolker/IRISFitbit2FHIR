Class Fitbit.Api.Client.responses.getBreathingRateSummaryByInterval Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// Implement operationId : getBreathingRateSummaryByInterval
/// get /1/user/-/br/date/{startDate}/{endDate}.json
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
