Include HS.FHIRServer

/// Base process used as superclass for processes that want top handle FHIR
Class Fitbit.BP.FHIRBase Extends (Ens.BusinessProcess, Fitbit.Util.FHIRClientHelper)
{

Parameter PatientIdentifierSystem = "https://www.fitbit.com/identifiers/user-id";

Parameter ObservationIdentifierSystem = "https://www.fitbit.com/identifiers/logId";

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

// Send a FHIR resource to the target system

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

	if (..SendFHIRResource("PUT", observation, "Observation/" _ id) = "")
	{
		$$$ThrowOnError($$$ERROR($$$GeneralError, "Failed to save weight Observation '" _ id _ "' in the FHIR Store"))
	}
}

/// Use Python to determine the proper timezone offset
ClassMethod FormatDateTime(fitbitdatetime As %String, timezone As %String) As %String [ Language = python ]
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
