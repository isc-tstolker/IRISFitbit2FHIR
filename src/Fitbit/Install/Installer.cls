Include Ensemble

/// Setup stuff after namespace creation
Class Fitbit.Install.Installer
{

Parameter Namespace As String = "FITBIT";

Parameter ProductionName As String = "Fitbit.FoundationProduction";

/// Install necessary parts for Nuts Connector
ClassMethod Setup() As %Status
{
	set sc = ..CreateWebApplication("/fitbit", , "Fitbit.Api.v1.disp")

	// Ens.Config.DefaultSettings must have been loaded by ZPM
	do ..AutoStartProduction()

    return sc
}

// Making a production Auto-Start

ClassMethod AutoStartProduction() As %Status
{
	New $NAMESPACE
	set $NAMESPACE = ..#Namespace

	// Only start production of not already running
	if '##class(Ens.Director).IsProductionRunning()
	{
		set sc = ##class(Ens.Director).StartProduction(..#ProductionName)

		if $$$ISERR(sc)
		{
			do $System.Status.DisplayError(sc)
		}
	}

	set sc = ##class(Ens.Director).SetAutoStart(..#ProductionName)

	if $$$ISERR(sc)
	{
		Do $System.Status.DisplayError(sc)
	}

	return $$$OK
}

/// Create web application
ClassMethod CreateWebApplication(url As %String, namespace As %String = {$NAMESPACE}, dispatch As %String) As %Status
{
	#dim sc As %Status = $$$OK
	try
	{
		New $namespace
		set $namespace = "%SYS"

		set properties("AutheEnabled") = $$$AutheUnauthenticated
		set properties("NameSpace") = namespace
		set properties("IsNameSpaceDefault") = $$$NO
		set properties("DispatchClass") = dispatch
		set properties("MatchRoles") = ":" _ $$$AllRoleName
		// /csp/healthshare/registerservice

		if '##class(Security.Applications).Exists(url)
		{
			write "Creating webapplication ",url,":",!

			set sc = ##class(Security.Applications).Create(url, .properties)
		}
		else
		{
			write "Updating webapplication ",url,":",!

			set sc = ##class(Security.Applications).Modify(url, .properties)
		}
	}
	catch ex
	{
		set sc = ex.AsStatus()
	}

	return sc
}

}
