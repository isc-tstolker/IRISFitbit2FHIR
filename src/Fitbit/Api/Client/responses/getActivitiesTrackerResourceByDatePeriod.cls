Class Fitbit.Api.Client.responses.getActivitiesTrackerResourceByDatePeriod Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// Implement operationId : getActivitiesTrackerResourceByDatePeriod
/// get /1/user/-/activities/tracker/{resource-path}/date/{date}/{period}.json
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
