Include HS.FHIRServer

/// Base process used as superclass for processes that want top handle FHIR
Class Fitbit.BP.FHIRBase Extends (Ens.BusinessProcess, Fitbit.Util.FHIRClientHelper)
{

Parameter PatientIdentifierSystem = "https://www.fitbit.com/identifiers/user-id";

Parameter DeviceIdentifierSystem = "https://www.fitbit.com/identifiers/DeviceId";

Parameter ObservationIdentifierSystem = "https://www.fitbit.com/identifiers/logId";

Parameter Steps = "41950-7|Number of steps in 24 Hours, Measured|/d";

Parameter Heartrateresting = "40443-4|Heart rate - resting|/min";

Parameter Calories = "41979-6|Calories burned in 24 Hours, Calc|kcal/d";

Parameter SessionApplication As STRING = "/fitbitfhir";

/// Where to send the FHIR requests
Property FHIRInterop As Ens.DataType.ConfigName [ InitialExpression = "FHIRInterop" ];

/// Get single FHIR resource
Method GetSingleFHIRResource(resourceType As %String, query As %String, ByRef vars As %String) As %DynamicObject
{
	set bundle = ..FHIRSearch(resourceType, query, .vars)

	return ..FindResourceInBundle(bundle, resourceType)
}

/// Execute a FHIR Search and return the Bundle
Method FHIRSearch(resourceType As %String, query As %String, ByRef vars As %String) As %DynamicObject
{
	#dim request as HS.FHIRServer.Interop.Request = ##class(HS.FHIRServer.Interop.Request).%New()
	set queryString = ..PrepareQuery(resourceType, query, .vars, .requestPath)
    set request.Request.SessionApplication = ..#SessionApplication
    set request.Request.RequestMethod = "GET" 
    set request.Request.RequestPath = requestPath
    set request.Request.QueryString = queryString
    set request.Request.ResponseFormatCode = $$$FHIRContentCodeJSON
    
    return ..SendFHIRRequest(request)
}

/// Update FHIR resource
Method UpdateFHIRResource(resource As %DynamicObject, key As %String)
{
	if (..SendFHIRResource("PUT", resource, key) = "")
	{
		$$$ThrowOnError($$$ERROR($$$GeneralError, "Failed to save key in the FHIR Store"))
	}
}

/// Send a FHIR resource to the target system
Method SendFHIRResource(method As %String, resource As %DynamicObject, requestPath As %String, queryString As %String = "") As %DynamicObject
{
	#dim request as HS.FHIRServer.Interop.Request = ##class(HS.FHIRServer.Interop.Request).%New()
    set request.Request.SessionApplication = ..#SessionApplication
    set request.Request.RequestMethod = method
    set request.Request.RequestPath = requestPath
    set request.Request.QueryString = queryString
    set request.Request.RequestFormatCode = $$$FHIRContentCodeJSON
    set request.Request.ResponseFormatCode = $$$FHIRContentCodeJSON
    set request.QuickStreamId = ##class(Fitbit.Util.QuickStreamHelper).CreateQuickStream(resource)
    
    return ..SendFHIRRequest(request)
}

/// POST or PUT a FHIR Interop Request to the designated Hospital Connector
/// Send a FHIR Interop Request to the designated Hospital Connector
Method SendFHIRRequest(pRequest As HS.FHIRServer.Interop.Request) As %DynamicObject
{
    $$$ThrowOnError(..SendRequestSync(..FHIRInterop, pRequest, .response))

    #dim response as HS.FHIRServer.Interop.Response

	#dim reply as %DynamicObject = ##class(Fitbit.Util.QuickStreamHelper).ReadQuickstream(response.QuickStreamId)

    if '##class(Fitbit.Api.HTTPStatusHelper).HTTPStatusIsOK(response.Response.Status)
    {
        $$$LOGERROR("Status=" _ response.Response.Status _ "; json='" _ reply.%ToJSON() _ "'" )
		return ""
    }

    return reply
}

/// Save Device
Method SaveDevice(userId As %String, timezone As %String, fitbitDevice As Fitbit.Api.Client.model.Device)
{
    set id = userId _ "." _ fitbitDevice.DeviceId

	set device = {
		"resourceType": "Device",
		"id": (id),
		"identifier": [
			{
				"system": (..#DeviceIdentifierSystem),
				"value": (id)
			}
		],
		"status": "active",
        "serialNumber": (fitbitDevice.DeviceId),
        "deviceName": [
            {
                "name": (fitbitDevice.Name),
                "type": "model-name"
            }
        ],
        "type": {
            "text": (fitbitDevice.Type)
        },
        "property": [
            {
                "type": {
                    "text": "BatteryLevel"
                },
                "valueQuantity": [
                    {
                        "value": (fitbitDevice.BatteryPercentage),
                        "unit": "%",
                        "system" : "http://unitsofmeasure.org",
                        "code" : "%"
                    }
                ],
                "valueCode": [
                    {
                        "text": (fitbitDevice.BatteryLevel)
                    }
                ]
            }
        ],
        "patient": {
            "reference": ("Patient/" _ userId)
        },
        "note": [
            {
                "time": (..FormatDateTime(fitbitDevice.LastSyncTime, timezone)),
                "text": ("Last synced at " _ $REPLACE($EXTRACT(fitbitDevice.LastSyncTime, 1, 19), "T", " "))
            }
        ]
	}

    do ..UpdateFHIRResource(device, "Device/" _ id)
}

/// Store the Height kept in the users profile as a Height Observation and todays date
Method CreateOrUpdateHeightObservation(userId As %String, timezone As %String, height As %Numeric)
{
    set id = userId _ ".height"
	set observation = {
		"resourceType": "Observation",
		"id": (id),
		"identifier": [
			{
				"system": (..#ObservationIdentifierSystem),
				"value": (id)
			}
		],
		"status": "final",
		"category": [
            {
                "coding": [
                    {
                        "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                        "code": "vital-signs"
                    }
                ]
            }
		],
		"code": {
            "coding": [
                {
                    "system": "http://loinc.org",
                    "code": "3137-7",
                    "display": "Body height Measured"
                }
            ]
        },
        "subject": {
            "reference": ("Patient/" _ userId)
        },
        "effectiveDateTime": (..FormatDateTime($ZDATETIME((+$HOROLOG) _ ",0",3, 5), timezone)),
        "performer": [
            {
                "reference": ("Patient/" _ userId)
            }
        ],
        "valueQuantity": {
            "value": (height),
            "unit": "cm",
            "system" : "http://unitsofmeasure.org",
            "code" : "cm"
        }
	}

    do ..UpdateFHIRResource(observation, "Observation/" _ id)
}

/// Save Activity Time-Based Measure Observations for the specified day
Method SaveActivityObservations(userId As %String, timezone As %String, date As %String, activities As Fitbit.Api.Client.model.Activities)
{
    set today = $ZDATE($HOROLOG, 3)
    set start = ..FormatDateTime(date _ "T00:00:00", timezone)

    if (date = today)
    {
        set end = ..FormatDateTime($ZDATETIME($HOROLOG, 3, 5), timezone)
        set status = "preliminary"
    }
    else
    {
        set end = ..FormatDateTime(date _ "T23:59:59", timezone)
        set status = "final"
    }

    do SaveActivityObservation(userId, "steps", start, end, activities.Summary.Steps, status)
    do SaveActivityObservation(userId, "calories", start, end, activities.Summary.CaloriesOut, status)

    if activities.Summary.RestingHeartRate '= ""
    {
        do SaveActivityObservation(userId, "heartrateresting", start, end, activities.Summary.RestingHeartRate, status)
    }
}

/// Save range of observations
Method SaveActivityObservationRange(userId As %String, timezone As %String, valueList As Fitbit.Api.Client.model.ActivityResourceValueList, activity As %String)
{
    for index = 1:1:valueList.Values.Count()
    {
        #dim value as Fitbit.Api.Client.model.ActivityResourceValue = valueList.Values.GetAt(index)

        set start = ..FormatDateTime(value.DateTime _ "T00:00:00", timezone)
        set end = ..FormatDateTime(value.DateTime _ "T23:59:59", timezone)

        do SaveActivityObservation(userId, activity, start, end, +value.Value, "final")
    }
}

/// Helper to save Activity Observation
Method SaveActivityObservation(userId As %String, activity As %String, start As %String, end As %String, value As %Numeric, status As %String)
{
    set id = userId _ "." _ activity _ "." _ $EXTRACT(start, 1, 10)
    set codeDisplayUnit = $PARAMETER(, $ZCONVERT(activity, "w"))
	set observation = {
		"resourceType": "Observation",
		"id": (id),
		"identifier": [
			{
				"system": (..#ObservationIdentifierSystem),
				"value": (id)
			}
		],
		"status": (status),
		"category": [ {
                "coding": [ {
                        "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                        "code": "activity"
                    }
                ]
            }
		],
		"code": {
            "coding": [ {
                    "system": "http://loinc.org",
                    "code": ($PIECE(codeDisplayUnit, "|", 1)),
                    "display": ($PIECE(codeDisplayUnit, "|", 2))
                }
            ]
        },
        "subject": {
            "reference": ("Patient/" _ userId)
        },
        "effectivePeriod": {
            "start": (start),
            "end": (end)
        },
        "performer": [ {
                "reference": ("Patient/" _ userId)
            }
        ],
        "valueQuantity": {
            "value": (value),
            "unit": ($PIECE(codeDisplayUnit, "|", 3)),
            "system" : "http://unitsofmeasure.org",
            "code" : ($PIECE(codeDisplayUnit, "|", 3))
        }
	}

    do ..UpdateFHIRResource(observation, "Observation/" _ id)
}

/// Save Observations for Weight
Method SaveWeightObservations(userId As %String, timezone As %String, weightList As Fitbit.Api.Client.model.WeightList)
{
    for index = 1:1:weightList.Weights.Count()
    {
        do ..SaveWeightObservation(userId, timezone, weightList.Weights.GetAt(index))
    }
}

/// Save single Weight Observation
Method SaveWeightObservation(userId As %String, timezone As %String, weight As Fitbit.Api.Client.model.Weight)
{
    set id = userId _ "." _ weight.LogId

	set observation = {
		"resourceType": "Observation",
		"id": (id),
		"identifier": [
			{
				"system": (..#ObservationIdentifierSystem),
				"value": (id)
			}
		],
		"status": "final",
		"category": [
            {
                "coding": [
                    {
                        "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                        "code": "vital-signs"
                    }
                ]
            }
		],
		"code": {
            "coding": [
                {
                    "system": "http://loinc.org",
                    "code": "43143-7",
                    "display": "Weighing device panel"
                }
            ]
        },
        "subject": {
            "reference": ("Patient/" _ userId)
        },
        "effectiveDateTime": (..FormatDateTime(weight.Date _ "T" _ weight.Time, timezone)),
        "performer": [
            {
                "reference": ("Patient/" _ userId)
            }
        ],
        "device": {
            "display": (weight.Source)
        },
        "component": [
            {
                "code": {
                    "coding": [
                        {
                            "system": "http://loinc.org",
                            "code": "3141-9",
                            "display": "Body weight Measured"
                        }
                    ]
                },
                "valueQuantity": {
                    "value": (weight.Weight),
                    "unit": "kg",
                    "system" : "http://unitsofmeasure.org",
                    "code" : "kg"
                }
            },
            {
                "code": {
                    "coding": [
                        {
                            "system": "http://loinc.org",
                            "code": "39156-5",
                            "display": "Body mass index (BMI) [Ratio]"
                        }
                    ]
                },
                "valueQuantity": {
                    "value": (weight.BMI),
                    "unit": "kg/m2",
                    "system" : "http://unitsofmeasure.org",
                    "code" : "kg/m2"
                }
            }
        ]
	}

    if weight.Fat '= ""
    {
        do observation.component.%Push({
                "code": {
                    "coding": [
                        {
                            "system": "http://loinc.org",
                            "code": "41982-0",
                            "display": "Percentage of body fat Measured"
                        }
                    ]
                },
                "valueQuantity": {
                    "value": (weight.Fat),
                    "unit": "%",
                    "system" : "http://unitsofmeasure.org",
                    "code" : "%"
                }
            })        
    }

    do ..UpdateFHIRResource(observation, "Observation/" _ id)
}

/// Use Python to determine the proper timezone offset
ClassMethod FormatDateTime(fitbitdatetime As %String, timezone As %String = "Europe/Amsterdam") As %String [ Language = python ]
{
    import tzdata
    from zoneinfo import ZoneInfo
    from datetime import datetime

    dt = datetime.fromisoformat(fitbitdatetime).replace(tzinfo=ZoneInfo(timezone))
    return dt.isoformat()
}

Storage Default
{
<Data name="FHIRBaseDefaultData">
<Subscript>"FHIRBase"</Subscript>
<Value name="1">
<Value>FHIRInterop</Value>
</Value>
</Data>
<DefaultData>FHIRBaseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
