/// Create Fitbit Namespace
Class Install.Install
{

Parameter Namespace As String = "FITBIT";

/// Create NUTS namespace
ClassMethod CreateNameSpace(namespace As %String = {..#Namespace})
{
    set vars("Namespace") = namespace
    set vars("CLASSNAME") = $CLASSNAME()
	set sc = ..setup(.vars)

	if $$$ISERR(sc)
	{
		do $System.Status.DisplayError(sc)
	}
}

/// Manifest Definition.
XData Manifest [ XMLNamespace = INSTALLER ]
{
<Manifest>
	<Log Text="Set variables" Level="0"/>
	<Default Name="SourceDir" Value="/tmp"/>

	<Log Text="Changing system configuration" Level="0"/>
	<SystemSetting Name="Config.config.routines" Value="50" />
	<SystemSetting Name="Config.config.globals8kb" Value="2000" />
	<SystemSetting Name="Config.Startup.SystemMode" Value="DEVELOPMENT" />

	<Log Text="check if namespace ${Namespace} exists, if not create it" Level="0"/>
	<If Condition='(##class(Config.Namespaces).Exists("${Namespace}")=0)'>
		<Log Text="Creating Iris namespace ${Namespace}" Level="0"/>
		<Namespace Name="${Namespace}" Create="yes" Code="${Namespace}" Data="${Namespace}" Ensemble="1">
			<Configuration>
				<Database Name="${Namespace}" Dir="${MGRDIR}${Namespace}" Create="yes" Resource="%DB_${Namespace}"/>
				<ClassMapping Package="HS" From="HSLIB"/>
				<ClassMapping Package="HSMOD" From="HSLIB"/>
			</Configuration>
			<Invoke Class="%ZHSLIB.HealthShareMgr" Method="EnableHealthShareNamespace" CheckStatus="true" >
				<Arg Value="${Namespace}"/>
				<Arg Value="0"/>
				<Arg Value="1"/>
				<Arg Value="1"/>
			</Invoke>
		</Namespace>
	</If>
</Manifest>
}

/// Called as After Activate step from samples-customizing-your-fhir-repo
ClassMethod SetupFHIRServer(namespace As %String = {..#Namespace}) As %Status
{
	write "Started SetupFHIRServer:",!
    new $namespace
    set $namespace = namespace

    set appKey = "/fitbitfhir"

    // Install elements that are required for a FHIR-enabled namespace
    do ##class(HS.FHIRServer.Installer).InstallNamespace()

    // Install an instance of a FHIR Service into the current namespace
    if '##class(HS.FHIRServer.ServiceAdmin).EndpointExists(appKey)
    {
		write "Endpoint " _ appKey _ " does not exxist",!
		set packageList = $ListBuild("hl7.fhir.r4.core@4.0.1")
		do ##class(HS.FHIRServer.Installer).InstallInstance(appKey, "MyFHIRServer.Storage.Json.InteractionsStrategy", packageList)

		// Enable logging (see https://docs.intersystems.com/irisforhealthlatest/csp/docbook/DocBook.UI.Page.cls?KEY=HXFHIR_server_debugMaintain)
		set ^FSLogChannel("all") = 1
		set ^HS.FHIRServer("dev") = 1 // Enable viewer
    }

    set strategy = ##class(HS.FHIRServer.API.InteractionsStrategy).GetStrategyForEndpoint(appKey)
    set config = strategy.GetServiceConfigData()
    set config.DebugMode = 4
    do strategy.SaveServiceConfigData(config)

	/// Make sure that the Dispatch class is changed to allow for application/json
	new $NAMESPACE
	set $NAMESPACE = "%sys"
	set props("DispatchClass") = "MyFHIRServer.RestHandler"
	return ##class(Security.Applications).Modify(appKey, .props)
}

/// This is a method generator whose code is generated by XGL.
ClassMethod setup(ByRef pVars, pLogLevel As %Integer = 3, pInstaller As %Installer.Installer, pLogger As %Installer.AbstractLogger) As %Status [ CodeMode = objectgenerator, Internal ]
{
 #; Let our XGL document generate code for this method.
 return ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "Manifest")
}

}
