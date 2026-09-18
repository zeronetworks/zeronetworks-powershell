---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znnetworkalertsstatsbythreatlevel
schema: 2.0.0
---

# Get-ZNNetworkAlertsStatsByThreatLevel

## SYNOPSIS
Returns the count of network alerts grouped by threat level, plus the total count.

## SYNTAX

```
Get-ZNNetworkAlertsStatsByThreatLevel [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the count of network alerts grouped by threat level, plus the total count.

## EXAMPLES

### Example 1: Get network alert stats by threat level
```powershell
(Get-ZNNetworkAlertsStatsByThreatLevel).Items
```

```output
Count ThreatLevel
----- -----------
    0           1
   16           2
    6           3
```

This cmdlet gets network alert statistics by threat level.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.INetworkAlertThreatLevelStats

## NOTES

## RELATED LINKS

