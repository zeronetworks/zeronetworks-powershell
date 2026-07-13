---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znsettingsposturecheck
schema: 2.0.0
---

# Get-ZNSettingsPostureCheck

## SYNOPSIS
Returns posture check settings for the environment, merging catalog defaults with per-environment overrides.

## SYNTAX

```
Get-ZNSettingsPostureCheck [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns posture check settings for the environment, merging catalog defaults with per-environment overrides.

## EXAMPLES

### Example 1: List posture checks
```powershell
Fet-ZnSettingsPostureCheck
```

```output
DefinitionCategory            : 1
DefinitionDescription         : The identity is configured to allow login without providing a password, bypassing standard authentication.
DefinitionEnabled             : True
DefinitionExcludedUserIdsList : 
DefinitionMitreTacticsList    : {Persistence, Defense Evasion}
DefinitionMitreTechniquesList : {T1098}
DefinitionRemediation         : Disable the "Password Not Required" flag on the user object and enforce a strong password policy.
DefinitionSeverity            : 1
DefinitionType                : 1

DefinitionCategory            : 1
DefinitionDescription         : The identity is forced to use weak DES encryption, making it vulnerable to ticket forgery attacks.
DefinitionEnabled             : True
DefinitionExcludedUserIdsList : 
DefinitionMitreTacticsList    : {Credential Access}
DefinitionMitreTechniquesList : {T1558}
DefinitionRemediation         : Uncheck "Use Kerberos DES encryption types for this account" and ensure AES encryption is supported.
DefinitionSeverity            : 2
DefinitionType                : 2
```

This cmdlet lists posture check settings.

## PARAMETERS

### -AccountName
this value is per customer / partner

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Read-ZNJWTtoken $env:ZNApiKey).aud.split(".")[0]
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IPathsHfpx2WSettingsPostureChecksGetResponses200ContentApplicationJsonSchema

## NOTES

## RELATED LINKS

