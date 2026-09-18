---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znnetworkalertsstatsovertime
schema: 2.0.0
---

# Get-ZNNetworkAlertsStatsOverTime

## SYNOPSIS
Returns a daily count of network alerts by threat level over the requested time frame.

## SYNTAX

```
Get-ZNNetworkAlertsStatsOverTime -TimeFrame <Int32> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a daily count of network alerts by threat level over the requested time frame.

## EXAMPLES

### Example 1: Get network alert stats over time
```powershell
Get-ZNNetworkAlertsStatsOverTime -TimeFrame 1 | select ThreatLevel,Count,DaySeconds
```

```output
ThreatLevel Count DaySeconds
----------- ----- ----------
          1     0 1786406400
          2     0 1786406400
          3     0 1786406400
          1     0 1786492800
          2     0 1786492800
          3     0 1786492800
...
```

This cmdlet gets network alert statistics over time.

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

### -TimeFrame
timeframe parameter Max = -1 One Month = 1 Three Monthes = 3 Six Monthes = 6 One Year = 12

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.INetworkAlertOverTimeStats

## NOTES

## RELATED LINKS

