/// Response for getActivitiesResourceByDateRange 
Class Fitbit.Api.Client.responses.getActivitiesResourceByDateRange Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

/// Only one of the resource-types will be present
XData sample [ MimeType = application/json ]
{
{
	"activities-steps": [
		{
			"dateTime": "2024-01-01",
			"value": "13773"
		}
	],
	"activities-calories": [
		{
			"dateTime": "2024-01-01",
			"value": "3931"
		}
	]
}
}

Property ValueList As Fitbit.Api.Client.model.ActivityResourceValueList;

/// Implement operationId : getActivitiesResourceByDateRange
/// get /1/user/-/activities/{resource-path}/date/{base-date}/{end-date}.json
Method LoadFromResponse(httpResponse As %Net.HttpResponse, caller As %String = "") As %Status
{
	set sc = $$$OK
	do ##super(httpResponse, caller)

	if $$$LOWER($Piece(httpResponse.ContentType,";",1)) = "application/json", httpResponse.StatusCode = "200"
	{
		// rename the array-property with a specific name one with a generic name "activities"
		#dim json as %DynamicObject = ##class(%DynamicObject).%FromJSON(httpResponse.Data)
		#dim iterator As %Iterator.Object = json.%GetIterator()
		while iterator.%GetNext(.name, .value, .type)
		{
			$$$TRACE("Found property with name " _ name)
			set activities = json.%Get(name)
			do json.%Remove(name)
			set json.activities = activities
		}
	
		set ..ValueList = ##class(Fitbit.Api.Client.model.ActivityResourceValueList).%New()
		set ..status = ..ValueList.%JSONImport(json)

		return sc
	}

	return sc
}

Storage Default
{
<Data name="getActivitiesResourceByDateRangeDefaultData">
<Subscript>"getActivitiesResourceByDateRange"</Subscript>
<Value name="1">
<Value>ValueList</Value>
</Value>
</Data>
<DefaultData>getActivitiesResourceByDateRangeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
