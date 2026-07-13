---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znsettingsposturechecksexcludeduser
schema: 2.0.0
---

# Get-ZNSettingsPostureChecksExcludedUser

## SYNOPSIS
Returns user IDs excluded from all posture checks in the environment.

## SYNTAX

```
Get-ZNSettingsPostureChecksExcludedUser [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns user IDs excluded from all posture checks in the environment.

## EXAMPLES

### Example 1: List posture check excluded users
```powershell
Get-ZNSettingsPostureChecksExcludedUser
```

```output
Id           Name
--           ----
u:a:85fqUZ9R Nicholas
```

This cmdlet lists posture check excluded users.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IPaths1320CmlSettingsPostureChecksExcludedUsersGetResponses200ContentApplicationJsonSchema

## NOTES

## RELATED LINKS

