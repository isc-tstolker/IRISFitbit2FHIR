Class Fitbit.Api.Client.responses.getWeightByDatePeriod Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

Property WeightList As Fitbit.Api.Client.model.WeightList;

/// Implement operationId : getWeightByDatePeriod
/// get /1/user/-/body/log/weight/date/{date}/{period}.json
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
<Data name="getWeightByDatePeriodDefaultData">
<Subscript>"getWeightByDatePeriod"</Subscript>
<Value name="1">
<Value>WeightList</Value>
</Value>
</Data>
<DefaultData>getWeightByDatePeriodDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
