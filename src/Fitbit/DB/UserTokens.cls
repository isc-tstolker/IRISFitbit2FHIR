/// Fitbit UserTokens - here we store the current Refresh token and current active token for known Fitbit users 
Class Fitbit.DB.UserTokens Extends %Persistent
{

/// Fitbit UserId
Property UserId As %String;

Index UserIdIndex On UserId [ Unique ];

/// Access Token
Property AccessToken As %String(MAXLEN = "");

/// Refresh Token
Property RefreshToken As %String(MAXLEN = 80);

/// ExpiryDateTime
Property UTCExpiryDateTime As %String;

/// Scopes
Property Scopes As %String(MAXLEN = "");

/// CreateOrUpdateUser
ClassMethod CreateOrUpdateUserFromToken(token As %DynamicObject) As %Status
{
    return ..CreateOrUpdateUser(token."user_id", token."access_token", token."refresh_token", token."expires_in", token.scope)
}

/// CreateOrUpdateUser
ClassMethod CreateOrUpdateUser(userId As %String, accessToken As %String, refreshToken As %String, expiresIn As %Integer, scopes As %String) As %Status
{
    if ..UserIdIndexExists(userId)
    {
        set userToken = ..UserIdIndexOpen(userId)
    }
    else
    {
        set userToken = ..%New()
        set userToken.UserId = userId
    }

    set userToken.AccessToken = accessToken
    set userToken.RefreshToken = refreshToken
    set timeinseconds = ##class(%OAuth2.Utils).TimeInSeconds($ZTIMESTAMP, expiresIn)
    set userToken.UTCExpiryDateTime = $ZDATETIME($ZDATETIMEH(timeinseconds, -2), 3, 5)
    set userToken.Scopes = scopes

    return userToken.%Save()
}

/// Get AccessToken for User
ClassMethod GetAccessTokenForUser(userId As %String) As %Status
{
    if ..UserIdIndexExists(userId)
    {
        #dim userToken as Fitbit.DB.UserTokens = ..UserIdIndexOpen(userId)

        // TBD: Deal with token that is about to expire by refreshing it!!

        return userToken.AccessToken
    }

    return ""
}

Storage Default
{
<Data name="UserTokensDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>UserId</Value>
</Value>
<Value name="3">
<Value>AccessToken</Value>
</Value>
<Value name="4">
<Value>RefreshToken</Value>
</Value>
<Value name="5">
<Value>UTCExpiryDateTime</Value>
</Value>
<Value name="6">
<Value>Scopes</Value>
</Value>
</Data>
<DataLocation>^Fitbit.DB.UserTokensD</DataLocation>
<DefaultData>UserTokensDefaultData</DefaultData>
<IdLocation>^Fitbit.DB.UserTokensD</IdLocation>
<IndexLocation>^Fitbit.DB.UserTokensI</IndexLocation>
<StreamLocation>^Fitbit.DB.UserTokensS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
