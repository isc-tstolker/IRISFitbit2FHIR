Class Fitbit.Api.Client.responses.getBreathingRateIntradayByInterval Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// Implement operationId : getBreathingRateIntradayByInterval
/// get /1/user/-/br/date/{startDate}/{endDate}/all.json
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
