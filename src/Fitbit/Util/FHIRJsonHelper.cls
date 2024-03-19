/// Helpers for creation of FHIR Json resources
Class Fitbit.Util.FHIRJsonHelper
{

/// CreateIdentifier
ClassMethod CreateIdentifier(system As %String, value As %String) As %DynamicObject
{
    set identifier = {}

    if (system '= "")
    {
        set identifier.system = system
    }

    if (value '= "")
    {
        set identifier.value = value
    }

    return identifier
}

/// CreateCodeableConcept with one coding
ClassMethod CreateCodeableConcept(system As %String = "", codeValue As %String = "", display As %String = "", text As %String = "") As %DynamicObject
{
    set codeableConcept = { }

    if (system '= "") || (codeValue '= "")
    {
        set code = { }

        if (system '= "")
        {
            set code.system = system
        }

        if (codeValue '= "")
        {
            set code.code = codeValue
        }

        if (display '= "")
        {
            set code.display = display
        }

        set codeableConcept.coding = [ (code) ]
    }

    if (text '= "")
    {
        set codeableConcept.text = text
    }

    return codeableConcept
}

/// Find identifier value by system
ClassMethod FindIdentifierValueBySystem(identifiers As %DynamicArray, system As %String) As %Status
{
    if $ISOBJECT(identifiers)
    {
        for index = 1:1:(identifiers.%Size())
        {
            set identifier = identifiers.%Get(index - 1)

            if identifier.system = system
            {
                return identifier.value
            }
        }
    }

    return ""
}

/// Fiind code from CodeableConcept by system
ClassMethod FindCodeableConceptCodeBySystem(codeableConcept As %DynamicObject, system As %String) As %String
{
    if $ISOBJECT(codeableConcept) && $ISOBJECT(codeableConcept.coding)
    {
        for index = 1:1:(codeableConcept.coding.%Size())
        {
            set coding = codeableConcept.coding.%Get(index - 1)

            if coding.system = system
            {
                return coding.code
            }
        }
    }

    return ""
}

}
