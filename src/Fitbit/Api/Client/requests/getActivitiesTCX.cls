Class Fitbit.Api.Client.requests.getActivitiesTCX Extends Fitbit.Api.Client.requests.GenericRequest [ ProcedureBlock ]
{

Parameter METHOD = "get";

Parameter URL = "/1/user/-/activities/{log-id}.tcx";

Property %Consume As %String(MAXLEN = "");

Property %ContentType As %String(MAXLEN = "");

Property %URL As %String(MAXLEN = "") [ InitialExpression = {..#URL} ];

/// The activity's log ID.
Property pathlogid As %String(MAXLEN = "");

/// Include TCX points regardless of GPS data being present
Property queryincludePartialTCX As %Boolean;

/// Load %Net.HttpRequest with this property object.
Method LoadHttpRequestObject(ByRef httpRequest As %Net.HttpRequest) As %Status
{
	Set sc = $$$OK
	Set httpRequest.ContentType = ..%ContentType
	Do httpRequest.SetHeader("accept", ..%Consume)
	Set ..%URL = $Replace(..#URL,"{log-id}", ..pathlogid)
	If (..queryincludePartialTCX '= "") {
		Do httpRequest.SetParam("includePartialTCX",..queryincludePartialTCX)
	}
	Quit sc
}

Storage Default
{
<Data name="getActivitiesTCXDefaultData">
<Subscript>"getActivitiesTCX"</Subscript>
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
<Value>pathlogid</Value>
</Value>
<Value name="5">
<Value>queryincludePartialTCX</Value>
</Value>
</Data>
<DefaultData>getActivitiesTCXDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
