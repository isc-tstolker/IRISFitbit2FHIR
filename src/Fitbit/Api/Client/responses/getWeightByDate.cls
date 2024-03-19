Class Fitbit.Api.Client.responses.getWeightByDate Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

XData sample [ MimeType = application/json ]
{
{
	"weight": [
		{
			"bmi": 25.87,
			"date": "2024-03-18",
			"fat": 22.496999740600587,
			"logId": 1710747275000,
			"source": "Aria",
			"time": "07:34:35",
			"weight": 100.4
		},
		{
			"bmi": 26.39,
			"date": "2024-03-18",
			"logId": 1710777672000,
			"source": "Aria",
			"time": "16:01:12",
			"weight": 102.4
		}
	]
}
}

Property WeightList As Fitbit.Api.Client.model.WeightList;

/// Implement operationId : getWeightByDate
/// get /1/user/-/body/log/weight/date/{date}.json
Method LoadFromResponse(httpResponse As %Net.HttpResponse, caller As %String = "") As %Status
{
	set sc = $$$OK
	do ##super(httpResponse, caller)

	if $$$LOWER($Piece(httpResponse.ContentType,";",1))="application/json",httpResponse.StatusCode = "200"
	{
		set ..WeightList = ##class(Fitbit.Api.Client.model.WeightList).%New()
		set ..status = ..WeightList.%JSONImport(httpResponse.Data)

		return sc
	}

	return sc
}

Storage Default
{
<Data name="getWeightByDateDefaultData">
<Subscript>"getWeightByDate"</Subscript>
<Value name="1">
<Value>WeightList</Value>
</Value>
</Data>
<DefaultData>getWeightByDateDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
