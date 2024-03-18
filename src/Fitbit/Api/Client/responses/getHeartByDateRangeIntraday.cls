Class Fitbit.Api.Client.responses.getHeartByDateRangeIntraday Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// Implement operationId : getHeartByDateRangeIntraday
/// get /1/user/-/activities/heart/date/{date}/{end-date}/{detail-level}.json
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
