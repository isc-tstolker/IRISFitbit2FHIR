Class Fitbit.Api.Client.responses.getActivitiesTrackerResourceByDateRange Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// Implement operationId : getActivitiesTrackerResourceByDateRange
/// get /1/user/-/activities/tracker/{resource-path}/date/{base-date}/{end-date}.json
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
