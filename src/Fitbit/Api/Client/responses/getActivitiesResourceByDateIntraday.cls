Class Fitbit.Api.Client.responses.getActivitiesResourceByDateIntraday Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// Implement operationId : getActivitiesResourceByDateIntraday
/// get /1/user/-/activities/{resource-path}/date/{date}/1d/{detail-level}.json
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
