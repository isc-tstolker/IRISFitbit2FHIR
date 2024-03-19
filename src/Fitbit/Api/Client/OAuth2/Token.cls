/// OAuth2 Token handler for fitbit
Class Fitbit.Api.Client.OAuth2.Token Extends %RegisteredObject
{

Parameter TokenUrl = "https://api.fitbit.com/oauth2/token";

XData sampleResponse [ MimeType = application/json ]
{
{
	"access_token": "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMjdQODMiLCJzdWIiOiI0RDhDUjIiLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJyc29jIHJlY2cgcnNldCByb3h5IHJudXQgcnBybyByc2xlIHJjZiByYWN0IHJsb2MgcnJlcyByd2VpIHJociBydGVtIiwiZXhwIjoxNzEwODYxMTE4LCJpYXQiOjE3MTA4MzIzMTh9.rPI6Zzx9BXAM4Shq8idhrUIw26KB18g9ic5GcRDrPIU",
	"expires_in": 28800,
	"refresh_token": "32ac704aab961d8fea80cc435a1afe938c77d76aa3ebb6bbe6f4f7e6af6041f8",
	"scope": "electrocardiogram location heartrate weight temperature settings nutrition activity respiratory_rate cardio_fitness oxygen_saturation sleep profile social",
	"token_type": "Bearer",
	"user_id": "4D8CR2"
}
}

/// Get Token with Authorization Code
ClassMethod GetToken(code As %String, codeVerifier As %String, Output sc As %Status) As %DynamicObject
{
	set sc = $$$OK

	try
	{
        set request = ##class(%Net.HttpRequest).%New()
        set request.SSLConfiguration = "Default"
        set request.FollowRedirect = 1
        do request.InsertFormData("grant_type", "authorization_code")
        do request.InsertFormData("code", code)
        do request.InsertFormData("client_id", ##class(Fitbit.Api.Client.bo.Operation).GetConfigValue("OAuth2ClientID"))
        do request.InsertFormData("redirect_uri", ##class(Fitbit.Api.Client.bo.Operation).GetConfigValue("RedirectUrl", 0))
        do request.InsertFormData("expires_in", "900")
        do request.InsertFormData("code_verifier", codeVerifier)
        
        set sc = request.Post(..#TokenUrl)

        if $$$ISERR(sc) { return {} }

        set token = request.HttpResponse.Data.Read()
        
        if request.HttpResponse.StatusCode '= 200
        {
            set sc = $$$ERROR($$$GeneralError, "HTTP status "_ request.HttpResponse.StatusCode_", message: " _ token)
            return {}
        }
        
        return ##class(%DynamicAbstractObject).%FromJSON(token)
	}
	catch ex
	{
		set sc = ex.AsStatus()
        return {}
	}
}

/// Get new token using refresh
/// https://api.fitbit.com/oauth2/token
///  -H "Authorization: Basic MjI3UDgzOjVhNjhhMTFjMjUxYzhlMzEzYmFlMDc4MzAwNTIzN2Rh"  \
///  -H "Content-Type: application/x-www-form-urlencoded"  \
///  --data "grant_type=refresh_token"  \
///  --data "refresh_token=32ac704aab961d8fea80cc435a1afe938c77d76aa3ebb6bbe6f4f7e6af6041f8"
ClassMethod GetTokenUsingRefresh(refreshToken As %String, Output sc As %Status) As %DynamicObject
{
	set sc = $$$OK

	try
	{
        set request = ##class(%Net.HttpRequest).%New()
        set request.Username = ##class(Fitbit.Api.Client.bo.Operation).GetConfigValue("OAuth2ClientID")
        set request.Password = ##class(Fitbit.Api.Client.bo.Operation).GetConfigValue("OAuth2ClientSecret")
        set request.SSLConfiguration = "Default"
        set request.FollowRedirect = 1
        do request.InsertFormData("grant_type", "refresh_token")
        do request.InsertFormData("refresh_token", refreshToken)
        
        set sc = request.Post(..#TokenUrl)

        if $$$ISERR(sc)
        {
            return {}
        }

        set token = request.HttpResponse.Data.Read()
        
        if request.HttpResponse.StatusCode '= 200
        {
            set sc = $$$ERROR($$$GeneralError, "HTTP status "_ request.HttpResponse.StatusCode_", message: " _ token)
            return {}
        }
        
        return ##class(%DynamicAbstractObject).%FromJSON(token)
	}
	catch ex
	{
		set sc = ex.AsStatus()

        return {}
	}
}

}
