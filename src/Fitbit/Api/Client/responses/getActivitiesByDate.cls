/// GetActivities response
Class Fitbit.Api.Client.responses.getActivitiesByDate Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

XData sample [ MimeType = application/json ]
{
{
	"activities": [
		{
			"activityId": 90013,
			"activityParentId": 90013,
			"activityParentName": "Walk",
			"calories": 559,
			"description": "Walking less than 2 mph, strolling very slowly",
			"distance": 4.44238,
			"duration": 4479000,
			"hasActiveZoneMinutes": true,
			"hasStartTime": true,
			"isFavorite": false,
			"lastModified": "2024-03-08T15:45:47.000Z",
			"logId": 61975582448,
			"name": "Walk",
			"startDate": "2024-03-08",
			"startTime": "15:16",
			"steps": 5616
		}
	],
	"goals": {
		"activeMinutes": 30,
		"caloriesOut": 3069,
		"distance": 8.05,
		"floors": 10,
		"steps": 10000
	},
	"summary": {
		"activeScore": -1,
		"activityCalories": 2040,
		"caloriesBMR": 1944,
		"caloriesOut": 3592,
		"distances": [
			{
				"activity": "Walk",
				"distance": 4.44238
			},
			{
				"activity": "total",
				"distance": 10.02
			},
			{
				"activity": "tracker",
				"distance": 10.02
			},
			{
				"activity": "loggedActivities",
				"distance": 4.44238
			},
			{
				"activity": "veryActive",
				"distance": 4.61
			},
			{
				"activity": "moderatelyActive",
				"distance": 0.44
			},
			{
				"activity": "lightlyActive",
				"distance": 4.97
			},
			{
				"activity": "sedentaryActive",
				"distance": 0
			}
		],
		"elevation": 0,
		"fairlyActiveMinutes": 29,
		"floors": 0,
		"heartRateZones": [
			{
				"caloriesOut": 1921.455,
				"max": 99,
				"min": 30,
				"minutes": 1108,
				"name": "Out of Range"
			},
			{
				"caloriesOut": 1421.955,
				"max": 119,
				"min": 99,
				"minutes": 292,
				"name": "Fat Burn"
			},
			{
				"caloriesOut": 146.34,
				"max": 144,
				"min": 119,
				"minutes": 18,
				"name": "Cardio"
			},
			{
				"caloriesOut": 85.59,
				"max": 220,
				"min": 144,
				"minutes": 9,
				"name": "Peak"
			}
		],
		"lightlyActiveMinutes": 287,
		"marginalCalories": 1220,
		"restingHeartRate": 59,
		"sedentaryMinutes": 582,
		"steps": 12403,
		"veryActiveMinutes": 59
	}
}
}

Property Activities As Fitbit.Api.Client.model.Activities;

/// Implement operationId : getActivitiesByDate
/// get /1/user/-/activities/date/{date}.json
Method LoadFromResponse(httpResponse As %Net.HttpResponse, caller As %String = "") As %Status
{
	set sc = $$$OK
	do ##super(httpResponse, caller)

	if $$$LOWER($Piece(httpResponse.ContentType,";",1)) = "application/json", httpResponse.StatusCode = "200"
	{
		set ..Activities = ##class(Fitbit.Api.Client.model.Activities).%New()
		set ..status = ..Activities.%JSONImport(httpResponse.Data)

		return sc
	}

	return sc
}

Storage Default
{
<Data name="getActivitiesByDateDefaultData">
<Subscript>"getActivitiesByDate"</Subscript>
<Value name="1">
<Value>Activities</Value>
</Value>
</Data>
<DefaultData>getActivitiesByDateDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
