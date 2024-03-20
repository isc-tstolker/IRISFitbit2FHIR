Include (%occErrors, %occStatus)

/// Generated Business Operation
Class Fitbit.Api.Client.bo.Operation Extends Ens.BusinessOperation [ Inheritance = left, ProcedureBlock ]
{

Property OAuth2ClientID As %String(MAXLEN = 50) [ InitialExpression = "227P83" ];

Property OAuth2ClientSecret As %String(MAXLEN = 50) [ InitialExpression = "5a68a11c251c8e313bae0783005237da" ];

Property RedirectUrl As %String(MAXLEN = 100) [ InitialExpression = "https://iris.dev.iscdev.nl/csp/healthshare/fitbit/Fitbit.OAuth2Redirect.cls" ];

Property VerificationCode As %String(MAXLEN = 100) [ InitialExpression = "1c38222aa3cef332c9085552d29bc3d1637ab123b39651a92278a971e0a86340" ];

/// Requested scopes
Property activity As %Boolean [ InitialExpression = 1 ];

Property "cardio_fitness" As %Boolean [ InitialExpression = 1 ];

Property electrocardiogram As %Boolean [ InitialExpression = 1 ];

Property heartrate As %Boolean [ InitialExpression = 1 ];

Property location As %Boolean [ InitialExpression = 1 ];

Property nutrition As %Boolean [ InitialExpression = 0 ];

Property "oxygen_saturation" As %Boolean [ InitialExpression = 1 ];

Property profile As %Boolean [ InitialExpression = 1 ];

Property "respiratory_rate" As %Boolean [ InitialExpression = 1 ];

Property settings As %Boolean [ InitialExpression = 1 ];

Property sleep As %Boolean [ InitialExpression = 1 ];

Property social As %Boolean [ InitialExpression = 1 ];

Property temperature As %Boolean [ InitialExpression = 1 ];

Property weight As %Boolean [ InitialExpression = 1 ];

Parameter SETTINGS = "OAuth2ClientID:Fitbit,OAuth2ClientSecret:Fitbit,RedirectUrl:Fitbit,VerificationCode:Fitbit,activity:Fitbit Requested Scopes,activity:Fitbit Requested Scopes,cardio_fitness:Fitbit Requested Scopes,electrocardiogram:Fitbit Requested Scopes,heartrate:Fitbit Requested Scopes,location:Fitbit Requested Scopes,nutrition:Fitbit Requested Scopes,oxygen_saturation:Fitbit Requested Scopes,profile:Fitbit Requested Scopes,respiratory_rate:Fitbit Requested Scopes,settings:Fitbit Requested Scopes,sleep:Fitbit Requested Scopes,social:Fitbit Requested Scopes,temperature:Fitbit Requested Scopes,weight:Fitbit Requested Scopes";

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

/// Get Config Value
ClassMethod GetConfigValue(name As %String, doEncode As %Boolean = 1) As %String
{
	if name = "DefaultScope" // Get fitbut request scopes
	{
		set value = ..GetRequestedScopes()
	}
	else
	{
		set value = ##class(Ens.Director).GetItemSettingValue("||FitbitWebAPI", "Host", name, .sc)
	}

	if (doEncode)
	{
		return $$$URLENCODE(value)
	}

	return value
}

/// Get Requested Scopes by adding the set items in a string
ClassMethod GetRequestedScopes() As %Status
{
	set totalScopes = "activity cardio_fitness electrocardiogram heartrate location nutrition oxygen_saturation profile respiratory_rate settings sleep social temperature weight"
	set requestedScopes = ""

	for index = 1:1:$LENGTH(totalScopes, " ")
	{
		set scope = $PIECE(totalScopes, " ", index)

		if ##class(Ens.Director).GetItemSettingValue("||FitbitWebAPI", "Host", scope, .sc)
		{
			set requestedScopes = requestedScopes _ scope _ " "
		}
	}

	return $EXTRACT(requestedScopes, 1, *-1)
}

/// Implement operationId : UpdateBodyFatGoal
/// post /1/user/-/body/log/fat/goal.json
Method UpdateBodyFatGoal(requestMessage As Fitbit.Api.Client.requests.UpdateBodyFatGoal, Output responseMessage As Fitbit.Api.Client.responses.UpdateBodyFatGoal) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.UpdateBodyFatGoal).%New()
	return ..zzHandleRequest(requestMessage, "UpdateBodyFatGoal", "post", responseMessage)
}

/// Implement operationId : addActivitiesLog
/// post /1/user/-/activities.json
Method addActivitiesLog(requestMessage As Fitbit.Api.Client.requests.addActivitiesLog, Output responseMessage As Fitbit.Api.Client.responses.addActivitiesLog) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.addActivitiesLog).%New()
	return ..zzHandleRequest(requestMessage, "addActivitiesLog", "post", responseMessage)
}

/// Implement operationId : addAlarms
/// post /1/user/-/devices/tracker/{tracker-id}/alarms.json
Method addAlarms(requestMessage As Fitbit.Api.Client.requests.addAlarms, Output responseMessage As Fitbit.Api.Client.responses.addAlarms) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.addAlarms).%New()
	return ..zzHandleRequest(requestMessage, "addAlarms", "post", responseMessage)
}

/// Implement operationId : addBodyFatLog
/// post /1/user/-/body/log/fat.json
Method addBodyFatLog(requestMessage As Fitbit.Api.Client.requests.addBodyFatLog, Output responseMessage As Fitbit.Api.Client.responses.addBodyFatLog) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.addBodyFatLog).%New()
	return ..zzHandleRequest(requestMessage, "addBodyFatLog", "post", responseMessage)
}

/// Implement operationId : addFavoriteActivities
/// post /1/user/-/activities/favorite/{activity-id}.json
Method addFavoriteActivities(requestMessage As Fitbit.Api.Client.requests.addFavoriteActivities, Output responseMessage As Fitbit.Api.Client.responses.addFavoriteActivities) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.addFavoriteActivities).%New()
	return ..zzHandleRequest(requestMessage, "addFavoriteActivities", "post", responseMessage)
}

/// Implement operationId : addFavoriteFood
/// post /1/user/-/foods/log/favorite/{food-id}.json
Method addFavoriteFood(requestMessage As Fitbit.Api.Client.requests.addFavoriteFood, Output responseMessage As Fitbit.Api.Client.responses.addFavoriteFood) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.addFavoriteFood).%New()
	return ..zzHandleRequest(requestMessage, "addFavoriteFood", "post", responseMessage)
}

/// Implement operationId : addFoods
/// post /1/user/-/foods.json
Method addFoods(requestMessage As Fitbit.Api.Client.requests.addFoods, Output responseMessage As Fitbit.Api.Client.responses.addFoods) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.addFoods).%New()
	return ..zzHandleRequest(requestMessage, "addFoods", "post", responseMessage)
}

/// Implement operationId : addFoodsLog
/// post /1/user/-/foods/log.json
Method addFoodsLog(requestMessage As Fitbit.Api.Client.requests.addFoodsLog, Output responseMessage As Fitbit.Api.Client.responses.addFoodsLog) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.addFoodsLog).%New()
	return ..zzHandleRequest(requestMessage, "addFoodsLog", "post", responseMessage)
}

/// Implement operationId : addMeal
/// post /1/user/-/meals.json
Method addMeal(requestMessage As Fitbit.Api.Client.requests.addMeal, Output responseMessage As Fitbit.Api.Client.responses.addMeal) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.addMeal).%New()
	return ..zzHandleRequest(requestMessage, "addMeal", "post", responseMessage)
}

/// Implement operationId : addSleep
/// post /1.2/user/-/sleep.json
Method addSleep(requestMessage As Fitbit.Api.Client.requests.addSleep, Output responseMessage As Fitbit.Api.Client.responses.addSleep) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.addSleep).%New()
	return ..zzHandleRequest(requestMessage, "addSleep", "post", responseMessage)
}

/// Implement operationId : addSubscriptions
/// post /1/user/-/{collection-path}/apiSubscriptions/{subscription-id}.json
Method addSubscriptions(requestMessage As Fitbit.Api.Client.requests.addSubscriptions, Output responseMessage As Fitbit.Api.Client.responses.addSubscriptions) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.addSubscriptions).%New()
	return ..zzHandleRequest(requestMessage, "addSubscriptions", "post", responseMessage)
}

/// Implement operationId : addUpdateActivitiesGoals
/// post /1/user/-/activities/goals/{period}.json
Method addUpdateActivitiesGoals(requestMessage As Fitbit.Api.Client.requests.addUpdateActivitiesGoals, Output responseMessage As Fitbit.Api.Client.responses.addUpdateActivitiesGoals) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.addUpdateActivitiesGoals).%New()
	return ..zzHandleRequest(requestMessage, "addUpdateActivitiesGoals", "post", responseMessage)
}

/// Implement operationId : addUpdateFoodsGoal
/// post /1/user/-/foods/log/goal.json
Method addUpdateFoodsGoal(requestMessage As Fitbit.Api.Client.requests.addUpdateFoodsGoal, Output responseMessage As Fitbit.Api.Client.responses.addUpdateFoodsGoal) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.addUpdateFoodsGoal).%New()
	return ..zzHandleRequest(requestMessage, "addUpdateFoodsGoal", "post", responseMessage)
}

/// Implement operationId : addUpdateWaterGoal
/// post /1/user/-/foods/log/water/goal.json
Method addUpdateWaterGoal(requestMessage As Fitbit.Api.Client.requests.addUpdateWaterGoal, Output responseMessage As Fitbit.Api.Client.responses.addUpdateWaterGoal) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.addUpdateWaterGoal).%New()
	return ..zzHandleRequest(requestMessage, "addUpdateWaterGoal", "post", responseMessage)
}

/// Implement operationId : addWaterLog
/// post /1/user/-/foods/log/water.json
Method addWaterLog(requestMessage As Fitbit.Api.Client.requests.addWaterLog, Output responseMessage As Fitbit.Api.Client.responses.addWaterLog) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.addWaterLog).%New()
	return ..zzHandleRequest(requestMessage, "addWaterLog", "post", responseMessage)
}

/// Implement operationId : addWeightLog
/// post /1/user/-/body/log/weight.json
Method addWeightLog(requestMessage As Fitbit.Api.Client.requests.addWeightLog, Output responseMessage As Fitbit.Api.Client.responses.addWeightLog) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.addWeightLog).%New()
	return ..zzHandleRequest(requestMessage, "addWeightLog", "post", responseMessage)
}

/// Implement operationId : deleteActivitiesLog
/// delete /1/user/-/activities/{activity-log-id}.json
Method deleteActivitiesLog(requestMessage As Fitbit.Api.Client.requests.deleteActivitiesLog, Output responseMessage As Fitbit.Api.Client.responses.deleteActivitiesLog) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.deleteActivitiesLog).%New()
	return ..zzHandleRequest(requestMessage, "deleteActivitiesLog", "delete", responseMessage)
}

/// Implement operationId : deleteAlarms
/// delete /1/user/-/devices/tracker/{tracker-id}/alarms/{alarm-id}.json
Method deleteAlarms(requestMessage As Fitbit.Api.Client.requests.deleteAlarms, Output responseMessage As Fitbit.Api.Client.responses.deleteAlarms) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.deleteAlarms).%New()
	return ..zzHandleRequest(requestMessage, "deleteAlarms", "delete", responseMessage)
}

/// Implement operationId : deleteBodyFatLog
/// delete /1/user/-/body/log/fat/{body-fat-log-id}.json
Method deleteBodyFatLog(requestMessage As Fitbit.Api.Client.requests.deleteBodyFatLog, Output responseMessage As Fitbit.Api.Client.responses.deleteBodyFatLog) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.deleteBodyFatLog).%New()
	return ..zzHandleRequest(requestMessage, "deleteBodyFatLog", "delete", responseMessage)
}

/// Implement operationId : deleteFavoriteActivities
/// delete /1/user/-/activities/favorite/{activity-id}.json
Method deleteFavoriteActivities(requestMessage As Fitbit.Api.Client.requests.deleteFavoriteActivities, Output responseMessage As Fitbit.Api.Client.responses.deleteFavoriteActivities) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.deleteFavoriteActivities).%New()
	return ..zzHandleRequest(requestMessage, "deleteFavoriteActivities", "delete", responseMessage)
}

/// Implement operationId : deleteFavoriteFood
/// delete /1/user/-/foods/log/favorite/{food-id}.json
Method deleteFavoriteFood(requestMessage As Fitbit.Api.Client.requests.deleteFavoriteFood, Output responseMessage As Fitbit.Api.Client.responses.deleteFavoriteFood) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.deleteFavoriteFood).%New()
	return ..zzHandleRequest(requestMessage, "deleteFavoriteFood", "delete", responseMessage)
}

/// Implement operationId : deleteFoods
/// delete /1/user/-/foods/{food-id}.json
Method deleteFoods(requestMessage As Fitbit.Api.Client.requests.deleteFoods, Output responseMessage As Fitbit.Api.Client.responses.deleteFoods) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.deleteFoods).%New()
	return ..zzHandleRequest(requestMessage, "deleteFoods", "delete", responseMessage)
}

/// Implement operationId : deleteFoodsLog
/// delete /1/user/-/foods/log/{food-log-id}.json
Method deleteFoodsLog(requestMessage As Fitbit.Api.Client.requests.deleteFoodsLog, Output responseMessage As Fitbit.Api.Client.responses.deleteFoodsLog) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.deleteFoodsLog).%New()
	return ..zzHandleRequest(requestMessage, "deleteFoodsLog", "delete", responseMessage)
}

/// Implement operationId : deleteMeal
/// delete /1/user/-/meals/{meal-id}.json
Method deleteMeal(requestMessage As Fitbit.Api.Client.requests.deleteMeal, Output responseMessage As Fitbit.Api.Client.responses.deleteMeal) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.deleteMeal).%New()
	return ..zzHandleRequest(requestMessage, "deleteMeal", "delete", responseMessage)
}

/// Implement operationId : deleteSleep
/// delete /1.2/user/-/sleep/{log-id}.json
Method deleteSleep(requestMessage As Fitbit.Api.Client.requests.deleteSleep, Output responseMessage As Fitbit.Api.Client.responses.deleteSleep) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.deleteSleep).%New()
	return ..zzHandleRequest(requestMessage, "deleteSleep", "delete", responseMessage)
}

/// Implement operationId : deleteSubscriptions
/// delete /1/user/-/{collection-path}/apiSubscriptions/{subscription-id}.json
Method deleteSubscriptions(requestMessage As Fitbit.Api.Client.requests.deleteSubscriptions, Output responseMessage As Fitbit.Api.Client.responses.deleteSubscriptions) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.deleteSubscriptions).%New()
	return ..zzHandleRequest(requestMessage, "deleteSubscriptions", "delete", responseMessage)
}

/// Implement operationId : deleteWaterLog
/// delete /1/user/-/foods/log/water/{water-log-id}.json
Method deleteWaterLog(requestMessage As Fitbit.Api.Client.requests.deleteWaterLog, Output responseMessage As Fitbit.Api.Client.responses.deleteWaterLog) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.deleteWaterLog).%New()
	return ..zzHandleRequest(requestMessage, "deleteWaterLog", "delete", responseMessage)
}

/// Implement operationId : deleteWeightLog
/// delete /1/user/-/body/log/weight/{body-weight-log-id}.json
Method deleteWeightLog(requestMessage As Fitbit.Api.Client.requests.deleteWeightLog, Output responseMessage As Fitbit.Api.Client.responses.deleteWeightLog) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.deleteWeightLog).%New()
	return ..zzHandleRequest(requestMessage, "deleteWeightLog", "delete", responseMessage)
}

/// Implement operationId : editFoodsLog
/// post /1/user/-/foods/log/{food-log-id}.json
Method editFoodsLog(requestMessage As Fitbit.Api.Client.requests.editFoodsLog, Output responseMessage As Fitbit.Api.Client.responses.editFoodsLog) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.editFoodsLog).%New()
	return ..zzHandleRequest(requestMessage, "editFoodsLog", "post", responseMessage)
}

/// Implement operationId : getAZMByDateIntraday
/// get /1/user/-/activities/active-zone-minutes/date/{date}/1d/{detail-level}.json
Method getAZMByDateIntraday(requestMessage As Fitbit.Api.Client.requests.getAZMByDateIntraday, Output responseMessage As Fitbit.Api.Client.responses.getAZMByDateIntraday) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getAZMByDateIntraday).%New()
	return ..zzHandleRequest(requestMessage, "getAZMByDateIntraday", "get", responseMessage)
}

/// Implement operationId : getAZMByDateTimeSeriesIntraday
/// get /1/user/-/activities/active-zone-minutes/date/{date}/1d/{detail-level}/time/{start-time}/{end-time}.json
Method getAZMByDateTimeSeriesIntraday(requestMessage As Fitbit.Api.Client.requests.getAZMByDateTimeSeriesIntraday, Output responseMessage As Fitbit.Api.Client.responses.getAZMByDateTimeSeriesIntraday) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getAZMByDateTimeSeriesIntraday).%New()
	return ..zzHandleRequest(requestMessage, "getAZMByDateTimeSeriesIntraday", "get", responseMessage)
}

/// Implement operationId : getAZMByIntervalIntraday
/// get /1/user/-/activities/active-zone-minutes/date/{start-date}/{end-date}/{detail-level}.json
Method getAZMByIntervalIntraday(requestMessage As Fitbit.Api.Client.requests.getAZMByIntervalIntraday, Output responseMessage As Fitbit.Api.Client.responses.getAZMByIntervalIntraday) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getAZMByIntervalIntraday).%New()
	return ..zzHandleRequest(requestMessage, "getAZMByIntervalIntraday", "get", responseMessage)
}

/// Implement operationId : getAZMByIntervalTimeSeriesIntraday
/// get /1/user/-/activities/active-zone-minutes/date/{start-date}/{end-date}/time/{start-time}/{end-time}.json
Method getAZMByIntervalTimeSeriesIntraday(requestMessage As Fitbit.Api.Client.requests.getAZMByIntervalTimeSeriesIntraday, Output responseMessage As Fitbit.Api.Client.responses.getAZMByIntervalTimeSeriesIntraday) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getAZMByIntervalTimeSeriesIntraday).%New()
	return ..zzHandleRequest(requestMessage, "getAZMByIntervalTimeSeriesIntraday", "get", responseMessage)
}

/// Implement operationId : getAZMTimeSeriesByDate
/// get /1/user/-/activities/active-zone-minutes/date/{date}/{period}.json
Method getAZMTimeSeriesByDate(requestMessage As Fitbit.Api.Client.requests.getAZMTimeSeriesByDate, Output responseMessage As Fitbit.Api.Client.responses.getAZMTimeSeriesByDate) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getAZMTimeSeriesByDate).%New()
	return ..zzHandleRequest(requestMessage, "getAZMTimeSeriesByDate", "get", responseMessage)
}

/// Implement operationId : getAZMTimeSeriesByInterval
/// get /1/user/-/activities/active-zone-minutes/date/{start-date}/{end-date}.json
Method getAZMTimeSeriesByInterval(requestMessage As Fitbit.Api.Client.requests.getAZMTimeSeriesByInterval, Output responseMessage As Fitbit.Api.Client.responses.getAZMTimeSeriesByInterval) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getAZMTimeSeriesByInterval).%New()
	return ..zzHandleRequest(requestMessage, "getAZMTimeSeriesByInterval", "get", responseMessage)
}

/// Implement operationId : getActivitiesByDate
/// get /1/user/-/activities/date/{date}.json
Method getActivitiesByDate(requestMessage As Fitbit.Api.Client.requests.getActivitiesByDate, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesByDate) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getActivitiesByDate).%New()
	return ..zzHandleRequest(requestMessage, "getActivitiesByDate", "get", responseMessage)
}

/// Implement operationId : getActivitiesGoals
/// get /1/user/-/activities/goals/{period}.json
Method getActivitiesGoals(requestMessage As Fitbit.Api.Client.requests.getActivitiesGoals, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesGoals) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getActivitiesGoals).%New()
	return ..zzHandleRequest(requestMessage, "getActivitiesGoals", "get", responseMessage)
}

/// Implement operationId : getActivitiesLog
/// get /1/user/-/activities.json
Method getActivitiesLog(requestMessage As Fitbit.Api.Client.requests.getActivitiesLog, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesLog) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getActivitiesLog).%New()
	return ..zzHandleRequest(requestMessage, "getActivitiesLog", "get", responseMessage)
}

/// Implement operationId : getActivitiesLogList
/// get /1/user/-/activities/list.json
Method getActivitiesLogList(requestMessage As Fitbit.Api.Client.requests.getActivitiesLogList, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesLogList) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getActivitiesLogList).%New()
	return ..zzHandleRequest(requestMessage, "getActivitiesLogList", "get", responseMessage)
}

/// Implement operationId : getActivitiesResourceByDateIntraday
/// get /1/user/-/activities/{resource-path}/date/{date}/1d/{detail-level}.json
Method getActivitiesResourceByDateIntraday(requestMessage As Fitbit.Api.Client.requests.getActivitiesResourceByDateIntraday, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesResourceByDateIntraday) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getActivitiesResourceByDateIntraday).%New()
	return ..zzHandleRequest(requestMessage, "getActivitiesResourceByDateIntraday", "get", responseMessage)
}

/// Implement operationId : getActivitiesResourceByDatePeriod
/// get /1/user/-/activities/{resource-path}/date/{date}/{period}.json
Method getActivitiesResourceByDatePeriod(requestMessage As Fitbit.Api.Client.requests.getActivitiesResourceByDatePeriod, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesResourceByDatePeriod) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getActivitiesResourceByDatePeriod).%New()
	return ..zzHandleRequest(requestMessage, "getActivitiesResourceByDatePeriod", "get", responseMessage)
}

/// Implement operationId : getActivitiesResourceByDateRange
/// get /1/user/-/activities/{resource-path}/date/{base-date}/{end-date}.json
Method getActivitiesResourceByDateRange(requestMessage As Fitbit.Api.Client.requests.getActivitiesResourceByDateRange, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesResourceByDateRange) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getActivitiesResourceByDateRange).%New()
	return ..zzHandleRequest(requestMessage, "getActivitiesResourceByDateRange", "get", responseMessage)
}

/// Implement operationId : getActivitiesResourceByDateRangeIntraday
/// get /1/user/-/activities/{resource-path}/date/{base-date}/{end-date}/{detail-level}.json
Method getActivitiesResourceByDateRangeIntraday(requestMessage As Fitbit.Api.Client.requests.getActivitiesResourceByDateRangeIntraday, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesResourceByDateRangeIntraday) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getActivitiesResourceByDateRangeIntraday).%New()
	return ..zzHandleRequest(requestMessage, "getActivitiesResourceByDateRangeIntraday", "get", responseMessage)
}

/// Implement operationId : getActivitiesResourceByDateRangeTimeSeriesIntraday
/// get /1/user/-/activities/{resource-path}/date/{date}/{end-date}/{detail-level}/time/{start-time}/{end-time}.json
Method getActivitiesResourceByDateRangeTimeSeriesIntraday(requestMessage As Fitbit.Api.Client.requests.getActivitiesResourceByDateRangeTimeSeriesIntraday, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesResourceByDateRangeTimeSeriesIntraday) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getActivitiesResourceByDateRangeTimeSeriesIntraday).%New()
	return ..zzHandleRequest(requestMessage, "getActivitiesResourceByDateRangeTimeSeriesIntraday", "get", responseMessage)
}

/// Implement operationId : getActivitiesResourceByDateTimeSeriesIntraday
/// get /1/user/-/activities/{resource-path}/date/{date}/1d/{detail-level}/time/{start-time}/{end-time}.json
Method getActivitiesResourceByDateTimeSeriesIntraday(requestMessage As Fitbit.Api.Client.requests.getActivitiesResourceByDateTimeSeriesIntraday, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesResourceByDateTimeSeriesIntraday) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getActivitiesResourceByDateTimeSeriesIntraday).%New()
	return ..zzHandleRequest(requestMessage, "getActivitiesResourceByDateTimeSeriesIntraday", "get", responseMessage)
}

/// Implement operationId : getActivitiesTCX
/// get /1/user/-/activities/{log-id}.tcx
Method getActivitiesTCX(requestMessage As Fitbit.Api.Client.requests.getActivitiesTCX, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesTCX) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getActivitiesTCX).%New()
	return ..zzHandleRequest(requestMessage, "getActivitiesTCX", "get", responseMessage)
}

/// Implement operationId : getActivitiesTrackerResourceByDatePeriod
/// get /1/user/-/activities/tracker/{resource-path}/date/{date}/{period}.json
Method getActivitiesTrackerResourceByDatePeriod(requestMessage As Fitbit.Api.Client.requests.getActivitiesTrackerResourceByDatePeriod, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesTrackerResourceByDatePeriod) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getActivitiesTrackerResourceByDatePeriod).%New()
	return ..zzHandleRequest(requestMessage, "getActivitiesTrackerResourceByDatePeriod", "get", responseMessage)
}

/// Implement operationId : getActivitiesTrackerResourceByDateRange
/// get /1/user/-/activities/tracker/{resource-path}/date/{base-date}/{end-date}.json
Method getActivitiesTrackerResourceByDateRange(requestMessage As Fitbit.Api.Client.requests.getActivitiesTrackerResourceByDateRange, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesTrackerResourceByDateRange) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getActivitiesTrackerResourceByDateRange).%New()
	return ..zzHandleRequest(requestMessage, "getActivitiesTrackerResourceByDateRange", "get", responseMessage)
}

/// Implement operationId : getActivitiesTypeDetail
/// get /1/activities/{activity-id}.json
Method getActivitiesTypeDetail(requestMessage As Fitbit.Api.Client.requests.getActivitiesTypeDetail, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesTypeDetail) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getActivitiesTypeDetail).%New()
	return ..zzHandleRequest(requestMessage, "getActivitiesTypeDetail", "get", responseMessage)
}

/// Implement operationId : getActivitiesTypes
/// get /1/activities.json
Method getActivitiesTypes(requestMessage As Fitbit.Api.Client.requests.getActivitiesTypes, Output responseMessage As Fitbit.Api.Client.responses.getActivitiesTypes) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getActivitiesTypes).%New()
	return ..zzHandleRequest(requestMessage, "getActivitiesTypes", "get", responseMessage)
}

/// Implement operationId : getAlarms
/// get /1/user/-/devices/tracker/{tracker-id}/alarms.json
Method getAlarms(requestMessage As Fitbit.Api.Client.requests.getAlarms, Output responseMessage As Fitbit.Api.Client.responses.getAlarms) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getAlarms).%New()
	return ..zzHandleRequest(requestMessage, "getAlarms", "get", responseMessage)
}

/// Implement operationId : getBadges
/// get /1/user/-/badges.json
Method getBadges(requestMessage As Fitbit.Api.Client.requests.getBadges, Output responseMessage As Fitbit.Api.Client.responses.getBadges) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getBadges).%New()
	return ..zzHandleRequest(requestMessage, "getBadges", "get", responseMessage)
}

/// Implement operationId : getBodyFatByDate
/// get /1/user/-/body/log/fat/date/{date}.json
Method getBodyFatByDate(requestMessage As Fitbit.Api.Client.requests.getBodyFatByDate, Output responseMessage As Fitbit.Api.Client.responses.getBodyFatByDate) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getBodyFatByDate).%New()
	return ..zzHandleRequest(requestMessage, "getBodyFatByDate", "get", responseMessage)
}

/// Implement operationId : getBodyFatByDatePeriod
/// get /1/user/-/body/log/fat/date/{date}/{period}.json
Method getBodyFatByDatePeriod(requestMessage As Fitbit.Api.Client.requests.getBodyFatByDatePeriod, Output responseMessage As Fitbit.Api.Client.responses.getBodyFatByDatePeriod) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getBodyFatByDatePeriod).%New()
	return ..zzHandleRequest(requestMessage, "getBodyFatByDatePeriod", "get", responseMessage)
}

/// Implement operationId : getBodyFatByDateRange
/// get /1/user/-/body/log/fat/date/{base-date}/{end-date}.json
Method getBodyFatByDateRange(requestMessage As Fitbit.Api.Client.requests.getBodyFatByDateRange, Output responseMessage As Fitbit.Api.Client.responses.getBodyFatByDateRange) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getBodyFatByDateRange).%New()
	return ..zzHandleRequest(requestMessage, "getBodyFatByDateRange", "get", responseMessage)
}

/// Implement operationId : getBodyGoals
/// get /1/user/-/body/log/{goal-type}/goal.json
Method getBodyGoals(requestMessage As Fitbit.Api.Client.requests.getBodyGoals, Output responseMessage As Fitbit.Api.Client.responses.getBodyGoals) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getBodyGoals).%New()
	return ..zzHandleRequest(requestMessage, "getBodyGoals", "get", responseMessage)
}

/// Implement operationId : getBodyResourceByDatePeriod
/// get /1/user/-/body/{resource-path}/date/{date}/{period}.json
Method getBodyResourceByDatePeriod(requestMessage As Fitbit.Api.Client.requests.getBodyResourceByDatePeriod, Output responseMessage As Fitbit.Api.Client.responses.getBodyResourceByDatePeriod) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getBodyResourceByDatePeriod).%New()
	return ..zzHandleRequest(requestMessage, "getBodyResourceByDatePeriod", "get", responseMessage)
}

/// Implement operationId : getBodyResourceByDateRange
/// get /1/user/-/body/{resource-path}/date/{base-date}/{end-date}.json
Method getBodyResourceByDateRange(requestMessage As Fitbit.Api.Client.requests.getBodyResourceByDateRange, Output responseMessage As Fitbit.Api.Client.responses.getBodyResourceByDateRange) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getBodyResourceByDateRange).%New()
	return ..zzHandleRequest(requestMessage, "getBodyResourceByDateRange", "get", responseMessage)
}

/// Implement operationId : getBreathingRateIntradayByDate
/// get /1/user/-/br/date/{date}/all.json
Method getBreathingRateIntradayByDate(requestMessage As Fitbit.Api.Client.requests.getBreathingRateIntradayByDate, Output responseMessage As Fitbit.Api.Client.responses.getBreathingRateIntradayByDate) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getBreathingRateIntradayByDate).%New()
	return ..zzHandleRequest(requestMessage, "getBreathingRateIntradayByDate", "get", responseMessage)
}

/// Implement operationId : getBreathingRateIntradayByInterval
/// get /1/user/-/br/date/{startDate}/{endDate}/all.json
Method getBreathingRateIntradayByInterval(requestMessage As Fitbit.Api.Client.requests.getBreathingRateIntradayByInterval, Output responseMessage As Fitbit.Api.Client.responses.getBreathingRateIntradayByInterval) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getBreathingRateIntradayByInterval).%New()
	return ..zzHandleRequest(requestMessage, "getBreathingRateIntradayByInterval", "get", responseMessage)
}

/// Implement operationId : getBreathingRateSummaryByDate
/// get /1/user/-/br/date/{date}.json
Method getBreathingRateSummaryByDate(requestMessage As Fitbit.Api.Client.requests.getBreathingRateSummaryByDate, Output responseMessage As Fitbit.Api.Client.responses.getBreathingRateSummaryByDate) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getBreathingRateSummaryByDate).%New()
	return ..zzHandleRequest(requestMessage, "getBreathingRateSummaryByDate", "get", responseMessage)
}

/// Implement operationId : getBreathingRateSummaryByInterval
/// get /1/user/-/br/date/{startDate}/{endDate}.json
Method getBreathingRateSummaryByInterval(requestMessage As Fitbit.Api.Client.requests.getBreathingRateSummaryByInterval, Output responseMessage As Fitbit.Api.Client.responses.getBreathingRateSummaryByInterval) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getBreathingRateSummaryByInterval).%New()
	return ..zzHandleRequest(requestMessage, "getBreathingRateSummaryByInterval", "get", responseMessage)
}

/// Implement operationId : getDevices
/// get /1/user/-/devices.json
Method getDevices(requestMessage As Fitbit.Api.Client.requests.getDevices, Output responseMessage As Fitbit.Api.Client.responses.getDevices) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getDevices).%New()
	return ..zzHandleRequest(requestMessage, "getDevices", "get", responseMessage)
}

/// Implement operationId : getEcgLogList
/// get /1/user/-/ecg/list.json
Method getEcgLogList(requestMessage As Fitbit.Api.Client.requests.getEcgLogList, Output responseMessage As Fitbit.Api.Client.responses.getEcgLogList) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getEcgLogList).%New()
	return ..zzHandleRequest(requestMessage, "getEcgLogList", "get", responseMessage)
}

/// Implement operationId : getFavoriteActivities
/// get /1/user/-/activities/favorite.json
Method getFavoriteActivities(requestMessage As Fitbit.Api.Client.requests.getFavoriteActivities, Output responseMessage As Fitbit.Api.Client.responses.getFavoriteActivities) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getFavoriteActivities).%New()
	return ..zzHandleRequest(requestMessage, "getFavoriteActivities", "get", responseMessage)
}

/// Implement operationId : getFavoriteFoods
/// get /1/user/-/foods/log/favorite.json
Method getFavoriteFoods(requestMessage As Fitbit.Api.Client.requests.getFavoriteFoods, Output responseMessage As Fitbit.Api.Client.responses.getFavoriteFoods) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getFavoriteFoods).%New()
	return ..zzHandleRequest(requestMessage, "getFavoriteFoods", "get", responseMessage)
}

/// Implement operationId : getFoodsByDate
/// get /1/user/-/foods/log/date/{date}.json
Method getFoodsByDate(requestMessage As Fitbit.Api.Client.requests.getFoodsByDate, Output responseMessage As Fitbit.Api.Client.responses.getFoodsByDate) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getFoodsByDate).%New()
	return ..zzHandleRequest(requestMessage, "getFoodsByDate", "get", responseMessage)
}

/// Implement operationId : getFoodsByDateRange
/// get /1/user/-/foods/log/{resource-path}/date/{base-date}/{end-date}.json
Method getFoodsByDateRange(requestMessage As Fitbit.Api.Client.requests.getFoodsByDateRange, Output responseMessage As Fitbit.Api.Client.responses.getFoodsByDateRange) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getFoodsByDateRange).%New()
	return ..zzHandleRequest(requestMessage, "getFoodsByDateRange", "get", responseMessage)
}

/// Implement operationId : getFoodsGoal
/// get /1/user/-/foods/log/goal.json
Method getFoodsGoal(requestMessage As Fitbit.Api.Client.requests.getFoodsGoal, Output responseMessage As Fitbit.Api.Client.responses.getFoodsGoal) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getFoodsGoal).%New()
	return ..zzHandleRequest(requestMessage, "getFoodsGoal", "get", responseMessage)
}

/// Implement operationId : getFoodsInfo
/// get /1/foods/{food-id}.json
Method getFoodsInfo(requestMessage As Fitbit.Api.Client.requests.getFoodsInfo, Output responseMessage As Fitbit.Api.Client.responses.getFoodsInfo) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getFoodsInfo).%New()
	return ..zzHandleRequest(requestMessage, "getFoodsInfo", "get", responseMessage)
}

/// Implement operationId : getFoodsList
/// get /1/foods/search.json
Method getFoodsList(requestMessage As Fitbit.Api.Client.requests.getFoodsList, Output responseMessage As Fitbit.Api.Client.responses.getFoodsList) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getFoodsList).%New()
	return ..zzHandleRequest(requestMessage, "getFoodsList", "get", responseMessage)
}

/// Implement operationId : getFoodsLocales
/// get /1/foods/locales.json
Method getFoodsLocales(requestMessage As Fitbit.Api.Client.requests.getFoodsLocales, Output responseMessage As Fitbit.Api.Client.responses.getFoodsLocales) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getFoodsLocales).%New()
	return ..zzHandleRequest(requestMessage, "getFoodsLocales", "get", responseMessage)
}

/// Implement operationId : getFoodsResourceByDatePeriod
/// get /1/user/-/foods/log/{resource-path}/date/{date}/{period}.json
Method getFoodsResourceByDatePeriod(requestMessage As Fitbit.Api.Client.requests.getFoodsResourceByDatePeriod, Output responseMessage As Fitbit.Api.Client.responses.getFoodsResourceByDatePeriod) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getFoodsResourceByDatePeriod).%New()
	return ..zzHandleRequest(requestMessage, "getFoodsResourceByDatePeriod", "get", responseMessage)
}

/// Implement operationId : getFoodsUnits
/// get /1/foods/units.json
Method getFoodsUnits(requestMessage As Fitbit.Api.Client.requests.getFoodsUnits, Output responseMessage As Fitbit.Api.Client.responses.getFoodsUnits) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getFoodsUnits).%New()
	return ..zzHandleRequest(requestMessage, "getFoodsUnits", "get", responseMessage)
}

/// Implement operationId : getFrequentActivities
/// get /1/user/-/activities/frequent.json
Method getFrequentActivities(requestMessage As Fitbit.Api.Client.requests.getFrequentActivities, Output responseMessage As Fitbit.Api.Client.responses.getFrequentActivities) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getFrequentActivities).%New()
	return ..zzHandleRequest(requestMessage, "getFrequentActivities", "get", responseMessage)
}

/// Implement operationId : getFrequentFoods
/// get /1/user/-/foods/log/frequent.json
Method getFrequentFoods(requestMessage As Fitbit.Api.Client.requests.getFrequentFoods, Output responseMessage As Fitbit.Api.Client.responses.getFrequentFoods) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getFrequentFoods).%New()
	return ..zzHandleRequest(requestMessage, "getFrequentFoods", "get", responseMessage)
}

/// Implement operationId : getFriends
/// get /1.1/user/-/friends.json
Method getFriends(requestMessage As Fitbit.Api.Client.requests.getFriends, Output responseMessage As Fitbit.Api.Client.responses.getFriends) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getFriends).%New()
	return ..zzHandleRequest(requestMessage, "getFriends", "get", responseMessage)
}

/// Implement operationId : getFriendsLeaderboard
/// get /1.1/user/-/leaderboard/friends.json
Method getFriendsLeaderboard(requestMessage As Fitbit.Api.Client.requests.getFriendsLeaderboard, Output responseMessage As Fitbit.Api.Client.responses.getFriendsLeaderboard) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getFriendsLeaderboard).%New()
	return ..zzHandleRequest(requestMessage, "getFriendsLeaderboard", "get", responseMessage)
}

/// Implement operationId : getHeartByDateIntraday
/// get /1/user/-/activities/heart/date/{date}/1d/{detail-level}.json
Method getHeartByDateIntraday(requestMessage As Fitbit.Api.Client.requests.getHeartByDateIntraday, Output responseMessage As Fitbit.Api.Client.responses.getHeartByDateIntraday) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getHeartByDateIntraday).%New()
	return ..zzHandleRequest(requestMessage, "getHeartByDateIntraday", "get", responseMessage)
}

/// Implement operationId : getHeartByDatePeriod
/// get /1/user/-/activities/heart/date/{date}/{period}.json
Method getHeartByDatePeriod(requestMessage As Fitbit.Api.Client.requests.getHeartByDatePeriod, Output responseMessage As Fitbit.Api.Client.responses.getHeartByDatePeriod) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getHeartByDatePeriod).%New()
	return ..zzHandleRequest(requestMessage, "getHeartByDatePeriod", "get", responseMessage)
}

/// Implement operationId : getHeartByDateRange
/// get /1/user/-/activities/heart/date/{base-date}/{end-date}.json
Method getHeartByDateRange(requestMessage As Fitbit.Api.Client.requests.getHeartByDateRange, Output responseMessage As Fitbit.Api.Client.responses.getHeartByDateRange) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getHeartByDateRange).%New()
	return ..zzHandleRequest(requestMessage, "getHeartByDateRange", "get", responseMessage)
}

/// Implement operationId : getHeartByDateRangeIntraday
/// get /1/user/-/activities/heart/date/{date}/{end-date}/{detail-level}.json
Method getHeartByDateRangeIntraday(requestMessage As Fitbit.Api.Client.requests.getHeartByDateRangeIntraday, Output responseMessage As Fitbit.Api.Client.responses.getHeartByDateRangeIntraday) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getHeartByDateRangeIntraday).%New()
	return ..zzHandleRequest(requestMessage, "getHeartByDateRangeIntraday", "get", responseMessage)
}

/// Implement operationId : getHeartByDateRangeTimestampIntraday
/// get /1/user/-/activities/heart/date/{date}/{end-date}/{detail-level}/time/{start-time}/{end-time}.json
Method getHeartByDateRangeTimestampIntraday(requestMessage As Fitbit.Api.Client.requests.getHeartByDateRangeTimestampIntraday, Output responseMessage As Fitbit.Api.Client.responses.getHeartByDateRangeTimestampIntraday) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getHeartByDateRangeTimestampIntraday).%New()
	return ..zzHandleRequest(requestMessage, "getHeartByDateRangeTimestampIntraday", "get", responseMessage)
}

/// Implement operationId : getHeartByDateTimestampIntraday
/// get /1/user/-/activities/heart/date/{date}/1d/{detail-level}/time/{start-time}/{end-time}.json
Method getHeartByDateTimestampIntraday(requestMessage As Fitbit.Api.Client.requests.getHeartByDateTimestampIntraday, Output responseMessage As Fitbit.Api.Client.responses.getHeartByDateTimestampIntraday) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getHeartByDateTimestampIntraday).%New()
	return ..zzHandleRequest(requestMessage, "getHeartByDateTimestampIntraday", "get", responseMessage)
}

/// Implement operationId : getHrvIntradayByDate
/// get /1/user/-/hrv/date/{date}/all.json
Method getHrvIntradayByDate(requestMessage As Fitbit.Api.Client.requests.getHrvIntradayByDate, Output responseMessage As Fitbit.Api.Client.responses.getHrvIntradayByDate) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getHrvIntradayByDate).%New()
	return ..zzHandleRequest(requestMessage, "getHrvIntradayByDate", "get", responseMessage)
}

/// Implement operationId : getHrvIntradayByInterval
/// get /1/user/-/hrv/date/{startDate}/{endDate}/all.json
Method getHrvIntradayByInterval(requestMessage As Fitbit.Api.Client.requests.getHrvIntradayByInterval, Output responseMessage As Fitbit.Api.Client.responses.getHrvIntradayByInterval) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getHrvIntradayByInterval).%New()
	return ..zzHandleRequest(requestMessage, "getHrvIntradayByInterval", "get", responseMessage)
}

/// Implement operationId : getHrvSummaryDate
/// get /1/user/-/hrv/date/{date}.json
Method getHrvSummaryDate(requestMessage As Fitbit.Api.Client.requests.getHrvSummaryDate, Output responseMessage As Fitbit.Api.Client.responses.getHrvSummaryDate) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getHrvSummaryDate).%New()
	return ..zzHandleRequest(requestMessage, "getHrvSummaryDate", "get", responseMessage)
}

/// Implement operationId : getHrvSummaryInterval
/// get /1/user/-/hrv/date/{startDate}/{endDate}.json
Method getHrvSummaryInterval(requestMessage As Fitbit.Api.Client.requests.getHrvSummaryInterval, Output responseMessage As Fitbit.Api.Client.responses.getHrvSummaryInterval) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getHrvSummaryInterval).%New()
	return ..zzHandleRequest(requestMessage, "getHrvSummaryInterval", "get", responseMessage)
}

/// Implement operationId : getMeals
/// get /1/user/-/meals.json
Method getMeals(requestMessage As Fitbit.Api.Client.requests.getMeals, Output responseMessage As Fitbit.Api.Client.responses.getMeals) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getMeals).%New()
	return ..zzHandleRequest(requestMessage, "getMeals", "get", responseMessage)
}

/// Implement operationId : getProfile
/// get /1/user/-/profile.json
Method getProfile(requestMessage As Fitbit.Api.Client.requests.getProfile, Output responseMessage As Fitbit.Api.Client.responses.getProfile) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getProfile).%New()
	return ..zzHandleRequest(requestMessage, "getProfile", "get", responseMessage)
}

/// Implement operationId : getRecentActivities
/// get /1/user/-/activities/recent.json
Method getRecentActivities(requestMessage As Fitbit.Api.Client.requests.getRecentActivities, Output responseMessage As Fitbit.Api.Client.responses.getRecentActivities) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getRecentActivities).%New()
	return ..zzHandleRequest(requestMessage, "getRecentActivities", "get", responseMessage)
}

/// Implement operationId : getRecentFoods
/// get /1/user/-/foods/log/recent.json
Method getRecentFoods(requestMessage As Fitbit.Api.Client.requests.getRecentFoods, Output responseMessage As Fitbit.Api.Client.responses.getRecentFoods) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getRecentFoods).%New()
	return ..zzHandleRequest(requestMessage, "getRecentFoods", "get", responseMessage)
}

/// Implement operationId : getSleepByDate
/// get /1.2/user/-/sleep/date/{date}.json
Method getSleepByDate(requestMessage As Fitbit.Api.Client.requests.getSleepByDate, Output responseMessage As Fitbit.Api.Client.responses.getSleepByDate) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getSleepByDate).%New()
	return ..zzHandleRequest(requestMessage, "getSleepByDate", "get", responseMessage)
}

/// Implement operationId : getSleepByDateRange
/// get /1.2/user/-/sleep/date/{base-date}/{end-date}.json
Method getSleepByDateRange(requestMessage As Fitbit.Api.Client.requests.getSleepByDateRange, Output responseMessage As Fitbit.Api.Client.responses.getSleepByDateRange) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getSleepByDateRange).%New()
	return ..zzHandleRequest(requestMessage, "getSleepByDateRange", "get", responseMessage)
}

/// Implement operationId : getSleepGoal
/// get /1.2/user/-/sleep/goal.json
Method getSleepGoal(requestMessage As Fitbit.Api.Client.requests.getSleepGoal, Output responseMessage As Fitbit.Api.Client.responses.getSleepGoal) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getSleepGoal).%New()
	return ..zzHandleRequest(requestMessage, "getSleepGoal", "get", responseMessage)
}

/// Implement operationId : getSleepList
/// get /1.2/user/-/sleep/list.json
Method getSleepList(requestMessage As Fitbit.Api.Client.requests.getSleepList, Output responseMessage As Fitbit.Api.Client.responses.getSleepList) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getSleepList).%New()
	return ..zzHandleRequest(requestMessage, "getSleepList", "get", responseMessage)
}

/// Implement operationId : getSpO2IntradayByDate
/// get /1/user/-/spo2/date/{date}/all.json
Method getSpO2IntradayByDate(requestMessage As Fitbit.Api.Client.requests.getSpO2IntradayByDate, Output responseMessage As Fitbit.Api.Client.responses.getSpO2IntradayByDate) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getSpO2IntradayByDate).%New()
	return ..zzHandleRequest(requestMessage, "getSpO2IntradayByDate", "get", responseMessage)
}

/// Implement operationId : getSpO2IntradayByInterval
/// get /1/user/-/spo2/date/{startDate}/{endDate}/all.json
Method getSpO2IntradayByInterval(requestMessage As Fitbit.Api.Client.requests.getSpO2IntradayByInterval, Output responseMessage As Fitbit.Api.Client.responses.getSpO2IntradayByInterval) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getSpO2IntradayByInterval).%New()
	return ..zzHandleRequest(requestMessage, "getSpO2IntradayByInterval", "get", responseMessage)
}

/// Implement operationId : getSpO2SummaryByDate
/// get /1/user/-/spo2/date/{date}.json
Method getSpO2SummaryByDate(requestMessage As Fitbit.Api.Client.requests.getSpO2SummaryByDate, Output responseMessage As Fitbit.Api.Client.responses.getSpO2SummaryByDate) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getSpO2SummaryByDate).%New()
	return ..zzHandleRequest(requestMessage, "getSpO2SummaryByDate", "get", responseMessage)
}

/// Implement operationId : getSpO2SummaryByInterval
/// get /1/user/-/spo2/date/{startDate}/{endDate}.json
Method getSpO2SummaryByInterval(requestMessage As Fitbit.Api.Client.requests.getSpO2SummaryByInterval, Output responseMessage As Fitbit.Api.Client.responses.getSpO2SummaryByInterval) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getSpO2SummaryByInterval).%New()
	return ..zzHandleRequest(requestMessage, "getSpO2SummaryByInterval", "get", responseMessage)
}

/// Implement operationId : getSubscriptionsList
/// get /1/user/-/{collection-path}/apiSubscriptions.json
Method getSubscriptionsList(requestMessage As Fitbit.Api.Client.requests.getSubscriptionsList, Output responseMessage As Fitbit.Api.Client.responses.getSubscriptionsList) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getSubscriptionsList).%New()
	return ..zzHandleRequest(requestMessage, "getSubscriptionsList", "get", responseMessage)
}

/// Implement operationId : getTempCoreSummaryByDate
/// get /1/user/-/temp/core/date/{date}.json
Method getTempCoreSummaryByDate(requestMessage As Fitbit.Api.Client.requests.getTempCoreSummaryByDate, Output responseMessage As Fitbit.Api.Client.responses.getTempCoreSummaryByDate) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getTempCoreSummaryByDate).%New()
	return ..zzHandleRequest(requestMessage, "getTempCoreSummaryByDate", "get", responseMessage)
}

/// Implement operationId : getTempCoreSummaryByInterval
/// get /1/user/-/temp/core/date/{startDate}/{endDate}.json
Method getTempCoreSummaryByInterval(requestMessage As Fitbit.Api.Client.requests.getTempCoreSummaryByInterval, Output responseMessage As Fitbit.Api.Client.responses.getTempCoreSummaryByInterval) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getTempCoreSummaryByInterval).%New()
	return ..zzHandleRequest(requestMessage, "getTempCoreSummaryByInterval", "get", responseMessage)
}

/// Implement operationId : getTempSkinSummaryByInterval
/// get /1/user/-/temp/skin/date/{startDate}/{endDate}.json
Method getTempSkinSummaryByInterval(requestMessage As Fitbit.Api.Client.requests.getTempSkinSummaryByInterval, Output responseMessage As Fitbit.Api.Client.responses.getTempSkinSummaryByInterval) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getTempSkinSummaryByInterval).%New()
	return ..zzHandleRequest(requestMessage, "getTempSkinSummaryByInterval", "get", responseMessage)
}

/// Implement operationId : getTempSkinSummaryDate
/// get /1/user/-/temp/skin/date/{date}.json
Method getTempSkinSummaryDate(requestMessage As Fitbit.Api.Client.requests.getTempSkinSummaryDate, Output responseMessage As Fitbit.Api.Client.responses.getTempSkinSummaryDate) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getTempSkinSummaryDate).%New()
	return ..zzHandleRequest(requestMessage, "getTempSkinSummaryDate", "get", responseMessage)
}

/// Implement operationId : getVo2MaxSummaryByDate
/// get /1/user/-/cardioscore/date/{date}.json
Method getVo2MaxSummaryByDate(requestMessage As Fitbit.Api.Client.requests.getVo2MaxSummaryByDate, Output responseMessage As Fitbit.Api.Client.responses.getVo2MaxSummaryByDate) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getVo2MaxSummaryByDate).%New()
	return ..zzHandleRequest(requestMessage, "getVo2MaxSummaryByDate", "get", responseMessage)
}

/// Implement operationId : getVo2MaxSummaryByInterval
/// get /1/user/-/cardioscore/date/{startDate}/{endDate}.json
Method getVo2MaxSummaryByInterval(requestMessage As Fitbit.Api.Client.requests.getVo2MaxSummaryByInterval, Output responseMessage As Fitbit.Api.Client.responses.getVo2MaxSummaryByInterval) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getVo2MaxSummaryByInterval).%New()
	return ..zzHandleRequest(requestMessage, "getVo2MaxSummaryByInterval", "get", responseMessage)
}

/// Implement operationId : getWaterByDate
/// get /1/user/-/foods/log/water/date/{date}.json
Method getWaterByDate(requestMessage As Fitbit.Api.Client.requests.getWaterByDate, Output responseMessage As Fitbit.Api.Client.responses.getWaterByDate) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getWaterByDate).%New()
	return ..zzHandleRequest(requestMessage, "getWaterByDate", "get", responseMessage)
}

/// Implement operationId : getWaterGoal
/// get /1/user/-/foods/log/water/goal.json
Method getWaterGoal(requestMessage As Fitbit.Api.Client.requests.getWaterGoal, Output responseMessage As Fitbit.Api.Client.responses.getWaterGoal) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getWaterGoal).%New()
	return ..zzHandleRequest(requestMessage, "getWaterGoal", "get", responseMessage)
}

/// Implement operationId : getWeightByDate
/// get /1/user/-/body/log/weight/date/{date}.json
Method getWeightByDate(requestMessage As Fitbit.Api.Client.requests.getWeightByDate, Output responseMessage As Fitbit.Api.Client.responses.getWeightByDate) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getWeightByDate).%New()
	return ..zzHandleRequest(requestMessage, "getWeightByDate", "get", responseMessage)
}

/// Implement operationId : getWeightByDatePeriod
/// get /1/user/-/body/log/weight/date/{date}/{period}.json
Method getWeightByDatePeriod(requestMessage As Fitbit.Api.Client.requests.getWeightByDatePeriod, Output responseMessage As Fitbit.Api.Client.responses.getWeightByDatePeriod) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getWeightByDatePeriod).%New()
	return ..zzHandleRequest(requestMessage, "getWeightByDatePeriod", "get", responseMessage)
}

/// Implement operationId : getWeightByDateRange
/// get /1/user/-/body/log/weight/date/{base-date}/{end-date}.json
Method getWeightByDateRange(requestMessage As Fitbit.Api.Client.requests.getWeightByDateRange, Output responseMessage As Fitbit.Api.Client.responses.getWeightByDateRange) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.getWeightByDateRange).%New()
	return ..zzHandleRequest(requestMessage, "getWeightByDateRange", "get", responseMessage)
}

/// Implement operationId : introspect
/// post /1.1/oauth2/introspect
Method introspect(requestMessage As Fitbit.Api.Client.requests.introspect, Output responseMessage As Fitbit.Api.Client.responses.introspect) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.introspect).%New()
	return ..zzHandleRequest(requestMessage, "introspect", "post", responseMessage)
}

/// Implement operationId : oauthToken
/// post /oauth2/token
Method oauthToken(requestMessage As Fitbit.Api.Client.requests.oauthToken, Output responseMessage As Fitbit.Api.Client.responses.oauthToken) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.oauthToken).%New()
	return ..zzHandleRequest(requestMessage, "oauthToken", "post", responseMessage)
}

/// Implement operationId : revoke
/// post /oauth2/revoke
Method revoke(requestMessage As Fitbit.Api.Client.requests.revoke, Output responseMessage As Fitbit.Api.Client.responses.revoke) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.revoke).%New()
	return ..zzHandleRequest(requestMessage, "revoke", "post", responseMessage)
}

/// Implement operationId : updateAlarms
/// post /1/user/-/devices/tracker/{tracker-id}/alarms/{alarm-id}.json
Method updateAlarms(requestMessage As Fitbit.Api.Client.requests.updateAlarms, Output responseMessage As Fitbit.Api.Client.responses.updateAlarms) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.updateAlarms).%New()
	return ..zzHandleRequest(requestMessage, "updateAlarms", "post", responseMessage)
}

/// Implement operationId : updateMeal
/// post /1/user/-/meals/{meal-id}.json
Method updateMeal(requestMessage As Fitbit.Api.Client.requests.updateMeal, Output responseMessage As Fitbit.Api.Client.responses.updateMeal) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.updateMeal).%New()
	return ..zzHandleRequest(requestMessage, "updateMeal", "post", responseMessage)
}

/// Implement operationId : updateProfile
/// post /1/user/-/profile.json
Method updateProfile(requestMessage As Fitbit.Api.Client.requests.updateProfile, Output responseMessage As Fitbit.Api.Client.responses.updateProfile) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.updateProfile).%New()
	return ..zzHandleRequest(requestMessage, "updateProfile", "post", responseMessage)
}

/// Implement operationId : updateSleepGoal
/// post /1.2/user/-/sleep/goal.json
Method updateSleepGoal(requestMessage As Fitbit.Api.Client.requests.updateSleepGoal, Output responseMessage As Fitbit.Api.Client.responses.updateSleepGoal) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.updateSleepGoal).%New()
	return ..zzHandleRequest(requestMessage, "updateSleepGoal", "post", responseMessage)
}

/// Implement operationId : updateWaterLog
/// post /1/user/-/foods/log/water/{water-log-id}.json
Method updateWaterLog(requestMessage As Fitbit.Api.Client.requests.updateWaterLog, Output responseMessage As Fitbit.Api.Client.responses.updateWaterLog) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.updateWaterLog).%New()
	return ..zzHandleRequest(requestMessage, "updateWaterLog", "post", responseMessage)
}

/// Implement operationId : updateWeightGoal
/// post /1/user/-/body/log/weight/goal.json
Method updateWeightGoal(requestMessage As Fitbit.Api.Client.requests.updateWeightGoal, Output responseMessage As Fitbit.Api.Client.responses.updateWeightGoal) As %Status
{
	set responseMessage = ##class(Fitbit.Api.Client.responses.updateWeightGoal).%New()
	return ..zzHandleRequest(requestMessage, "updateWeightGoal", "post", responseMessage)
}

/// Common request handler
Method zzHandleRequest(requestMessage As Fitbit.Api.Client.requests.GenericRequest, name As %String, method As %String, responseMessage As Fitbit.Api.Client.responses.GenericResponse) As %Status
{
	set sc = $$$OK, pHttpRequestIn = ##class(%Net.HttpRequest).%New()
	$$$QuitOnError(requestMessage.LoadHttpRequestObject(pHttpRequestIn))

	if (requestMessage.UserId = "")
	{
		return $$$ERROR($$$GeneralError, "No UserId specified")
	}

	set accessToken = ##class(Fitbit.DB.UserTokens).GetAccessTokenForUser(requestMessage.UserId)

	if (accessToken = "")
	{
		return $$$ERROR($$$GeneralError, "User " _ requestMessage.UserId _ " has not been authorized yet")
	}

	do pHttpRequestIn.AuthorizationSet("Bearer " _ accessToken)
	#; set pHttpRequestIn.FollowRedirect = 1

	set sc = ..Adapter.SendFormDataArray(.pHttpResponse, method, pHttpRequestIn, , , ..Adapter.URL _ requestMessage.%URL)

	if $$$ISERR(sc) && ($SYSTEM.Status.GetErrorCodes(sc) '= $$$EnsErrHTTPStatus) {
		return sc
	}

	if $ISOBJECT(pHttpResponse) {
		$$$TRACE(name _" returned " _ pHttpResponse.StatusCode)

		

		$$$QuitOnError(responseMessage.LoadFromResponse(pHttpResponse, name))
	}

	return sc
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="Fitbit.Api.Client.requests.UpdateBodyFatGoal">
		<Method>UpdateBodyFatGoal</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.addActivitiesLog">
		<Method>addActivitiesLog</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.addAlarms">
		<Method>addAlarms</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.addBodyFatLog">
		<Method>addBodyFatLog</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.addFavoriteActivities">
		<Method>addFavoriteActivities</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.addFavoriteFood">
		<Method>addFavoriteFood</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.addFoods">
		<Method>addFoods</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.addFoodsLog">
		<Method>addFoodsLog</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.addMeal">
		<Method>addMeal</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.addSleep">
		<Method>addSleep</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.addSubscriptions">
		<Method>addSubscriptions</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.addUpdateActivitiesGoals">
		<Method>addUpdateActivitiesGoals</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.addUpdateFoodsGoal">
		<Method>addUpdateFoodsGoal</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.addUpdateWaterGoal">
		<Method>addUpdateWaterGoal</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.addWaterLog">
		<Method>addWaterLog</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.addWeightLog">
		<Method>addWeightLog</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.deleteActivitiesLog">
		<Method>deleteActivitiesLog</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.deleteAlarms">
		<Method>deleteAlarms</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.deleteBodyFatLog">
		<Method>deleteBodyFatLog</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.deleteFavoriteActivities">
		<Method>deleteFavoriteActivities</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.deleteFavoriteFood">
		<Method>deleteFavoriteFood</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.deleteFoods">
		<Method>deleteFoods</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.deleteFoodsLog">
		<Method>deleteFoodsLog</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.deleteMeal">
		<Method>deleteMeal</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.deleteSleep">
		<Method>deleteSleep</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.deleteSubscriptions">
		<Method>deleteSubscriptions</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.deleteWaterLog">
		<Method>deleteWaterLog</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.deleteWeightLog">
		<Method>deleteWeightLog</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.editFoodsLog">
		<Method>editFoodsLog</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getAZMByDateIntraday">
		<Method>getAZMByDateIntraday</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getAZMByDateTimeSeriesIntraday">
		<Method>getAZMByDateTimeSeriesIntraday</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getAZMByIntervalIntraday">
		<Method>getAZMByIntervalIntraday</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getAZMByIntervalTimeSeriesIntraday">
		<Method>getAZMByIntervalTimeSeriesIntraday</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getAZMTimeSeriesByDate">
		<Method>getAZMTimeSeriesByDate</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getAZMTimeSeriesByInterval">
		<Method>getAZMTimeSeriesByInterval</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getActivitiesByDate">
		<Method>getActivitiesByDate</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getActivitiesGoals">
		<Method>getActivitiesGoals</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getActivitiesLog">
		<Method>getActivitiesLog</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getActivitiesLogList">
		<Method>getActivitiesLogList</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getActivitiesResourceByDateIntraday">
		<Method>getActivitiesResourceByDateIntraday</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getActivitiesResourceByDatePeriod">
		<Method>getActivitiesResourceByDatePeriod</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getActivitiesResourceByDateRange">
		<Method>getActivitiesResourceByDateRange</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getActivitiesResourceByDateRangeIntraday">
		<Method>getActivitiesResourceByDateRangeIntraday</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getActivitiesResourceByDateRangeTimeSeriesIntraday">
		<Method>getActivitiesResourceByDateRangeTimeSeriesIntraday</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getActivitiesResourceByDateTimeSeriesIntraday">
		<Method>getActivitiesResourceByDateTimeSeriesIntraday</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getActivitiesTCX">
		<Method>getActivitiesTCX</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getActivitiesTrackerResourceByDatePeriod">
		<Method>getActivitiesTrackerResourceByDatePeriod</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getActivitiesTrackerResourceByDateRange">
		<Method>getActivitiesTrackerResourceByDateRange</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getActivitiesTypeDetail">
		<Method>getActivitiesTypeDetail</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getActivitiesTypes">
		<Method>getActivitiesTypes</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getAlarms">
		<Method>getAlarms</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getBadges">
		<Method>getBadges</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getBodyFatByDate">
		<Method>getBodyFatByDate</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getBodyFatByDatePeriod">
		<Method>getBodyFatByDatePeriod</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getBodyFatByDateRange">
		<Method>getBodyFatByDateRange</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getBodyGoals">
		<Method>getBodyGoals</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getBodyResourceByDatePeriod">
		<Method>getBodyResourceByDatePeriod</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getBodyResourceByDateRange">
		<Method>getBodyResourceByDateRange</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getBreathingRateIntradayByDate">
		<Method>getBreathingRateIntradayByDate</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getBreathingRateIntradayByInterval">
		<Method>getBreathingRateIntradayByInterval</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getBreathingRateSummaryByDate">
		<Method>getBreathingRateSummaryByDate</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getBreathingRateSummaryByInterval">
		<Method>getBreathingRateSummaryByInterval</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getDevices">
		<Method>getDevices</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getEcgLogList">
		<Method>getEcgLogList</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getFavoriteActivities">
		<Method>getFavoriteActivities</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getFavoriteFoods">
		<Method>getFavoriteFoods</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getFoodsByDate">
		<Method>getFoodsByDate</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getFoodsByDateRange">
		<Method>getFoodsByDateRange</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getFoodsGoal">
		<Method>getFoodsGoal</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getFoodsInfo">
		<Method>getFoodsInfo</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getFoodsList">
		<Method>getFoodsList</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getFoodsLocales">
		<Method>getFoodsLocales</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getFoodsResourceByDatePeriod">
		<Method>getFoodsResourceByDatePeriod</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getFoodsUnits">
		<Method>getFoodsUnits</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getFrequentActivities">
		<Method>getFrequentActivities</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getFrequentFoods">
		<Method>getFrequentFoods</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getFriends">
		<Method>getFriends</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getFriendsLeaderboard">
		<Method>getFriendsLeaderboard</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getHeartByDateIntraday">
		<Method>getHeartByDateIntraday</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getHeartByDatePeriod">
		<Method>getHeartByDatePeriod</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getHeartByDateRange">
		<Method>getHeartByDateRange</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getHeartByDateRangeIntraday">
		<Method>getHeartByDateRangeIntraday</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getHeartByDateRangeTimestampIntraday">
		<Method>getHeartByDateRangeTimestampIntraday</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getHeartByDateTimestampIntraday">
		<Method>getHeartByDateTimestampIntraday</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getHrvIntradayByDate">
		<Method>getHrvIntradayByDate</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getHrvIntradayByInterval">
		<Method>getHrvIntradayByInterval</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getHrvSummaryDate">
		<Method>getHrvSummaryDate</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getHrvSummaryInterval">
		<Method>getHrvSummaryInterval</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getMeals">
		<Method>getMeals</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getProfile">
		<Method>getProfile</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getRecentActivities">
		<Method>getRecentActivities</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getRecentFoods">
		<Method>getRecentFoods</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getSleepByDate">
		<Method>getSleepByDate</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getSleepByDateRange">
		<Method>getSleepByDateRange</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getSleepGoal">
		<Method>getSleepGoal</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getSleepList">
		<Method>getSleepList</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getSpO2IntradayByDate">
		<Method>getSpO2IntradayByDate</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getSpO2IntradayByInterval">
		<Method>getSpO2IntradayByInterval</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getSpO2SummaryByDate">
		<Method>getSpO2SummaryByDate</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getSpO2SummaryByInterval">
		<Method>getSpO2SummaryByInterval</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getSubscriptionsList">
		<Method>getSubscriptionsList</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getTempCoreSummaryByDate">
		<Method>getTempCoreSummaryByDate</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getTempCoreSummaryByInterval">
		<Method>getTempCoreSummaryByInterval</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getTempSkinSummaryByInterval">
		<Method>getTempSkinSummaryByInterval</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getTempSkinSummaryDate">
		<Method>getTempSkinSummaryDate</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getVo2MaxSummaryByDate">
		<Method>getVo2MaxSummaryByDate</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getVo2MaxSummaryByInterval">
		<Method>getVo2MaxSummaryByInterval</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getWaterByDate">
		<Method>getWaterByDate</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getWaterGoal">
		<Method>getWaterGoal</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getWeightByDate">
		<Method>getWeightByDate</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getWeightByDatePeriod">
		<Method>getWeightByDatePeriod</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.getWeightByDateRange">
		<Method>getWeightByDateRange</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.introspect">
		<Method>introspect</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.oauthToken">
		<Method>oauthToken</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.revoke">
		<Method>revoke</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.updateAlarms">
		<Method>updateAlarms</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.updateMeal">
		<Method>updateMeal</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.updateProfile">
		<Method>updateProfile</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.updateSleepGoal">
		<Method>updateSleepGoal</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.updateWaterLog">
		<Method>updateWaterLog</Method>
	</MapItem>
	<MapItem MessageType="Fitbit.Api.Client.requests.updateWeightGoal">
		<Method>updateWeightGoal</Method>
	</MapItem>
</MapItems>
}

}
