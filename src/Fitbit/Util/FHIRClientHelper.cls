Include Ensemble

/// Helps construct Interop requests
Class Fitbit.Util.FHIRClientHelper Extends (Fitbit.Util.StringHelpers, Fitbit.Util.FHIRJsonHelper)
{

/// Find the first resource of the specified type in the Bundle
ClassMethod FindResourceInBundle(bundle As %DynamicObject, resourceType As %String) As %DynamicObject
{
	if '$ISOBJECT(bundle)
	{
        $$$TRACE("Not a proper bundle")
        return ""
    }

	if '$ISOBJECT(bundle.entry)
	{
        $$$TRACE("No entries in bundle")
        return ""
    }

    for entryIndex = 1:1:(bundle.entry.%Size())
    {
        set resource = bundle.entry.%Get(entryIndex - 1).resource

        if $ISOBJECT(resource) && (resource.resourceType = resourceType)
        {
            return resource
        }
    }

    $$$TRACE("Found no " _ resourceType _ " in bundle")
    return ""
}

/// Find proper name of Patient
ClassMethod FindFullName(names As %DynamicArray) As %String
{
	if '$ISOBJECT(names)
	{
		return ""
	}

	// First, find maiden
	for nameIndex = 1:1:(names.%Size())
	{
		set name = names.%Get(nameIndex - 1)

		if name.use = "maiden"
		{
			return name
		}
	}

	// Then, find offical
	for nameIndex = 1:1:(names.%Size())
	{
		set name = names.%Get(nameIndex - 1)

		if name.use = "official"
		{
			return name
		}
	}

	// If no matches, return first name
	return names.%Get(0)
}

/// Prepare query
ClassMethod PrepareQuery(resourceType As %String, query As %String, ByRef vars As %String, Output requestPath) As %String
{
	if query '[ "?" // Only query part, Prepend with "?"
	{
		set query = "?" _ query
	}

	if ..StartsWith(query, "/") // remove leading slash
	{
		set query = $EXTRACT(query, 2, *)
	}

	if '..StartsWith(query, resourceType)
	{
		set query = resourceType _ "/" _ query
	}

	set query = ..SubstituteVars(query, .vars)
	set requestPath = $PIECE(query, "?", 1)

    if $EXTRACT(requestPath, *) = "/"
    {
        set requestPath = $EXTRACT(requestPath, 1, *-1)
    }

	return $PIECE(query, "?", 2)
}

}
