---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znassetsexposuremeterstatistics
schema: 2.0.0
---

# Get-ZNAssetsExposureMeterStatistics

## SYNOPSIS
Returns exposure meter statistics for assets.

## SYNTAX

```
Get-ZNAssetsExposureMeterStatistics [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns exposure meter statistics for assets.

## EXAMPLES

### Example 1: List exposure meter statistics
```powershell
get-znassetsExposureMeterStatistics | Format-List
```

```output
Date                        : 1779840000000
LateralMovementRiskClients  : 20
LateralMovementRiskServers  : 91
LateralMovementRiskTotal    : 85
MonitoredAssetClients       : 1
MonitoredAssetServers       : 11
MonitoredAssetTotal         : 12
SegmentationCoverageClients : 0
SegmentationCoverageServers : 0
SegmentationCoverageTotal   : 0
SegmentedAssetClients       : 0
SegmentedAssetServers       : 0
SegmentedAssetTotal         : 0

Date                        : 1779907859374
LateralMovementRiskClients  : 20
LateralMovementRiskServers  : 91
LateralMovementRiskTotal    : 85
MonitoredAssetClients       : 1
MonitoredAssetServers       : 11
MonitoredAssetTotal         : 12
SegmentationCoverageClients : 100
SegmentationCoverageServers : 18.18
SegmentationCoverageTotal   : 25
SegmentedAssetClients       : 1
SegmentedAssetServers       : 2
SegmentedAssetTotal         : 3
```

This cmdlet lists exposure meter statistics.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IExposureMeterStatistics

## NOTES

## RELATED LINKS

