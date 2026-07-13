---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znsettingsconnectserversfreezeperiodmaxduration
schema: 2.0.0
---

# Get-ZNSettingsConnectServersFreezePeriodMaxDuration

## SYNOPSIS
Get the configured maximum freeze period duration in days

## SYNTAX

```
Get-ZNSettingsConnectServersFreezePeriodMaxDuration [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Get the configured maximum freeze period duration in days

## EXAMPLES

### Example 1: Get freeze period max duration
```powershell
Get-ZNSettingsConnectServersFreezePeriodMaxDuration
```

```output
MaxFreezeWindowDays
-------------------
                 30
```

This cmdlet gets the freeze period max duration.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISettingsFreezePeriodMaxDuration

## NOTES

## RELATED LINKS

