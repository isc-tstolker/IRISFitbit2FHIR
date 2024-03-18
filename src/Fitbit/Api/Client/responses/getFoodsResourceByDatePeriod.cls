Class Fitbit.Api.Client.responses.getFoodsResourceByDatePeriod Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// Implement operationId : getFoodsResourceByDatePeriod
/// get /1/user/-/foods/log/{resource-path}/date/{date}/{period}.json
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
