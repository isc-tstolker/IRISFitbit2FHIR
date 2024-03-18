Class Fitbit.Api.Client.responses.getBodyResourceByDateRange Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// Implement operationId : getBodyResourceByDateRange
/// get /1/user/-/body/{resource-path}/date/{base-date}/{end-date}.json
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
