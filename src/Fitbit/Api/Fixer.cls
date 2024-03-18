Include Ensemble

/// Fixer for code generated based on OpenAPI specification
Class Fitbit.Api.Fixer Extends %Projection.AbstractProjection
{

/// Projection that applies some fixes to the spec-generated
/// classes (.disp and .impl):
/// - Remove timestamp from implementation description
/// - Fix calls directly to %REST.Impl in dispatch methods
ClassMethod CreateProjection(className As %String, ByRef parameters As %String, modified As %String, qstruct) As %Status
{
	set dispName = $$$ClassPackageName(className)_".disp"
	set implName = $$$ClassPackageName(className)_".impl"
	
	set sc = ..ChangeClassesinDispatcherClass(dispName, implName)

	if ($$$ISERR(sc))
	{
		return sc
	}

	return ..RemoveUpdatedFromImplementattionClass(implName)
}

ClassMethod ChangeClassesinDispatcherClass(dispName As %String, implName As %String) As %Status
{
	set classDef = ##class(%Dictionary.ClassDefinition).%OpenId(dispName, , .sc)

	if $$$ISERR(sc)
	{
		return ..BuildStatus(sc, "Error opening dispatcher class {}:", dispName)
	}
	
	set key = ""

	for
	{
		#dim methodDef As %Dictionary.MethodDefinition = classDef.Methods.GetNext(.key)

		if key = ""
		{
			quit // Finish loop
		}
		
		set code = $Replace(methodDef.Implementation.Read(), "##class(%REST.Impl).", "##class("_ implName _").")
		Set sc = methodDef.Implementation.Clear()

		if $$$ISERR(sc)
		{
			return ..BuildStatus(sc, "Error clearing current implementation of {}:", methodDef.Name)
		}

		set sc = methodDef.Implementation.Write(code)

		if $$$ISERR(sc)
		{
			return ..BuildStatus(sc, "Error updating current implementation of {}:", methodDef.Name)
		}
	}
	
	set sc = classDef.%Save()

	if $$$ISERR(sc)
	{
		return ..BuildStatus(sc, "Error saving updated dispatch class {}:", dispName)
	}
	
	do ..QueueClass(dispName)

	return $$$OK
}

/// - Remove the "Updated ..." line from the implementation class; it needlessly messes with source control.
ClassMethod RemoveUpdatedFromImplementattionClass(implName As %String) As %Status
{
	set classDef = ##class(%Dictionary.ClassDefinition).%OpenId(implName, , .sc)

	if $$$ISERR(sc)
	{
		return ..BuildStatus(sc, "Error opening implementation class {}:", implName)
	}

	set classDef.Super = "Fitbit.Api.RestHelper"

	if $Piece(classDef.Description, $$$EOL, *) ? 1"Updated "1.E
	{
		set classDef.Description = $Piece(classDef.Description, $$$EOL, 1, *-1)
	}

	set sc = classDef.%Save()

	if $$$ISERR(sc)
	{
		return ..BuildStatus(sc, "Error saving updated implementation class {}:", implName)
	}
	
	do ..QueueClass(implName)


	return $$$OK
}

/// Builds a %sc from the combined input. message is converted to a GeneralError %sc;
/// if sc is passed-in, it is appended to it.
/// Intended usage is to prefix extra information to an error status returned from a system call.
/// Argument placeholders {} are replaced with arguments passed after message
ClassMethod BuildStatus(sc As %Status = "", message As %String, args... As %String) As %Status
{
	if (sc = "") || $$$ISOK(sc)
	{
		return $$$OK
	}

	;Replace placeholders with content, if present
	if $Get(args)
    {
        set message = ..BuildMessage(message, args...)
    }
	
	;Convert message to %sc
	set msgStatus = $System.Status.Error($$$GeneralError, message)
	
	;Append status from parameter, if specified
	if sc '= ""
    {
         Set msgStatus = $System.Status.AppendStatus(msgStatus, sc)
    }
	
	return msgStatus
}

/// Builds a message from the message string and replacement parameters.
/// Intended usage is through the BuildMsg method.
ClassMethod BuildMessage(message As %String, args... As %String) As %String
{
	set index = 0

	for Count = 1:1
    {
		Set index = $Find(message, "{}", index)

		If index = 0
        {
            quit
        }
		
		Set value = $Get(args(Count))
		Set $Extract(message, index-2, index-1) = value
		Set index = index + $Length(value) - 2
	}
	
	return message
}

}
