Include Ensemble

/// Business logic class defined by OpenAPI in Fitbit.Api.v1.spec<br/>
Class Fitbit.Api.v1.impl Extends Fitbit.Api.RestHelper [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 0;

/// Get Swagger spec of this API
ClassMethod OpenAPI() As %DynamicObject
{
	#dim %request As %CSP.Request

	set specification = {}.%FromJSON(##class(%Dictionary.XDataDefinition).%OpenId(..%PackageName()_".spec||OpenAPI").Data)
	
	; Dynamically place host in response
	set specification.host = %request.GetCgiEnv("HTTP_HOST")
	
	; If called without https, change the scheme
	if '%request.Secure
    {
        Set specification.schemes = ["http"]
    }
	
	return specification
}

/// Verify Notification Endpoint<br/>
/// The method arguments hold values for:<br/>
///     verify<br/>
ClassMethod VerifyCode(verify As %String) As %String
{
    set verificationCode = $GET(verify)

    if verificationCode = ""
    {
	    do ..%SetStatusCode(..#HTTP200OK)
        return "Hello, nice to hear from you!"
    }

    set expected = ##class(Fitbit.Api.Client.bo.Operation).GetConfigValue("VerificationCode", 0)

    if verificationCode '= expected
    {
        do ..%SetStatusCode(..#HTTP404NOTFOUND)
        return "Invalid verificationCode '" _ verificationCode _ "' received, expected '" _ expected _ "'"
    }

    do ..%SetStatusCode(..#HTTP204NOCONTENT)
    return ""
}

/// Handle Notifications<br/>
/// The method arguments hold values for:<br/>
///     notifications, List of Notifications<br/>
ClassMethod HandleNotifications(notifications As %DynamicArray) As %String
{
    do ..%SetStatusCode(..#HTTP204NOCONTENT)

    #dim tService as Fitbit.BS.StartProcessService

    set sc = ##class(Ens.Director).CreateBusinessService(##class(Fitbit.BS.StartProcessService).#ServiceName, .tService)

    if $$$ISERR(sc)
    {
        $$$LOGERROR("CreateBusinessService: " _ $SYSTEM.Status.GetErrorText(sc))
        return ""
    }

    for index = 1:1:notifications.%Size()
    {
        set notification = notifications.%Get(index - 1)

        #dim request as Fitbit.Msg.NotificationRequest = ##class(Fitbit.Msg.NotificationRequest).%New()
        set request.Async = 1

        set sc = request.%JSONImport(notification)

        if $$$ISERR(sc)
        {
            $$$LOGERROR("JSONImport(" _ notification.%ToJSON() _ "): " _ $SYSTEM.Status.GetErrorText(sc))
            continue
        }

        do tService.ProcessInput(request)
    }

    return ""
}

}
