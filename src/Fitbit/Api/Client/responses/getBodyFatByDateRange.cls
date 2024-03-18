Class Fitbit.Api.Client.responses.getBodyFatByDateRange Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// Implement operationId : getBodyFatByDateRange
/// get /1/user/-/body/log/fat/date/{base-date}/{end-date}.json
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
