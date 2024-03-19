/// User profile
Class Fitbit.Api.Client.model.Profile Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor) [ Inheritance = left, ProcedureBlock ]
{

/// Ignore invalid fields
Parameter %JSONIGNOREINVALIDFIELD = 1;

/// Date of Birth1
Property DateOfBirth As %String(%JSONFIELDNAME = "dateOfBirth");

/// Age
Property Age As %Integer(%JSONFIELDNAME = "age");

/// UserId
Property UserId As %String(%JSONFIELDNAME = "encodedId");

/// FirstName
Property FirstName As %String(%JSONFIELDNAME = "firstName");

/// LastName
Property LastName As %String(%JSONFIELDNAME = "lastName");

/// FullName
Property FullName As %String(%JSONFIELDNAME = "fullName");

/// Display Name
Property DisplayName As %String(%JSONFIELDNAME = "displayName");

/// Display Name Setting e.g. "name"
Property DisplayNameSetting As %String(%JSONFIELDNAME = "displayNameSetting");

/// Gender e.g. MALE
Property Gender As %String(%JSONFIELDNAME = "gender");

/// Country e.g. "NL"
Property Country As %String(%JSONFIELDNAME = "country");

/// Height e.g. 197.0
Property Height As %Numeric(%JSONFIELDNAME = "height");

/// HeightUnit e.g. METRIC
Property HeightUnit As %String(%JSONFIELDNAME = "heightUnit");

/// Weight e.g. : 100.9
Property Weight As %Numeric(%JSONFIELDNAME = "weight");

/// WeightUnit e.g. METRIC
Property WeightUnit As %String(%JSONFIELDNAME = "weightUnit");

/// DistanceUnit e.g. METRIC
Property DistanceUnit As %String(%JSONFIELDNAME = "distanceUnit");

/// GlucoseUnit e.g. "en_US"
Property GlucoseUnit As %String(%JSONFIELDNAME = "glucoseUnit");

/// "swimUnit": "METRIC",
/// "temperatureUnit": "en_US",
/// "waterUnit": "METRIC",
/// "waterUnitName": "ml",
/// Timezone e.g. "Europe/Amsterdam"
Property Timezone As %String(%JSONFIELDNAME = "timezone");

/// LanguageLocale e.g. "nl_NL"
Property LanguageLocale As %String(%JSONFIELDNAME = "languageLocale");

/// Locale e.g. "nl_NL"
Property Locale As %String(%JSONFIELDNAME = "locale");

/// FoodsLocale e.g. "en_US"
Property FoodsLocale As %String(%JSONFIELDNAME = "foodsLocale");

/// IsAmbassador
Property IsAmbassador As %Boolean(%JSONFIELDNAME = "ambassador");

/// "strideLengthRunning": 105.80000000000001,
/// "strideLengthRunningType": "manual",
/// "strideLengthWalking": 81.80000000000001,
/// "strideLengthWalkingType": "manual",
/// IsAutoStrideEnabled
Property IsAutoStrideEnabled As %Boolean(%JSONFIELDNAME = "autoStrideEnabled");

/// Avatar
Property Avatar As %String(%JSONFIELDNAME = "avatar", MAXLEN = "");

/// Avatar150
Property Avatar150 As %String(%JSONFIELDNAME = "avatar150", MAXLEN = "");

/// Avatar640
Property Avatar640 As %String(%JSONFIELDNAME = "avatar640", MAXLEN = "");

/// AverageDailySteps
Property AverageDailySteps As %Numeric(%JSONFIELDNAME = "averageDailySteps");

/// ChallengesBeta
Property ChallengesBeta As %Boolean(%JSONFIELDNAME = "challengesBeta");

/// ClockTimeDisplayFormat e.g. "12hour"
Property ClockTimeDisplayFormat As %String(%JSONFIELDNAME = "clockTimeDisplayFormat");

/// IsCorporate
Property IsCorporate As %Boolean(%JSONFIELDNAME = "corporate");

/// Is Corporate Admin?
Property IsCorporateAdmin As %Boolean(%JSONFIELDNAME = "corporateAdmin");

/// IsBugReportEnabled
Property IsBugReportEnabled As %Boolean(%JSONFIELDNAME = "isBugReportEnabled");

/// Is Child?
Property IsChild As %Boolean(%JSONFIELDNAME = "isChild");

/// Is Coach?
Property IsCoach As %Boolean(%JSONFIELDNAME = "isCoach");

/// Is LegalTermsAcceptRequired?
Property IsLegalTermsAcceptRequired As %Boolean(%JSONFIELDNAME = "legalTermsAcceptRequired");

/// Member since e.g. "2016-03-10",
Property MemberSince As %String(%JSONFIELDNAME = "memberSince");

/// Is MFA Enabled
Property IsMFAEnabled As %Boolean(%JSONFIELDNAME = "mfaEnabled");

/// Offset from UTC in millis, e.g 3600000
Property OffsetFromUTCMillis As %Integer(%JSONFIELDNAME = "offsetFromUTCMillis");

/// Is SDK Developer?
Property IsSDKDeveloper As %Boolean(%JSONFIELDNAME = "sdkDeveloper");

/// SleepTracking e.g. "Normal"
Property SleepTracking As %String(%JSONFIELDNAME = "sleepTracking");

/// StartDayOfWeek e.g. "SUNDAY"
Property StartDayOfWeek As %String(%JSONFIELDNAME = "startDayOfWeek");

/// Is User visible?
Property IsUserVisible As %Boolean(%JSONFIELDNAME = "visibleUser");

/// Features
Property Features As array Of %Boolean(%JSONFIELDNAME = "features");

// Property TopBadges As list Of Fitbit.Api.Client.model.TopBadge(%JSONFIELDNAME = "topBadges");

/// TopBadges
Storage Default
{
<Data name="ProfileState">
<Value name="1">
<Value>DateOfBirth</Value>
</Value>
<Value name="2">
<Value>UserId</Value>
</Value>
<Value name="3">
<Value>FirstName</Value>
</Value>
<Value name="4">
<Value>LastName</Value>
</Value>
<Value name="5">
<Value>FullName</Value>
</Value>
<Value name="6">
<Value>DisplayName</Value>
</Value>
<Value name="7">
<Value>Gender</Value>
</Value>
<Value name="8">
<Value>Height</Value>
</Value>
<Value name="9">
<Value>HeightUnit</Value>
</Value>
<Value name="10">
<Value>LanguageLocale</Value>
</Value>
<Value name="11">
<Value>Age</Value>
</Value>
<Value name="12">
<Value>IsAmbassador</Value>
</Value>
<Value name="13">
<Value>IsAutoStrideEnabled</Value>
</Value>
<Value name="14">
<Value>Avatar</Value>
</Value>
<Value name="15">
<Value>Avatar150</Value>
</Value>
<Value name="16">
<Value>Avatar640</Value>
</Value>
<Value name="17">
<Value>AverageDailySteps</Value>
</Value>
<Value name="18">
<Value>ChallengesBeta</Value>
</Value>
<Value name="19">
<Value>ClockTimeDisplayFormat</Value>
</Value>
<Value name="20">
<Value>IsCorporate</Value>
</Value>
<Value name="21">
<Value>IsCorporateAdmin</Value>
</Value>
<Value name="22">
<Value>Country</Value>
</Value>
<Value name="23">
<Value>DisplayNameSetting</Value>
</Value>
<Value name="24">
<Value>DistanceUnit</Value>
</Value>
<Value name="25">
<Value>FoodsLocale</Value>
</Value>
<Value name="26">
<Value>Features</Value>
</Value>
<Value name="27">
<Value>GlucoseUnit</Value>
</Value>
<Value name="28">
<Value>Locale</Value>
</Value>
<Value name="29">
<Value>IsBugReportEnabled</Value>
</Value>
<Value name="30">
<Value>IsChild</Value>
</Value>
<Value name="31">
<Value>IsCoach</Value>
</Value>
<Value name="32">
<Value>IsLegalTermsAcceptRequired</Value>
</Value>
<Value name="33">
<Value>MemberSince</Value>
</Value>
<Value name="34">
<Value>IsMFAEnabled</Value>
</Value>
<Value name="35">
<Value>OffsetFromUTCMillis</Value>
</Value>
<Value name="36">
<Value>IsSDKDeveloper</Value>
</Value>
<Value name="37">
<Value>SleepTracking</Value>
</Value>
<Value name="38">
<Value>StartDayOfWeek</Value>
</Value>
<Value name="39">
<Value>WeightUnit</Value>
</Value>
<Value name="40">
<Value>IsUserVisible</Value>
</Value>
<Value name="41">
<Value>Weight</Value>
</Value>
<Value name="42">
<Value>Timezone</Value>
</Value>
</Data>
<Description>
<![CDATA[TopBadges]]></Description>
<State>ProfileState</State>
<StreamLocation>^Fitbit.Api.Client2A66.ProfileS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
