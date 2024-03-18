Class Fitbit.Api.Client.requests.addActivitiesLog Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "post";

Parameter URL = "/1/user/-/activities.json";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The ID of the activity, directory activity or intensity level activity.
Property queryactivityId As %Integer;

/// Custom activity name. Either activityId or activityName must be provided.
Property queryactivityName As %String(MAXLEN = "");

/// Log entry date in the format yyyy-MM-dd.
Property querydate As %String(MAXLEN = "");

/// Distance is required for logging directory activity in the format X.XX and in the selected distanceUnit.
Property querydistance As %Integer;

/// Distance measurement unit. Steps units are available only for Walking (activityId=90013) and Running (activityId=90009) directory activities and their intensity levels.
Property querydistanceUnit As %Integer;

/// Duration in milliseconds.
Property querydurationMillis As %Integer;

/// Calories burned that are manaully specified. Required with activityName must be provided.
Property querymanualCalories As %Integer;

/// Activity start time. Hours and minutes in the format HH:mm:ss.
Property querystartTime As %String(MAXLEN = "");

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	If (..queryactivityId '= "") {
		Do httpRequest.SetParam("activityId",..queryactivityId)
	}
	If (..queryactivityName '= "") {
		Do httpRequest.SetParam("activityName",..queryactivityName)
	}
	If (..querymanualCalories '= "") {
		Do httpRequest.SetParam("manualCalories",..querymanualCalories)
	}
	If (..querystartTime '= "") {
		Do httpRequest.SetParam("startTime",..querystartTime)
	}
	If (..querydurationMillis '= "") {
		Do httpRequest.SetParam("durationMillis",..querydurationMillis)
	}
	If (..querydate '= "") {
		Do httpRequest.SetParam("date",..querydate)
	}
	If (..querydistance '= "") {
		Do httpRequest.SetParam("distance",..querydistance)
	}
	If (..querydistanceUnit '= "") {
		Do httpRequest.SetParam("distanceUnit",..querydistanceUnit)
	}
	Quit sc
}

Storage Default
{
<Data name="addActivitiesLogDefaultData">
<Subscript>"addActivitiesLog"</Subscript>
<Value name="1">
<Value>%Consume</Value>
</Value>
<Value name="2">
<Value>%ContentType</Value>
</Value>
<Value name="3">
<Value>%URL</Value>
</Value>
<Value name="4">
<Value>queryactivityId</Value>
</Value>
<Value name="5">
<Value>queryactivityName</Value>
</Value>
<Value name="6">
<Value>querydate</Value>
</Value>
<Value name="7">
<Value>querydistance</Value>
</Value>
<Value name="8">
<Value>querydistanceUnit</Value>
</Value>
<Value name="9">
<Value>querydurationMillis</Value>
</Value>
<Value name="10">
<Value>querymanualCalories</Value>
</Value>
<Value name="11">
<Value>querystartTime</Value>
</Value>
</Data>
<DefaultData>addActivitiesLogDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
