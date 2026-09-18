---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znnetworkalertsstatsbycategory
schema: 2.0.0
---

# Get-ZNNetworkAlertsStatsByCategory

## SYNOPSIS
Returns the count of network alerts grouped by alert-type category.

## SYNTAX

```
Get-ZNNetworkAlertsStatsByCategory [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the count of network alerts grouped by alert-type category.

## EXAMPLES

### Example 1: Get network alert stats by category
```powershell
Get-ZNNetworkAlertsStatsByCategory
```

```output
Category                    Count
--------                    -----
ANOMALOUS_RUNTIME           7
RECONNAISSANCE              4
ATTACK_TOOLS                4
ANOMALOUS_PROCESS_BEHAVIOUR 7
```

This cmdlet gets network alert statistics by category.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.INetworkAlertCategoryStats

## NOTES

## RELATED LINKS

