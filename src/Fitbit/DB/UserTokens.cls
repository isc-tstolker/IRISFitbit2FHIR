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

/// Get scopes for User
ClassMethod GetScopesForUser(userId As %String) As %Status
{
    if ..UserIdIndexExists(userId)
    {
        #dim userToken as Fitbit.DB.UserTokens = ..UserIdIndexOpen(userId)

        return userToken.Scopes
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
