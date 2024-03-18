Class Fitbit.Api.Client.responses.getSpO2IntradayByInterval Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// Implement operationId : getSpO2IntradayByInterval
/// get /1/user/-/spo2/date/{startDate}/{endDate}/all.json
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
