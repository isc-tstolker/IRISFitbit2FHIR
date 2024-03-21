Include Ensemble

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

/// Timezone
Property Timezone As %String;

/// LastSynchronized date everything was pulled
Property LastSynchronized As %String;

/// CreateOrUpdateUser
ClassMethod CreateOrUpdateUserFromToken(token As %DynamicObject) As %Status
{
    set userId = token."user_id"

    if ..UserIdIndexExists(userId)
    {
        set userToken = ..UserIdIndexOpen(userId)
    }
    else
    {
        set userToken = ..%New()
        set userToken.UserId = userId
    }

    return ..UpdateUserFromToken(userToken, token)
}

/// UpdateUserFromToken
ClassMethod UpdateUserFromToken(userToken As Fitbit.DB.UserTokens, token As %DynamicObject) As %Status
{
    set userToken.AccessToken = token."access_token"
    set userToken.RefreshToken = token."refresh_token"
    set timeinseconds = ##class(%OAuth2.Utils).TimeInSeconds($ZTIMESTAMP, (token."expires_in" - 10))
    set userToken.UTCExpiryDateTime = $ZDATETIME($ZDATETIMEH(timeinseconds, -2), 3, 5)
    set userToken.Scopes = token.scope

    return userToken.%Save()
}

/// Get AccessToken for User
ClassMethod GetAccessTokenForUser(userId As %String) As %String
{
    if ..UserIdIndexExists(userId)
    {
        #dim userToken as Fitbit.DB.UserTokens = ..UserIdIndexOpen(userId)

        // Deal with token that is about to expire by refreshing it
        set now = ##class(%OAuth2.Utils).TimeInSeconds($ZTIMESTAMP, -10)
        set expiry = $ZDATETIME($ZDATETIMEH(userToken.UTCExpiryDateTime, 3, 5), -2)
        #; W "now: ",now,"; expiry: ",expiry,!

        if now >= expiry
        {
            $$$TRACE("Token expired, now refreshing:")

            set token = ##class(Fitbit.Api.Client.OAuth2.Token).GetTokenUsingRefresh(userToken.RefreshToken, .sc)

            if $$$ISERR(sc)
            {
                $$$LOGERROR("GetTokenUsingRefresh failed: " _ sc)
                return ""
            }

            set sc = ..UpdateUserFromToken(userToken, token)

            if $$$ISERR(sc)
            {
                $$$LOGERROR("Update UserToken failed: " _ sc)
                return ""
            }
        }

        return userToken.AccessToken
    }

    return ""
}

/// Get scopes for User
ClassMethod GetScopesForUser(userId As %String) As %String
{
    if ..UserIdIndexExists(userId)
    {
        #dim userToken as Fitbit.DB.UserTokens = ..UserIdIndexOpen(userId)

        return userToken.Scopes
    }

    return ""
}

/// Get timezone for User
ClassMethod UpdateTimezone(userId As %String, timezone As %String, Output lastSynchronized As %String) As %Status
{
    set sc = $$$OK

    if ..UserIdIndexExists(userId)
    {
        #dim userToken as Fitbit.DB.UserTokens = ..UserIdIndexOpen(userId)

        set userToken.Timezone = timezone
        set lastSynchronized = userToken.LastSynchronized

        set sc = userToken.%Save()
    }

    return sc
}

/// Update LastSynchronized
ClassMethod UpdateLastSynchronized(userId As %String, lastSynchronized As %String) As %Status
{
    set sc = $$$OK

    if ..UserIdIndexExists(userId)
    {
        #dim userToken as Fitbit.DB.UserTokens = ..UserIdIndexOpen(userId)

        set userToken.LastSynchronized = lastSynchronized

        set sc = userToken.%Save()
    }

    return sc
}

/// Get timezone for User
ClassMethod GetTimezoneForUser(userId As %String, Output scopes As %String) As %String
{
    if ..UserIdIndexExists(userId)
    {
        #dim userToken as Fitbit.DB.UserTokens = ..UserIdIndexOpen(userId)
        set scopes = userToken.Scopes
        return userToken.Timezone
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
<Value name="7">
<Value>Timezone</Value>
</Value>
<Value name="8">
<Value>LastSynchronized</Value>
</Value>
</Data>
<DataLocation>^Fitbit.DB.UserTokensD</DataLocation>
<DefaultData>UserTokensDefaultData</DefaultData>
<ExtentSize>1</ExtentSize>
<IdLocation>^Fitbit.DB.UserTokensD</IdLocation>
<IndexLocation>^Fitbit.DB.UserTokensI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="AccessToken">
<AverageFieldSize>309</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="RefreshToken">
<AverageFieldSize>66</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Scopes">
<AverageFieldSize>156</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="UTCExpiryDateTime">
<AverageFieldSize>27</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="UserId">
<AverageFieldSize>8</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="UserIdIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^Fitbit.DB.UserTokensS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
