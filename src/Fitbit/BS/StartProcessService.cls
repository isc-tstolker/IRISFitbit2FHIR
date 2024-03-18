/// Api Service - handles API requests and routes it to the proper target process
Class Fitbit.BS.StartProcessService Extends Ens.BusinessService
{

/// Service name
Parameter ServiceName = "StartProcessService";

Parameter SETTINGS = "AddOrUpdateUser:Basic,HandleNotification:Basic";

/// AddOrUpdateUser is called from the Fitbit.OAuth2Redirect CSp page
Property AddOrUpdateUser As Ens.DataType.ConfigName [ InitialExpression = "AddOrUpdateUser" ];

/// HandleNotification is called by the REST API for notifications received from Fitbit
Property HandleNotification As Ens.DataType.ConfigName [ InitialExpression = "HandleNotification" ];

/// This method is called from NUTSPKG.API.v1.impl
Method OnProcessInput(pInput As Fitbit.Api.Client.requests.GenericRequest, Output pOutput As Ens.Response) As %Status
{
	set tSC = $$$OK

	try
	{
		if $CLASSNAME(pInput) = "Fitbit.Msg.NotificationRequest"
		{
			set target = ..HandleNotification
		}
		elseif $CLASSNAME(pInput) = "Fitbit.Api.Client.requests.GenericRequest"
		{
			set target = ..AddOrUpdateUser
		}
		else
		{
			$$$ThrowOnError($SYSTEM.Status.Error($$$GeneralError, "Unexpected input class " _ $CLASSNAME(pInput)))
		}

		if (pInput.Async)
		{
			set tSC = ..SendRequestAsync(target, pInput, "Send async request to " _ target)
		}
		else
		{
			set tSC = ..SendRequestSync(target, pInput, .pOutput, , "Send sync request to " _ target)
		}
	}
	catch ex 
	{
		set tSC = ex.AsStatus()
	}

	return tSC
}

/// Start the AddOrUpdateUser process
ClassMethod StartAddOrUpdateUserProcess(userId As %String = "") As %Status
{
	set sc = $$$OK
    try
	{
		#dim tService as Fitbit.BS.StartProcessService

		$$$ThrowOnError(##class(Ens.Director).CreateBusinessService(..#ServiceName, .tService))

		set request = ##class(Fitbit.Api.Client.requests.GenericRequest).%New()
		set request.UserId = userId
		set request.Async = 1

		set sc = tService.ProcessInput(request, .response)
	}
	catch (ex)
	{
	    set sc = ex.AsStatus()
	}

    return sc
}

}
