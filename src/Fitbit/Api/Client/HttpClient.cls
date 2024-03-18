Class Fitbit.Api.Client.HttpClient Extends %RegisteredObject [ ProcedureBlock ]
{

Parameter SERVER = "https://api.fitbit.com/";

Parameter SSLCONFIGURATION = "DefaultSSL";

Property HttpRequest [ InitialExpression = {##class(%Net.HttpRequest).%New()} ];

Property SSLConfiguration As %String [ InitialExpression = {..#SSLCONFIGURATION} ];

Property Server As %String [ InitialExpression = {..#SERVER} ];

Property URLComponents [ MultiDimensional ];

Method %OnNew(Server As %String, SSLConfiguration As %String) As %Status
{
	Set:$Data(Server) ..Server = Server
	Set:$Data(SSLConfiguration) ..SSLConfiguration = SSLConfiguration
	Quit ..InitializeHttpRequestObject()
}

Method InitializeHttpRequestObject() As %Status
{
	Set ..HttpRequest = ##class(%Net.HttpRequest).%New()
	Do ##class(%Net.URLParser).Decompose(..Server, .components)
	Set:$Data(components("host"), host) ..HttpRequest.Server = host
	Set:$Data(components("port"), port) ..HttpRequest.Port = port
	Set:$$$LOWER($Get(components("scheme")))="https" ..HttpRequest.Https = $$$YES, ..HttpRequest.SSLConfiguration = ..SSLConfiguration
	Merge:$Data(components) ..URLComponents = components
	Quit $$$OK
}

/// Implement operationId : UpdateBodyFatGoal
/// post /1/user/-/body/log/fat/goal.json
Method UpdateBodyFatGoal(requestMessage As Fitbit.Api.Client.requests.UpdateBodyFatGoal, Output responseMessage As Fitbit.Api.Client.responses.UpdateBodyFatGoal = {##class(Fitbit.Api.Client.responses.UpdateBodyFatGoal).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "UpdateBodyFatGoal"))
	Quit sc
}

/// Implement operationId : addActivitiesLog
/// post /1/user/-/activities.json
Method addActivitiesLog(requestMessage As Fitbit.Api.Client.requests.addActivitiesLog, Output responseMessage As Fitbit.Api.Client.responses.addActivitiesLog = {##class(Fitbit.Api.Client.responses.addActivitiesLog).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "addActivitiesLog"))
	Quit sc
}

/// Implement operationId : addAlarms
/// post /1/user/-/devices/tracker/{tracker-id}/alarms.json
Method addAlarms(requestMessage As Fitbit.Api.Client.requests.addAlarms, Output responseMessage As Fitbit.Api.Client.responses.addAlarms = {##class(Fitbit.Api.Client.responses.addAlarms).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "addAlarms"))
	Quit sc
}

/// Implement operationId : addBodyFatLog
/// post /1/user/-/body/log/fat.json
Method addBodyFatLog(requestMessage As Fitbit.Api.Client.requests.addBodyFatLog, Output responseMessage As Fitbit.Api.Client.responses.addBodyFatLog = {##class(Fitbit.Api.Client.responses.addBodyFatLog).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "addBodyFatLog"))
	Quit sc
}

/// Implement operationId : addFavoriteActivities
/// post /1/user/-/activities/favorite/{activity-id}.json
Method addFavoriteActivities(requestMessage As Fitbit.Api.Client.requests.addFavoriteActivities, Output responseMessage As Fitbit.Api.Client.responses.addFavoriteActivities = {##class(Fitbit.Api.Client.responses.addFavoriteActivities).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "addFavoriteActivities"))
	Quit sc
}

/// Implement operationId : addFavoriteFood
/// post /1/user/-/foods/log/favorite/{food-id}.json
Method addFavoriteFood(requestMessage As Fitbit.Api.Client.requests.addFavoriteFood, Output responseMessage As Fitbit.Api.Client.responses.addFavoriteFood = {##class(Fitbit.Api.Client.responses.addFavoriteFood).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "addFavoriteFood"))
	Quit sc
}

/// Implement operationId : addFoods
/// post /1/user/-/foods.json
Method addFoods(requestMessage As Fitbit.Api.Client.requests.addFoods, Output responseMessage As Fitbit.Api.Client.responses.addFoods = {##class(Fitbit.Api.Client.responses.addFoods).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "addFoods"))
	Quit sc
}

/// Implement operationId : addFoodsLog
/// post /1/user/-/foods/log.json
Method addFoodsLog(requestMessage As Fitbit.Api.Client.requests.addFoodsLog, Output responseMessage As Fitbit.Api.Client.responses.addFoodsLog = {##class(Fitbit.Api.Client.responses.addFoodsLog).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "addFoodsLog"))
	Quit sc
}

/// Implement operationId : addMeal
/// post /1/user/-/meals.json
Method addMeal(requestMessage As Fitbit.Api.Client.requests.addMeal, Output responseMessage As Fitbit.Api.Client.responses.addMeal = {##class(Fitbit.Api.Client.responses.addMeal).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "addMeal"))
	Quit sc
}

/// Implement operationId : addSleep
/// post /1.2/user/-/sleep.json
Method addSleep(requestMessage As Fitbit.Api.Client.requests.addSleep, Output responseMessage As Fitbit.Api.Client.responses.addSleep = {##class(Fitbit.Api.Client.responses.addSleep).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "addSleep"))
	Quit sc
}

/// Implement operationId : addSubscriptions
/// post /1/user/-/{collection-path}/apiSubscriptions/{subscription-id}.json
Method addSubscriptions(requestMessage As Fitbit.Api.Client.requests.addSubscriptions, Output responseMessage As Fitbit.Api.Client.responses.addSubscriptions = {##class(Fitbit.Api.Client.responses.addSubscriptions).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "addSubscriptions"))
	Quit sc
}

/// Implement operationId : addUpdateActivitiesGoals
/// post /1/user/-/activities/goals/{period}.json
Method addUpdateActivitiesGoals(requestMessage As Fitbit.Api.Client.requests.addUpdateActivitiesGoals, Output responseMessage As Fitbit.Api.Client.responses.addUpdateActivitiesGoals = {##class(Fitbit.Api.Client.responses.addUpdateActivitiesGoals).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "addUpdateActivitiesGoals"))
	Quit sc
}

/// Implement operationId : addUpdateFoodsGoal
/// post /1/user/-/foods/log/goal.json
Method addUpdateFoodsGoal(requestMessage As Fitbit.Api.Client.requests.addUpdateFoodsGoal, Output responseMessage As Fitbit.Api.Client.responses.addUpdateFoodsGoal = {##class(Fitbit.Api.Client.responses.addUpdateFoodsGoal).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "addUpdateFoodsGoal"))
	Quit sc
}

/// Implement operationId : addUpdateWaterGoal
/// post /1/user/-/foods/log/water/goal.json
Method addUpdateWaterGoal(requestMessage As Fitbit.Api.Client.requests.addUpdateWaterGoal, Output responseMessage As Fitbit.Api.Client.responses.addUpdateWaterGoal = {##class(Fitbit.Api.Client.responses.addUpdateWaterGoal).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "addUpdateWaterGoal"))
	Quit sc
}

/// Implement operationId : addWaterLog
/// post /1/user/-/foods/log/water.json
Method addWaterLog(requestMessage As Fitbit.Api.Client.requests.addWaterLog, Output responseMessage As Fitbit.Api.Client.responses.addWaterLog = {##class(Fitbit.Api.Client.responses.addWaterLog).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "addWaterLog"))
	Quit sc
}

/// Implement operationId : addWeightLog
/// post /1/user/-/body/log/weight.json
Method addWeightLog(requestMessage As Fitbit.Api.Client.requests.addWeightLog, Output responseMessage As Fitbit.Api.Client.responses.addWeightLog = {##class(Fitbit.Api.Client.responses.addWeightLog).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "addWeightLog"))
	Quit sc
}

/// Implement operationId : deleteActivitiesLog
/// delete /1/user/-/activities/{activity-log-id}.json
Method deleteActivitiesLog(requestMessage As Fitbit.Api.Client.requests.deleteActivitiesLog, Output responseMessage As Fitbit.Api.Client.responses.deleteActivitiesLog = {##class(Fitbit.Api.Client.responses.deleteActivitiesLog).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("DELETE", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "deleteActivitiesLog"))
	Quit sc
}

/// Implement operationId : deleteAlarms
/// delete /1/user/-/devices/tracker/{tracker-id}/alarms/{alarm-id}.json
Method deleteAlarms(requestMessage As Fitbit.Api.Client.requests.deleteAlarms, Output responseMessage As Fitbit.Api.Client.responses.deleteAlarms = {##class(Fitbit.Api.Client.responses.deleteAlarms).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("DELETE", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "deleteAlarms"))
	Quit sc
}

/// Implement operationId : deleteBodyFatLog
/// delete /1/user/-/body/log/fat/{body-fat-log-id}.json
Method deleteBodyFatLog(requestMessage As Fitbit.Api.Client.requests.deleteBodyFatLog, Output responseMessage As Fitbit.Api.Client.responses.deleteBodyFatLog = {##class(Fitbit.Api.Client.responses.deleteBodyFatLog).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("DELETE", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "deleteBodyFatLog"))
	Quit sc
}

/// Implement operationId : deleteFavoriteActivities
/// delete /1/user/-/activities/favorite/{activity-id}.json
Method deleteFavoriteActivities(requestMessage As Fitbit.Api.Client.requests.deleteFavoriteActivities, Output responseMessage As Fitbit.Api.Client.responses.deleteFavoriteActivities = {##class(Fitbit.Api.Client.responses.deleteFavoriteActivities).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("DELETE", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "deleteFavoriteActivities"))
	Quit sc
}

/// Implement operationId : deleteFavoriteFood
/// delete /1/user/-/foods/log/favorite/{food-id}.json
Method deleteFavoriteFood(requestMessage As Fitbit.Api.Client.requests.deleteFavoriteFood, Output responseMessage As Fitbit.Api.Client.responses.deleteFavoriteFood = {##class(Fitbit.Api.Client.responses.deleteFavoriteFood).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("DELETE", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "deleteFavoriteFood"))
	Quit sc
}

/// Implement operationId : deleteFoods
/// delete /1/user/-/foods/{food-id}.json
Method deleteFoods(requestMessage As Fitbit.Api.Client.requests.deleteFoods, Output responseMessage As Fitbit.Api.Client.responses.deleteFoods = {##class(Fitbit.Api.Client.responses.deleteFoods).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("DELETE", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "deleteFoods"))
	Quit sc
}

/// Implement operationId : deleteFoodsLog
/// delete /1/user/-/foods/log/{food-log-id}.json
Method deleteFoodsLog(requestMessage As Fitbit.Api.Client.requests.deleteFoodsLog, Output responseMessage As Fitbit.Api.Client.responses.deleteFoodsLog = {##class(Fitbit.Api.Client.responses.deleteFoodsLog).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("DELETE", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "deleteFoodsLog"))
	Quit sc
}

/// Implement operationId : deleteMeal
/// delete /1/user/-/meals/{meal-id}.json
Method deleteMeal(requestMessage As Fitbit.Api.Client.requests.deleteMeal, Output responseMessage As Fitbit.Api.Client.responses.deleteMeal = {##class(Fitbit.Api.Client.responses.deleteMeal).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("DELETE", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "deleteMeal"))
	Quit sc
}

/// Implement operationId : deleteSleep
/// delete /1.2/user/-/sleep/{log-id}.json
Method deleteSleep(requestMessage As Fitbit.Api.Client.requests.deleteSleep, Output responseMessage As Fitbit.Api.Client.responses.deleteSleep = {##class(Fitbit.Api.Client.responses.deleteSleep).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("DELETE", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "deleteSleep"))
	Quit sc
}

/// Implement operationId : deleteSubscriptions
/// delete /1/user/-/{collection-path}/apiSubscriptions/{subscription-id}.json
Method deleteSubscriptions(requestMessage As Fitbit.Api.Client.requests.deleteSubscriptions, Output responseMessage As Fitbit.Api.Client.responses.deleteSubscriptions = {##class(Fitbit.Api.Client.responses.deleteSubscriptions).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("DELETE", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "deleteSubscriptions"))
	Quit sc
}

/// Implement operationId : deleteWaterLog
/// delete /1/user/-/foods/log/water/{water-log-id}.json
Method deleteWaterLog(requestMessage As Fitbit.Api.Client.requests.deleteWaterLog, Output responseMessage As Fitbit.Api.Client.responses.deleteWaterLog = {##class(Fitbit.Api.Client.responses.deleteWaterLog).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("DELETE", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "deleteWaterLog"))
	Quit sc
}

/// Implement operationId : deleteWeightLog
/// delete /1/user/-/body/log/weight/{body-weight-log-id}.json
Method deleteWeightLog(requestMessage As Fitbit.Api.Client.requests.deleteWeightLog, Output responseMessage As Fitbit.Api.Client.responses.deleteWeightLog = {##class(Fitbit.Api.Client.responses.deleteWeightLog).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("DELETE", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "deleteWeightLog"))
	Quit sc
}

/// Implement operationId : editFoodsLog
/// post /1/user/-/foods/log/{food-log-id}.json
Method editFoodsLog(requestMessage As Fitbit.Api.Client.requests.editFoodsLog, Output responseMessage As Fitbit.Api.Client.responses.editFoodsLog = {##class(Fitbit.Api.Client.responses.editFoodsLog).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "editFoodsLog"))
	Quit sc
}

/// Implement operationId : getAZMByDateIntraday
/// get /1/user/-/activities/active-zone-minutes/date/{date}/1d/{detail-level}.json
Method getAZMByDateIntraday(requestMessage As Fitbit.Api.Client.requests.getAZMByDateIntraday, Output responseMessage As Fitbit.Api.Client.responses.getAZMByDateIntraday = {##class(Fitbit.Api.Client.responses.getAZMByDateIntraday).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getAZMByDateIntraday"))
	Quit sc
}

/// Implement operationId : getAZMByDateTimeSeriesIntraday
/// get /1/user/-/activities/active-zone-minutes/date/{date}/1d/{detail-level}/time/{start-time}/{end-time}.json
Method getAZMByDateTimeSeriesIntraday(requestMessage As Fitbit.Api.Client.requests.getAZMByDateTimeSeriesIntraday, Output responseMessage As Fitbit.Api.Client.responses.getAZMByDateTimeSeriesIntraday = {##class(Fitbit.Api.Client.responses.getAZMByDateTimeSeriesIntraday).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getAZMByDateTimeSeriesIntraday"))
	Quit sc
}

/// Implement operationId : getAZMByIntervalIntraday
/// get /1/user/-/activities/active-zone-minutes/date/{start-date}/{end-date}/{detail-level}.json
Method getAZMByIntervalIntraday(requestMessage As Fitbit.Api.Client.requests.getAZMByIntervalIntraday, Output responseMessage As Fitbit.Api.Client.responses.getAZMByIntervalIntraday = {##class(Fitbit.Api.Client.responses.getAZMByIntervalIntraday).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getAZMByIntervalIntraday"))
	Quit sc
}

/// Implement operationId : getAZMByIntervalTimeSeriesIntraday
/// get /1/user/-/activities/active-zone-minutes/date/{start-date}/{end-date}/time/{start-time}/{end-time}.json
Method getAZMByIntervalTimeSeriesIntraday(requestMessage As Fitbit.Api.Client.requests.getAZMByIntervalTimeSeriesIntraday, Output responseMessage As Fitbit.Api.Client.responses.getAZMByIntervalTimeSeriesIntraday = {##class(Fitbit.Api.Client.responses.getAZMByIntervalTimeSeriesIntraday).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getAZMByIntervalTimeSeriesIntraday"))
	Quit sc
}

/// Implement operationId : getAZMTimeSeriesByDate
/// get /1/user/-/activities/active-zone-minutes/date/{date}/{period}.json
Method getAZMTimeSeriesByDate(requestMessage As Fitbit.Api.Client.requests.getAZMTimeSeriesByDate, Output responseMessage As Fitbit.Api.Client.responses.getAZMTimeSeriesByDate = {##class(Fitbit.Api.Client.responses.getAZMTimeSeriesByDate).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getAZMTimeSeriesByDate"))
	Quit sc
}

/// Implement operationId : getAZMTimeSeriesByInterval
/// get /1/user/-/activities/active-zone-minutes/date/{start-date}/{end-date}.json
Method getAZMTimeSeriesByInterval(requestMessage As Fitbit.Api.Client.requests.getAZMTimeSeriesByInterval, Output responseMessage As Fitbit.Api.Client.responses.getAZMTimeSeriesByInterval = {##class(Fitbit.Api.Client.responses.getAZMTimeSeriesByInterval).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getAZMTimeSeriesByInterval"))
	Quit sc
}

/// Implement operationId : getActivitiesByDate
/// get /1/user/-/activities/date/{date}.json
Method getActivitiesByDate(requestMessage As Fitbit.Api.Client.requests.getActivitiesByDate, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesByDate = {##class(Fitbit.Api.Client.responses.getActivitiesByDate).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getActivitiesByDate"))
	Quit sc
}

/// Implement operationId : getActivitiesGoals
/// get /1/user/-/activities/goals/{period}.json
Method getActivitiesGoals(requestMessage As Fitbit.Api.Client.requests.getActivitiesGoals, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesGoals = {##class(Fitbit.Api.Client.responses.getActivitiesGoals).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getActivitiesGoals"))
	Quit sc
}

/// Implement operationId : getActivitiesLog
/// get /1/user/-/activities.json
Method getActivitiesLog(requestMessage As Fitbit.Api.Client.requests.getActivitiesLog, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesLog = {##class(Fitbit.Api.Client.responses.getActivitiesLog).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getActivitiesLog"))
	Quit sc
}

/// Implement operationId : getActivitiesLogList
/// get /1/user/-/activities/list.json
Method getActivitiesLogList(requestMessage As Fitbit.Api.Client.requests.getActivitiesLogList, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesLogList = {##class(Fitbit.Api.Client.responses.getActivitiesLogList).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getActivitiesLogList"))
	Quit sc
}

/// Implement operationId : getActivitiesResourceByDateIntraday
/// get /1/user/-/activities/{resource-path}/date/{date}/1d/{detail-level}.json
Method getActivitiesResourceByDateIntraday(requestMessage As Fitbit.Api.Client.requests.getActivitiesResourceByDateIntraday, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesResourceByDateIntraday = {##class(Fitbit.Api.Client.responses.getActivitiesResourceByDateIntraday).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getActivitiesResourceByDateIntraday"))
	Quit sc
}

/// Implement operationId : getActivitiesResourceByDatePeriod
/// get /1/user/-/activities/{resource-path}/date/{date}/{period}.json
Method getActivitiesResourceByDatePeriod(requestMessage As Fitbit.Api.Client.requests.getActivitiesResourceByDatePeriod, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesResourceByDatePeriod = {##class(Fitbit.Api.Client.responses.getActivitiesResourceByDatePeriod).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getActivitiesResourceByDatePeriod"))
	Quit sc
}

/// Implement operationId : getActivitiesResourceByDateRange
/// get /1/user/-/activities/{resource-path}/date/{base-date}/{end-date}.json
Method getActivitiesResourceByDateRange(requestMessage As Fitbit.Api.Client.requests.getActivitiesResourceByDateRange, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesResourceByDateRange = {##class(Fitbit.Api.Client.responses.getActivitiesResourceByDateRange).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getActivitiesResourceByDateRange"))
	Quit sc
}

/// Implement operationId : getActivitiesResourceByDateRangeIntraday
/// get /1/user/-/activities/{resource-path}/date/{base-date}/{end-date}/{detail-level}.json
Method getActivitiesResourceByDateRangeIntraday(requestMessage As Fitbit.Api.Client.requests.getActivitiesResourceByDateRangeIntraday, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesResourceByDateRangeIntraday = {##class(Fitbit.Api.Client.responses.getActivitiesResourceByDateRangeIntraday).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getActivitiesResourceByDateRangeIntraday"))
	Quit sc
}

/// Implement operationId : getActivitiesResourceByDateRangeTimeSeriesIntraday
/// get /1/user/-/activities/{resource-path}/date/{date}/{end-date}/{detail-level}/time/{start-time}/{end-time}.json
Method getActivitiesResourceByDateRangeTimeSeriesIntraday(requestMessage As Fitbit.Api.Client.requests.getActivitiesResourceByDateRangeTimeSeriesIntraday, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesResourceByDateRangeTimeSeriesIntraday = {##class(Fitbit.Api.Client.responses.getActivitiesResourceByDateRangeTimeSeriesIntraday).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getActivitiesResourceByDateRangeTimeSeriesIntraday"))
	Quit sc
}

/// Implement operationId : getActivitiesResourceByDateTimeSeriesIntraday
/// get /1/user/-/activities/{resource-path}/date/{date}/1d/{detail-level}/time/{start-time}/{end-time}.json
Method getActivitiesResourceByDateTimeSeriesIntraday(requestMessage As Fitbit.Api.Client.requests.getActivitiesResourceByDateTimeSeriesIntraday, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesResourceByDateTimeSeriesIntraday = {##class(Fitbit.Api.Client.responses.getActivitiesResourceByDateTimeSeriesIntraday).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getActivitiesResourceByDateTimeSeriesIntraday"))
	Quit sc
}

/// Implement operationId : getActivitiesTCX
/// get /1/user/-/activities/{log-id}.tcx
Method getActivitiesTCX(requestMessage As Fitbit.Api.Client.requests.getActivitiesTCX, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesTCX = {##class(Fitbit.Api.Client.responses.getActivitiesTCX).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getActivitiesTCX"))
	Quit sc
}

/// Implement operationId : getActivitiesTrackerResourceByDatePeriod
/// get /1/user/-/activities/tracker/{resource-path}/date/{date}/{period}.json
Method getActivitiesTrackerResourceByDatePeriod(requestMessage As Fitbit.Api.Client.requests.getActivitiesTrackerResourceByDatePeriod, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesTrackerResourceByDatePeriod = {##class(Fitbit.Api.Client.responses.getActivitiesTrackerResourceByDatePeriod).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getActivitiesTrackerResourceByDatePeriod"))
	Quit sc
}

/// Implement operationId : getActivitiesTrackerResourceByDateRange
/// get /1/user/-/activities/tracker/{resource-path}/date/{base-date}/{end-date}.json
Method getActivitiesTrackerResourceByDateRange(requestMessage As Fitbit.Api.Client.requests.getActivitiesTrackerResourceByDateRange, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesTrackerResourceByDateRange = {##class(Fitbit.Api.Client.responses.getActivitiesTrackerResourceByDateRange).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getActivitiesTrackerResourceByDateRange"))
	Quit sc
}

/// Implement operationId : getActivitiesTypeDetail
/// get /1/activities/{activity-id}.json
Method getActivitiesTypeDetail(requestMessage As Fitbit.Api.Client.requests.getActivitiesTypeDetail, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesTypeDetail = {##class(Fitbit.Api.Client.responses.getActivitiesTypeDetail).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getActivitiesTypeDetail"))
	Quit sc
}

/// Implement operationId : getActivitiesTypes
/// get /1/activities.json
Method getActivitiesTypes(requestMessage As Fitbit.Api.Client.requests.getActivitiesTypes, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesTypes = {##class(Fitbit.Api.Client.responses.getActivitiesTypes).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getActivitiesTypes"))
	Quit sc
}

/// Implement operationId : getAlarms
/// get /1/user/-/devices/tracker/{tracker-id}/alarms.json
Method getAlarms(requestMessage As Fitbit.Api.Client.requests.getAlarms, Output responseMessage As Fitbit.Api.Client.responses.getAlarms = {##class(Fitbit.Api.Client.responses.getAlarms).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getAlarms"))
	Quit sc
}

/// Implement operationId : getBadges
/// get /1/user/-/badges.json
Method getBadges(requestMessage As Fitbit.Api.Client.requests.getBadges, Output responseMessage As Fitbit.Api.Client.responses.getBadges = {##class(Fitbit.Api.Client.responses.getBadges).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getBadges"))
	Quit sc
}

/// Implement operationId : getBodyFatByDate
/// get /1/user/-/body/log/fat/date/{date}.json
Method getBodyFatByDate(requestMessage As Fitbit.Api.Client.requests.getBodyFatByDate, Output responseMessage As Fitbit.Api.Client.responses.getBodyFatByDate = {##class(Fitbit.Api.Client.responses.getBodyFatByDate).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getBodyFatByDate"))
	Quit sc
}

/// Implement operationId : getBodyFatByDatePeriod
/// get /1/user/-/body/log/fat/date/{date}/{period}.json
Method getBodyFatByDatePeriod(requestMessage As Fitbit.Api.Client.requests.getBodyFatByDatePeriod, Output responseMessage As Fitbit.Api.Client.responses.getBodyFatByDatePeriod = {##class(Fitbit.Api.Client.responses.getBodyFatByDatePeriod).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getBodyFatByDatePeriod"))
	Quit sc
}

/// Implement operationId : getBodyFatByDateRange
/// get /1/user/-/body/log/fat/date/{base-date}/{end-date}.json
Method getBodyFatByDateRange(requestMessage As Fitbit.Api.Client.requests.getBodyFatByDateRange, Output responseMessage As Fitbit.Api.Client.responses.getBodyFatByDateRange = {##class(Fitbit.Api.Client.responses.getBodyFatByDateRange).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getBodyFatByDateRange"))
	Quit sc
}

/// Implement operationId : getBodyGoals
/// get /1/user/-/body/log/{goal-type}/goal.json
Method getBodyGoals(requestMessage As Fitbit.Api.Client.requests.getBodyGoals, Output responseMessage As Fitbit.Api.Client.responses.getBodyGoals = {##class(Fitbit.Api.Client.responses.getBodyGoals).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getBodyGoals"))
	Quit sc
}

/// Implement operationId : getBodyResourceByDatePeriod
/// get /1/user/-/body/{resource-path}/date/{date}/{period}.json
Method getBodyResourceByDatePeriod(requestMessage As Fitbit.Api.Client.requests.getBodyResourceByDatePeriod, Output responseMessage As Fitbit.Api.Client.responses.getBodyResourceByDatePeriod = {##class(Fitbit.Api.Client.responses.getBodyResourceByDatePeriod).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getBodyResourceByDatePeriod"))
	Quit sc
}

/// Implement operationId : getBodyResourceByDateRange
/// get /1/user/-/body/{resource-path}/date/{base-date}/{end-date}.json
Method getBodyResourceByDateRange(requestMessage As Fitbit.Api.Client.requests.getBodyResourceByDateRange, Output responseMessage As Fitbit.Api.Client.responses.getBodyResourceByDateRange = {##class(Fitbit.Api.Client.responses.getBodyResourceByDateRange).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getBodyResourceByDateRange"))
	Quit sc
}

/// Implement operationId : getBreathingRateIntradayByDate
/// get /1/user/-/br/date/{date}/all.json
Method getBreathingRateIntradayByDate(requestMessage As Fitbit.Api.Client.requests.getBreathingRateIntradayByDate, Output responseMessage As Fitbit.Api.Client.responses.getBreathingRateIntradayByDate = {##class(Fitbit.Api.Client.responses.getBreathingRateIntradayByDate).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getBreathingRateIntradayByDate"))
	Quit sc
}

/// Implement operationId : getBreathingRateIntradayByInterval
/// get /1/user/-/br/date/{startDate}/{endDate}/all.json
Method getBreathingRateIntradayByInterval(requestMessage As Fitbit.Api.Client.requests.getBreathingRateIntradayByInterval, Output responseMessage As Fitbit.Api.Client.responses.getBreathingRateIntradayByInterval = {##class(Fitbit.Api.Client.responses.getBreathingRateIntradayByInterval).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getBreathingRateIntradayByInterval"))
	Quit sc
}

/// Implement operationId : getBreathingRateSummaryByDate
/// get /1/user/-/br/date/{date}.json
Method getBreathingRateSummaryByDate(requestMessage As Fitbit.Api.Client.requests.getBreathingRateSummaryByDate, Output responseMessage As Fitbit.Api.Client.responses.getBreathingRateSummaryByDate = {##class(Fitbit.Api.Client.responses.getBreathingRateSummaryByDate).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getBreathingRateSummaryByDate"))
	Quit sc
}

/// Implement operationId : getBreathingRateSummaryByInterval
/// get /1/user/-/br/date/{startDate}/{endDate}.json
Method getBreathingRateSummaryByInterval(requestMessage As Fitbit.Api.Client.requests.getBreathingRateSummaryByInterval, Output responseMessage As Fitbit.Api.Client.responses.getBreathingRateSummaryByInterval = {##class(Fitbit.Api.Client.responses.getBreathingRateSummaryByInterval).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getBreathingRateSummaryByInterval"))
	Quit sc
}

/// Implement operationId : getDevices
/// get /1/user/-/devices.json
Method getDevices(requestMessage As Fitbit.Api.Client.requests.getDevices, Output responseMessage As Fitbit.Api.Client.responses.getDevices = {##class(Fitbit.Api.Client.responses.getDevices).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getDevices"))
	Quit sc
}

/// Implement operationId : getEcgLogList
/// get /1/user/-/ecg/list.json
Method getEcgLogList(requestMessage As Fitbit.Api.Client.requests.getEcgLogList, Output responseMessage As Fitbit.Api.Client.responses.getEcgLogList = {##class(Fitbit.Api.Client.responses.getEcgLogList).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getEcgLogList"))
	Quit sc
}

/// Implement operationId : getFavoriteActivities
/// get /1/user/-/activities/favorite.json
Method getFavoriteActivities(requestMessage As Fitbit.Api.Client.requests.getFavoriteActivities, Output responseMessage As Fitbit.Api.Client.responses.getFavoriteActivities = {##class(Fitbit.Api.Client.responses.getFavoriteActivities).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getFavoriteActivities"))
	Quit sc
}

/// Implement operationId : getFavoriteFoods
/// get /1/user/-/foods/log/favorite.json
Method getFavoriteFoods(requestMessage As Fitbit.Api.Client.requests.getFavoriteFoods, Output responseMessage As Fitbit.Api.Client.responses.getFavoriteFoods = {##class(Fitbit.Api.Client.responses.getFavoriteFoods).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getFavoriteFoods"))
	Quit sc
}

/// Implement operationId : getFoodsByDate
/// get /1/user/-/foods/log/date/{date}.json
Method getFoodsByDate(requestMessage As Fitbit.Api.Client.requests.getFoodsByDate, Output responseMessage As Fitbit.Api.Client.responses.getFoodsByDate = {##class(Fitbit.Api.Client.responses.getFoodsByDate).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getFoodsByDate"))
	Quit sc
}

/// Implement operationId : getFoodsByDateRange
/// get /1/user/-/foods/log/{resource-path}/date/{base-date}/{end-date}.json
Method getFoodsByDateRange(requestMessage As Fitbit.Api.Client.requests.getFoodsByDateRange, Output responseMessage As Fitbit.Api.Client.responses.getFoodsByDateRange = {##class(Fitbit.Api.Client.responses.getFoodsByDateRange).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getFoodsByDateRange"))
	Quit sc
}

/// Implement operationId : getFoodsGoal
/// get /1/user/-/foods/log/goal.json
Method getFoodsGoal(requestMessage As Fitbit.Api.Client.requests.getFoodsGoal, Output responseMessage As Fitbit.Api.Client.responses.getFoodsGoal = {##class(Fitbit.Api.Client.responses.getFoodsGoal).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getFoodsGoal"))
	Quit sc
}

/// Implement operationId : getFoodsInfo
/// get /1/foods/{food-id}.json
Method getFoodsInfo(requestMessage As Fitbit.Api.Client.requests.getFoodsInfo, Output responseMessage As Fitbit.Api.Client.responses.getFoodsInfo = {##class(Fitbit.Api.Client.responses.getFoodsInfo).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getFoodsInfo"))
	Quit sc
}

/// Implement operationId : getFoodsList
/// get /1/foods/search.json
Method getFoodsList(requestMessage As Fitbit.Api.Client.requests.getFoodsList, Output responseMessage As Fitbit.Api.Client.responses.getFoodsList = {##class(Fitbit.Api.Client.responses.getFoodsList).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getFoodsList"))
	Quit sc
}

/// Implement operationId : getFoodsLocales
/// get /1/foods/locales.json
Method getFoodsLocales(requestMessage As Fitbit.Api.Client.requests.getFoodsLocales, Output responseMessage As Fitbit.Api.Client.responses.getFoodsLocales = {##class(Fitbit.Api.Client.responses.getFoodsLocales).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getFoodsLocales"))
	Quit sc
}

/// Implement operationId : getFoodsResourceByDatePeriod
/// get /1/user/-/foods/log/{resource-path}/date/{date}/{period}.json
Method getFoodsResourceByDatePeriod(requestMessage As Fitbit.Api.Client.requests.getFoodsResourceByDatePeriod, Output responseMessage As Fitbit.Api.Client.responses.getFoodsResourceByDatePeriod = {##class(Fitbit.Api.Client.responses.getFoodsResourceByDatePeriod).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getFoodsResourceByDatePeriod"))
	Quit sc
}

/// Implement operationId : getFoodsUnits
/// get /1/foods/units.json
Method getFoodsUnits(requestMessage As Fitbit.Api.Client.requests.getFoodsUnits, Output responseMessage As Fitbit.Api.Client.responses.getFoodsUnits = {##class(Fitbit.Api.Client.responses.getFoodsUnits).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getFoodsUnits"))
	Quit sc
}

/// Implement operationId : getFrequentActivities
/// get /1/user/-/activities/frequent.json
Method getFrequentActivities(requestMessage As Fitbit.Api.Client.requests.getFrequentActivities, Output responseMessage As Fitbit.Api.Client.responses.getFrequentActivities = {##class(Fitbit.Api.Client.responses.getFrequentActivities).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getFrequentActivities"))
	Quit sc
}

/// Implement operationId : getFrequentFoods
/// get /1/user/-/foods/log/frequent.json
Method getFrequentFoods(requestMessage As Fitbit.Api.Client.requests.getFrequentFoods, Output responseMessage As Fitbit.Api.Client.responses.getFrequentFoods = {##class(Fitbit.Api.Client.responses.getFrequentFoods).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getFrequentFoods"))
	Quit sc
}

/// Implement operationId : getFriends
/// get /1.1/user/-/friends.json
Method getFriends(requestMessage As Fitbit.Api.Client.requests.getFriends, Output responseMessage As Fitbit.Api.Client.responses.getFriends = {##class(Fitbit.Api.Client.responses.getFriends).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getFriends"))
	Quit sc
}

/// Implement operationId : getFriendsLeaderboard
/// get /1.1/user/-/leaderboard/friends.json
Method getFriendsLeaderboard(requestMessage As Fitbit.Api.Client.requests.getFriendsLeaderboard, Output responseMessage As Fitbit.Api.Client.responses.getFriendsLeaderboard = {##class(Fitbit.Api.Client.responses.getFriendsLeaderboard).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getFriendsLeaderboard"))
	Quit sc
}

/// Implement operationId : getHeartByDateIntraday
/// get /1/user/-/activities/heart/date/{date}/1d/{detail-level}.json
Method getHeartByDateIntraday(requestMessage As Fitbit.Api.Client.requests.getHeartByDateIntraday, Output responseMessage As Fitbit.Api.Client.responses.getHeartByDateIntraday = {##class(Fitbit.Api.Client.responses.getHeartByDateIntraday).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getHeartByDateIntraday"))
	Quit sc
}

/// Implement operationId : getHeartByDatePeriod
/// get /1/user/-/activities/heart/date/{date}/{period}.json
Method getHeartByDatePeriod(requestMessage As Fitbit.Api.Client.requests.getHeartByDatePeriod, Output responseMessage As Fitbit.Api.Client.responses.getHeartByDatePeriod = {##class(Fitbit.Api.Client.responses.getHeartByDatePeriod).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getHeartByDatePeriod"))
	Quit sc
}

/// Implement operationId : getHeartByDateRange
/// get /1/user/-/activities/heart/date/{base-date}/{end-date}.json
Method getHeartByDateRange(requestMessage As Fitbit.Api.Client.requests.getHeartByDateRange, Output responseMessage As Fitbit.Api.Client.responses.getHeartByDateRange = {##class(Fitbit.Api.Client.responses.getHeartByDateRange).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getHeartByDateRange"))
	Quit sc
}

/// Implement operationId : getHeartByDateRangeIntraday
/// get /1/user/-/activities/heart/date/{date}/{end-date}/{detail-level}.json
Method getHeartByDateRangeIntraday(requestMessage As Fitbit.Api.Client.requests.getHeartByDateRangeIntraday, Output responseMessage As Fitbit.Api.Client.responses.getHeartByDateRangeIntraday = {##class(Fitbit.Api.Client.responses.getHeartByDateRangeIntraday).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getHeartByDateRangeIntraday"))
	Quit sc
}

/// Implement operationId : getHeartByDateRangeTimestampIntraday
/// get /1/user/-/activities/heart/date/{date}/{end-date}/{detail-level}/time/{start-time}/{end-time}.json
Method getHeartByDateRangeTimestampIntraday(requestMessage As Fitbit.Api.Client.requests.getHeartByDateRangeTimestampIntraday, Output responseMessage As Fitbit.Api.Client.responses.getHeartByDateRangeTimestampIntraday = {##class(Fitbit.Api.Client.responses.getHeartByDateRangeTimestampIntraday).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getHeartByDateRangeTimestampIntraday"))
	Quit sc
}

/// Implement operationId : getHeartByDateTimestampIntraday
/// get /1/user/-/activities/heart/date/{date}/1d/{detail-level}/time/{start-time}/{end-time}.json
Method getHeartByDateTimestampIntraday(requestMessage As Fitbit.Api.Client.requests.getHeartByDateTimestampIntraday, Output responseMessage As Fitbit.Api.Client.responses.getHeartByDateTimestampIntraday = {##class(Fitbit.Api.Client.responses.getHeartByDateTimestampIntraday).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getHeartByDateTimestampIntraday"))
	Quit sc
}

/// Implement operationId : getHrvIntradayByDate
/// get /1/user/-/hrv/date/{date}/all.json
Method getHrvIntradayByDate(requestMessage As Fitbit.Api.Client.requests.getHrvIntradayByDate, Output responseMessage As Fitbit.Api.Client.responses.getHrvIntradayByDate = {##class(Fitbit.Api.Client.responses.getHrvIntradayByDate).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getHrvIntradayByDate"))
	Quit sc
}

/// Implement operationId : getHrvIntradayByInterval
/// get /1/user/-/hrv/date/{startDate}/{endDate}/all.json
Method getHrvIntradayByInterval(requestMessage As Fitbit.Api.Client.requests.getHrvIntradayByInterval, Output responseMessage As Fitbit.Api.Client.responses.getHrvIntradayByInterval = {##class(Fitbit.Api.Client.responses.getHrvIntradayByInterval).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getHrvIntradayByInterval"))
	Quit sc
}

/// Implement operationId : getHrvSummaryDate
/// get /1/user/-/hrv/date/{date}.json
Method getHrvSummaryDate(requestMessage As Fitbit.Api.Client.requests.getHrvSummaryDate, Output responseMessage As Fitbit.Api.Client.responses.getHrvSummaryDate = {##class(Fitbit.Api.Client.responses.getHrvSummaryDate).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getHrvSummaryDate"))
	Quit sc
}

/// Implement operationId : getHrvSummaryInterval
/// get /1/user/-/hrv/date/{startDate}/{endDate}.json
Method getHrvSummaryInterval(requestMessage As Fitbit.Api.Client.requests.getHrvSummaryInterval, Output responseMessage As Fitbit.Api.Client.responses.getHrvSummaryInterval = {##class(Fitbit.Api.Client.responses.getHrvSummaryInterval).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getHrvSummaryInterval"))
	Quit sc
}

/// Implement operationId : getMeals
/// get /1/user/-/meals.json
Method getMeals(requestMessage As Fitbit.Api.Client.requests.getMeals, Output responseMessage As Fitbit.Api.Client.responses.getMeals = {##class(Fitbit.Api.Client.responses.getMeals).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getMeals"))
	Quit sc
}

/// Implement operationId : getProfile
/// get /1/user/-/profile.json
Method getProfile(requestMessage As Fitbit.Api.Client.requests.getProfile, Output responseMessage As Fitbit.Api.Client.responses.getProfile = {##class(Fitbit.Api.Client.responses.getProfile).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getProfile"))
	Quit sc
}

/// Implement operationId : getRecentActivities
/// get /1/user/-/activities/recent.json
Method getRecentActivities(requestMessage As Fitbit.Api.Client.requests.getRecentActivities, Output responseMessage As Fitbit.Api.Client.responses.getRecentActivities = {##class(Fitbit.Api.Client.responses.getRecentActivities).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getRecentActivities"))
	Quit sc
}

/// Implement operationId : getRecentFoods
/// get /1/user/-/foods/log/recent.json
Method getRecentFoods(requestMessage As Fitbit.Api.Client.requests.getRecentFoods, Output responseMessage As Fitbit.Api.Client.responses.getRecentFoods = {##class(Fitbit.Api.Client.responses.getRecentFoods).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getRecentFoods"))
	Quit sc
}

/// Implement operationId : getSleepByDate
/// get /1.2/user/-/sleep/date/{date}.json
Method getSleepByDate(requestMessage As Fitbit.Api.Client.requests.getSleepByDate, Output responseMessage As Fitbit.Api.Client.responses.getSleepByDate = {##class(Fitbit.Api.Client.responses.getSleepByDate).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getSleepByDate"))
	Quit sc
}

/// Implement operationId : getSleepByDateRange
/// get /1.2/user/-/sleep/date/{base-date}/{end-date}.json
Method getSleepByDateRange(requestMessage As Fitbit.Api.Client.requests.getSleepByDateRange, Output responseMessage As Fitbit.Api.Client.responses.getSleepByDateRange = {##class(Fitbit.Api.Client.responses.getSleepByDateRange).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getSleepByDateRange"))
	Quit sc
}

/// Implement operationId : getSleepGoal
/// get /1.2/user/-/sleep/goal.json
Method getSleepGoal(requestMessage As Fitbit.Api.Client.requests.getSleepGoal, Output responseMessage As Fitbit.Api.Client.responses.getSleepGoal = {##class(Fitbit.Api.Client.responses.getSleepGoal).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getSleepGoal"))
	Quit sc
}

/// Implement operationId : getSleepList
/// get /1.2/user/-/sleep/list.json
Method getSleepList(requestMessage As Fitbit.Api.Client.requests.getSleepList, Output responseMessage As Fitbit.Api.Client.responses.getSleepList = {##class(Fitbit.Api.Client.responses.getSleepList).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getSleepList"))
	Quit sc
}

/// Implement operationId : getSpO2IntradayByDate
/// get /1/user/-/spo2/date/{date}/all.json
Method getSpO2IntradayByDate(requestMessage As Fitbit.Api.Client.requests.getSpO2IntradayByDate, Output responseMessage As Fitbit.Api.Client.responses.getSpO2IntradayByDate = {##class(Fitbit.Api.Client.responses.getSpO2IntradayByDate).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getSpO2IntradayByDate"))
	Quit sc
}

/// Implement operationId : getSpO2IntradayByInterval
/// get /1/user/-/spo2/date/{startDate}/{endDate}/all.json
Method getSpO2IntradayByInterval(requestMessage As Fitbit.Api.Client.requests.getSpO2IntradayByInterval, Output responseMessage As Fitbit.Api.Client.responses.getSpO2IntradayByInterval = {##class(Fitbit.Api.Client.responses.getSpO2IntradayByInterval).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getSpO2IntradayByInterval"))
	Quit sc
}

/// Implement operationId : getSpO2SummaryByDate
/// get /1/user/-/spo2/date/{date}.json
Method getSpO2SummaryByDate(requestMessage As Fitbit.Api.Client.requests.getSpO2SummaryByDate, Output responseMessage As Fitbit.Api.Client.responses.getSpO2SummaryByDate = {##class(Fitbit.Api.Client.responses.getSpO2SummaryByDate).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getSpO2SummaryByDate"))
	Quit sc
}

/// Implement operationId : getSpO2SummaryByInterval
/// get /1/user/-/spo2/date/{startDate}/{endDate}.json
Method getSpO2SummaryByInterval(requestMessage As Fitbit.Api.Client.requests.getSpO2SummaryByInterval, Output responseMessage As Fitbit.Api.Client.responses.getSpO2SummaryByInterval = {##class(Fitbit.Api.Client.responses.getSpO2SummaryByInterval).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getSpO2SummaryByInterval"))
	Quit sc
}

/// Implement operationId : getSubscriptionsList
/// get /1/user/-/{collection-path}/apiSubscriptions.json
Method getSubscriptionsList(requestMessage As Fitbit.Api.Client.requests.getSubscriptionsList, Output responseMessage As Fitbit.Api.Client.responses.getSubscriptionsList = {##class(Fitbit.Api.Client.responses.getSubscriptionsList).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getSubscriptionsList"))
	Quit sc
}

/// Implement operationId : getTempCoreSummaryByDate
/// get /1/user/-/temp/core/date/{date}.json
Method getTempCoreSummaryByDate(requestMessage As Fitbit.Api.Client.requests.getTempCoreSummaryByDate, Output responseMessage As Fitbit.Api.Client.responses.getTempCoreSummaryByDate = {##class(Fitbit.Api.Client.responses.getTempCoreSummaryByDate).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getTempCoreSummaryByDate"))
	Quit sc
}

/// Implement operationId : getTempCoreSummaryByInterval
/// get /1/user/-/temp/core/date/{startDate}/{endDate}.json
Method getTempCoreSummaryByInterval(requestMessage As Fitbit.Api.Client.requests.getTempCoreSummaryByInterval, Output responseMessage As Fitbit.Api.Client.responses.getTempCoreSummaryByInterval = {##class(Fitbit.Api.Client.responses.getTempCoreSummaryByInterval).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getTempCoreSummaryByInterval"))
	Quit sc
}

/// Implement operationId : getTempSkinSummaryByInterval
/// get /1/user/-/temp/skin/date/{startDate}/{endDate}.json
Method getTempSkinSummaryByInterval(requestMessage As Fitbit.Api.Client.requests.getTempSkinSummaryByInterval, Output responseMessage As Fitbit.Api.Client.responses.getTempSkinSummaryByInterval = {##class(Fitbit.Api.Client.responses.getTempSkinSummaryByInterval).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getTempSkinSummaryByInterval"))
	Quit sc
}

/// Implement operationId : getTempSkinSummaryDate
/// get /1/user/-/temp/skin/date/{date}.json
Method getTempSkinSummaryDate(requestMessage As Fitbit.Api.Client.requests.getTempSkinSummaryDate, Output responseMessage As Fitbit.Api.Client.responses.getTempSkinSummaryDate = {##class(Fitbit.Api.Client.responses.getTempSkinSummaryDate).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getTempSkinSummaryDate"))
	Quit sc
}

/// Implement operationId : getVo2MaxSummaryByDate
/// get /1/user/-/cardioscore/date/{date}.json
Method getVo2MaxSummaryByDate(requestMessage As Fitbit.Api.Client.requests.getVo2MaxSummaryByDate, Output responseMessage As Fitbit.Api.Client.responses.getVo2MaxSummaryByDate = {##class(Fitbit.Api.Client.responses.getVo2MaxSummaryByDate).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getVo2MaxSummaryByDate"))
	Quit sc
}

/// Implement operationId : getVo2MaxSummaryByInterval
/// get /1/user/-/cardioscore/date/{startDate}/{endDate}.json
Method getVo2MaxSummaryByInterval(requestMessage As Fitbit.Api.Client.requests.getVo2MaxSummaryByInterval, Output responseMessage As Fitbit.Api.Client.responses.getVo2MaxSummaryByInterval = {##class(Fitbit.Api.Client.responses.getVo2MaxSummaryByInterval).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getVo2MaxSummaryByInterval"))
	Quit sc
}

/// Implement operationId : getWaterByDate
/// get /1/user/-/foods/log/water/date/{date}.json
Method getWaterByDate(requestMessage As Fitbit.Api.Client.requests.getWaterByDate, Output responseMessage As Fitbit.Api.Client.responses.getWaterByDate = {##class(Fitbit.Api.Client.responses.getWaterByDate).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getWaterByDate"))
	Quit sc
}

/// Implement operationId : getWaterGoal
/// get /1/user/-/foods/log/water/goal.json
Method getWaterGoal(requestMessage As Fitbit.Api.Client.requests.getWaterGoal, Output responseMessage As Fitbit.Api.Client.responses.getWaterGoal = {##class(Fitbit.Api.Client.responses.getWaterGoal).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getWaterGoal"))
	Quit sc
}

/// Implement operationId : getWeightByDate
/// get /1/user/-/body/log/weight/date/{date}.json
Method getWeightByDate(requestMessage As Fitbit.Api.Client.requests.getWeightByDate, Output responseMessage As Fitbit.Api.Client.responses.getWeightByDate = {##class(Fitbit.Api.Client.responses.getWeightByDate).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getWeightByDate"))
	Quit sc
}

/// Implement operationId : getWeightByDatePeriod
/// get /1/user/-/body/log/weight/date/{date}/{period}.json
Method getWeightByDatePeriod(requestMessage As Fitbit.Api.Client.requests.getWeightByDatePeriod, Output responseMessage As Fitbit.Api.Client.responses.getWeightByDatePeriod = {##class(Fitbit.Api.Client.responses.getWeightByDatePeriod).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getWeightByDatePeriod"))
	Quit sc
}

/// Implement operationId : getWeightByDateRange
/// get /1/user/-/body/log/weight/date/{base-date}/{end-date}.json
Method getWeightByDateRange(requestMessage As Fitbit.Api.Client.requests.getWeightByDateRange, Output responseMessage As Fitbit.Api.Client.responses.getWeightByDateRange = {##class(Fitbit.Api.Client.responses.getWeightByDateRange).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("GET", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "getWeightByDateRange"))
	Quit sc
}

/// Implement operationId : introspect
/// post /1.1/oauth2/introspect
Method introspect(requestMessage As Fitbit.Api.Client.requests.introspect, Output responseMessage As Fitbit.Api.Client.responses.introspect = {##class(Fitbit.Api.Client.responses.introspect).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "introspect"))
	Quit sc
}

/// Implement operationId : oauthToken
/// post /oauth2/token
Method oauthToken(requestMessage As Fitbit.Api.Client.requests.oauthToken, Output responseMessage As Fitbit.Api.Client.responses.oauthToken = {##class(Fitbit.Api.Client.responses.oauthToken).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "oauthToken"))
	Quit sc
}

/// Implement operationId : revoke
/// post /oauth2/revoke
Method revoke(requestMessage As Fitbit.Api.Client.requests.revoke, Output responseMessage As Fitbit.Api.Client.responses.revoke = {##class(Fitbit.Api.Client.responses.revoke).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "revoke"))
	Quit sc
}

/// Implement operationId : updateAlarms
/// post /1/user/-/devices/tracker/{tracker-id}/alarms/{alarm-id}.json
Method updateAlarms(requestMessage As Fitbit.Api.Client.requests.updateAlarms, Output responseMessage As Fitbit.Api.Client.responses.updateAlarms = {##class(Fitbit.Api.Client.responses.updateAlarms).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "updateAlarms"))
	Quit sc
}

/// Implement operationId : updateMeal
/// post /1/user/-/meals/{meal-id}.json
Method updateMeal(requestMessage As Fitbit.Api.Client.requests.updateMeal, Output responseMessage As Fitbit.Api.Client.responses.updateMeal = {##class(Fitbit.Api.Client.responses.updateMeal).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "updateMeal"))
	Quit sc
}

/// Implement operationId : updateProfile
/// post /1/user/-/profile.json
Method updateProfile(requestMessage As Fitbit.Api.Client.requests.updateProfile, Output responseMessage As Fitbit.Api.Client.responses.updateProfile = {##class(Fitbit.Api.Client.responses.updateProfile).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "updateProfile"))
	Quit sc
}

/// Implement operationId : updateSleepGoal
/// post /1.2/user/-/sleep/goal.json
Method updateSleepGoal(requestMessage As Fitbit.Api.Client.requests.updateSleepGoal, Output responseMessage As Fitbit.Api.Client.responses.updateSleepGoal = {##class(Fitbit.Api.Client.responses.updateSleepGoal).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "updateSleepGoal"))
	Quit sc
}

/// Implement operationId : updateWaterLog
/// post /1/user/-/foods/log/water/{water-log-id}.json
Method updateWaterLog(requestMessage As Fitbit.Api.Client.requests.updateWaterLog, Output responseMessage As Fitbit.Api.Client.responses.updateWaterLog = {##class(Fitbit.Api.Client.responses.updateWaterLog).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "updateWaterLog"))
	Quit sc
}

/// Implement operationId : updateWeightGoal
/// post /1/user/-/body/log/weight/goal.json
Method updateWeightGoal(requestMessage As Fitbit.Api.Client.requests.updateWeightGoal, Output responseMessage As Fitbit.Api.Client.responses.updateWeightGoal = {##class(Fitbit.Api.Client.responses.updateWeightGoal).%New()}) As %Status
{
	Set sc = $$$OK
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(..HttpRequest))
	$$$QuitOnError(..HttpRequest.Send("POST", $Get(..URLComponents("path")) _ requestMessage.%URL))
	$$$QuitOnError(responseMessage.LoadFromResponse(..HttpRequest.HttpResponse, "updateWeightGoal"))
	Quit sc
}

}
