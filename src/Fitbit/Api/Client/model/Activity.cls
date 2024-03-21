/// Activity
Class Fitbit.Api.Client.model.Activity Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor) [ Inheritance = left, ProcedureBlock ]
{

/// Ignore invalid fields
Parameter %JSONIGNOREINVALIDFIELD = 1;

/// "activityId": 90013,
Property ActivityId As %Integer(%JSONFIELDNAME = "activityId");

/// "activityParentId": 90013,
Property ActivityParentId As %Integer(%JSONFIELDNAME = "activityParentId");

/// "activityParentName": "Walk",
Property ActivityParentName As %String(%JSONFIELDNAME = "activityParentName");

/// "calories": 559,
Property Calories As %Integer(%JSONFIELDNAME = "calories");

/// "description": "Walking less than 2 mph, strolling very slowly",
Property Description As %String(%JSONFIELDNAME = "description", MAXLEN = "");

/// "distance": 4.44238,
Property Distance As %Numeric(%JSONFIELDNAME = "distance");

/// "duration": 4479000,
Property Duration As %Integer(%JSONFIELDNAME = "duration");

/// "hasActiveZoneMinutes": true,
Property HasActiveZoneMinutes As %Boolean(%JSONFIELDNAME = "hasActiveZoneMinutes");

/// "hasStartTime": true,
Property HasStartTime As %Boolean(%JSONFIELDNAME = "hasStartTime");

/// "isFavorite": false,
Property IsFavorite As %Boolean(%JSONFIELDNAME = "isFavorite");

/// "lastModified": "2024-03-08T15:45:47.000Z",
Property LastModified As %String(%JSONFIELDNAME = "lastModified");

/// "logId": 61975582448,
Property LogId As %Integer(%JSONFIELDNAME = "logId");

/// "name": "Walk",
Property Name As %String(%JSONFIELDNAME = "name");

/// "startDate": "2024-03-08",
Property StartDate As %String(%JSONFIELDNAME = "startDate");

/// "startTime": "15:16",
Property StartTime As %String(%JSONFIELDNAME = "startTime");

/// "steps": 5616
Property Steps As %Integer(%JSONFIELDNAME = "steps");

Storage Default
{
<Data name="ActivityState">
<Value name="1">
<Value>ActivityId</Value>
</Value>
<Value name="2">
<Value>ActivityParentId</Value>
</Value>
<Value name="3">
<Value>ActivityParentName</Value>
</Value>
<Value name="4">
<Value>Calories</Value>
</Value>
<Value name="5">
<Value>Description</Value>
</Value>
<Value name="6">
<Value>Distance</Value>
</Value>
<Value name="7">
<Value>Duration</Value>
</Value>
<Value name="8">
<Value>HasActiveZoneMinutes</Value>
</Value>
<Value name="9">
<Value>HasStartTime</Value>
</Value>
<Value name="10">
<Value>IsFavorite</Value>
</Value>
<Value name="11">
<Value>LastModified</Value>
</Value>
<Value name="12">
<Value>LogId</Value>
</Value>
<Value name="13">
<Value>Name</Value>
</Value>
<Value name="14">
<Value>StartDate</Value>
</Value>
<Value name="15">
<Value>StartTime</Value>
</Value>
<Value name="16">
<Value>Steps</Value>
</Value>
</Data>
<State>ActivityState</State>
<StreamLocation>^Fitbit.Api.Client2A66.ActivityS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
