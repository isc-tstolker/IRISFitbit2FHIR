/// String Helpers
Class Fitbit.Util.StringHelpers
{

/// StartsWith helper
ClassMethod StartsWith(sourceValue As %String, searchValue As %String) As %Boolean
{
    set pattern = "1"""_searchValue_"""0.E"

    return (sourceValue ? @pattern )
}

/// Substite placeholders
ClassMethod SubstituteVars(value As %String, ByRef vars As %String) As %String
{
	set separator = "{"
	set result = value

	while $LENGTH(result, separator) > 1
	{
		set start = $PIECE(result, separator, 1)
		set part2 = $PIECE(result, separator, 2, *)
		set varname = $PIECE(part2, "}", 1)
		set end = $PIECE(part2, "}", 2, *)

		set result = start_$GET(vars(varname))_end

    	#; w "Translated to " _ result,!
	}

	return result
}

/// Format date Time to proper ISO Date Time
ClassMethod FormatISODateTime(dateTime As %String) As %String
{
    try
    {
        return $ZDATETIME($ZDATETIMEH(dateTime, 3, 5), 3, 5)
    }
    catch ex
    {
        return dateTime
    }
}

}
