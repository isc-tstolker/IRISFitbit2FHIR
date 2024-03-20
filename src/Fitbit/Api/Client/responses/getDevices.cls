/// Get Devices response
Class Fitbit.Api.Client.responses.getDevices Extends Fitbit.Api.Client.responses.GenericResponse [ ProcedureBlock ]
{

XData sampleResponse [ MimeType = application/json ]
{
[
	{
		"battery": "Empty",
		"batteryLevel": 0,
		"deviceVersion": "MobileTrack",
		"features": [],
		"id": "2430439086",
		"lastSyncTime": "2024-03-19T16:15:09.000",
		"type": "TRACKER"
	},
	{
		"battery": "Low",
		"batteryLevel": 17,
		"deviceVersion": "Charge 6",
		"features": [],
		"id": "2491773984",
		"lastSyncTime": "2024-03-19T16:59:48.000",
		"mac": "DDF861780DCB",
		"type": "TRACKER"
	},
	{
		"battery": "High",
		"batteryLevel": 90,
		"deviceVersion": "Aria 2",
		"features": [],
		"id": "FX177283C8F844",
		"lastSyncTime": "2024-03-18T22:55:04.000",
		"type": "SCALE"
	}
]
}

Property Devices As list Of Fitbit.Api.Client.model.Device;

/// Implement operationId : getDevices
/// get /1/user/-/devices.json
Method LoadFromResponse(httpResponse As %Net.HttpResponse, caller As %String = "") As %Status
{
	set sc = $$$OK
	do ##super(httpResponse, caller)

	if $$$LOWER($Piece(httpResponse.ContentType,";",1))="application/json",httpResponse.StatusCode = "200"
	{
		set devices = ##class(%DynamicArray).%FromJSON(httpResponse.Data)

		for index = 1:1:devices.%Size()
		{
			set device = ##class(Fitbit.Api.Client.model.Device).%New()
			set sc = device.%JSONImport(devices.%Get(index - 1))

			do ..Devices.Insert(device)
		}

		return sc
	}

	return sc
}

Storage Default
{
<Data name="getDevicesDefaultData">
<Subscript>"getDevices"</Subscript>
<Value name="1">
<Value>Devices</Value>
</Value>
</Data>
<DefaultData>getDevicesDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
