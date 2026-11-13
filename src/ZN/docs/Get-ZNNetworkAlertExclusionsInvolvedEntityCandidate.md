---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znnetworkalertexclusionsinvolvedentitycandidate
schema: 2.0.0
---

# Get-ZNNetworkAlertExclusionsInvolvedEntityCandidate

## SYNOPSIS
Returns a list of asset, group and IP candidates for the involved assets.

## SYNTAX

```
Get-ZNNetworkAlertExclusionsInvolvedEntityCandidate [-AccountName <String>] [-Cursor <Int64>] [-Limit <Int32>]
 [-Search <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of asset, group and IP candidates for the involved assets.

## EXAMPLES

### Example 1: List involved entity exclusion candidates
```powershell
(Get-ZNNetworkAlertExclusionsInvolvedEntityCandidate).Items
```

```output
AssetStatus                  : 1
AssetType                    : 0
BreakGlassActivated          : False
ConditionAssetTypes          : 
ConditionDomains             : 
ConditionIPBuiltins          : 
ConditionLabelConditionsList : 
ConditionNamePatterns        : 
ConditionOSNamePatterns      : 
ConditionOSTypes             : 
Domain                       : 
Email                        : 
Guid                         : 
HasIdentityProtectionPolicy  : 
HasNetworkProtectionPolicy   : 
Id                           : a:l:mATpjRhv
IdentityProtectionState      : 1
IsQuarantined                : 
Name                         : aalinux02.server.com
OtLocattionInterfaceName     : 
OtLocattionName              : 
OtLocattionSwitchId          : 
ProtectionState              : 1
RpcProtectionState           : 1
Sid                          : 
UserType                     : 
```

This cmdlet lists involved entities that can be ecluded in network alerts.

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

### -Cursor
cursor position to start at

```yaml
Type: System.Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Limit
Limit the return results

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
```

### -Search
Test to search for

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ICandidatesList

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

