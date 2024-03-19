Class Fitbit.Api.Client.responses.getWeightByDateRange Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

Property WeightList As Fitbit.Api.Client.model.WeightList;

/// Implement operationId : getWeightByDateRange
/// get /1/user/-/body/log/weight/date/{base-date}/{end-date}.json
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
<Data name="getWeightByDateRangeDefaultData">
<Subscript>"getWeightByDateRange"</Subscript>
<Value name="1">
<Value>WeightList</Value>
</Value>
</Data>
<DefaultData>getWeightByDateRangeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
