---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-zngroupsmfainboundpolicy
schema: 2.0.0
---

# Get-ZNGroupsMfaInboundPolicy

## SYNOPSIS
Returns a inbound MFA policy object.

## SYNTAX

### List (Default)
```
Get-ZNGroupsMfaInboundPolicy -GroupId <String> -GroupType <String> [-AccountName <String>] [-AddAncestors]
 [-AddBuiltins] [-EntityId <String>] [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>] [-WithCount]
 [<CommonParameters>]
```

### Get
```
Get-ZNGroupsMfaInboundPolicy -GroupId <String> -GroupType <String> -ReactivePolicyId <String>
 [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a inbound MFA policy object.

## EXAMPLES

### Example 1: List MFA policies for a specific group.
```powershell
$group = Get-ZNGroup -Search "Domain controllers" | where {$_.Domain -eq "tag"}
Get-ZNGroupsMfaInboundPolicy -Groupid $group.id -GroupType tag                             
```

```output
SrcEntityInfos SrcProcessNames SrcUserInfos DstEntityInfoName  DstPort DstProcessNames RuleDuration FallbackToLoggedOnUser MfaMethods
-------------- --------------- ------------ -----------------  ------- --------------- ------------ ---------------------- ----------
{Any asset}    {*}             {Any user}   Domain controllers 9389    {*}             7            False                  {4}
```

This cmdlet gets MFA policies for a specific group.

### Example 2: Get a specific MFA policy for a specific group
```powershell
Get-ZNGroupsMfaInboundPolicy -Groupid $group.id -GroupType tag -ReactivePolicyId aec46c4f-4512-4896-91a2-fd360d67c9d2
```

```output
DstEntityInfoAssetStatus     : 
DstEntityInfoAssetType       : 
DstEntityInfoDomain          : 
DstEntityInfoFqdn            : 
DstEntityInfoId              : g:t:01445453
DstEntityInfoIpv4Addresses   : 
DstEntityInfoIpv6Addresses   : 
DstEntityInfoName            : Domain controllers
DstEntityInfoOperatingSystem : 
DstEntityInfoProtectionState : 
DstEntityInfoSource          : 
ItemAdditionalPortsList      : {}
ItemCreatedAt                : 1679404767070
ItemCreatedBy                : 1f352ed0-86f1-454f-90a5-592c197c8000
ItemCreatedByName            : Zero Networks
ItemDescription              : Auto-generated rule for tag groups
ItemDstPort                  : 9389
ItemDstProcessNames          : {*}
ItemEnforcementSource        : 5
ItemExcludedSrcEntityInfos   : {}
ItemExcludedSrcProcesses     : {}
ItemFallbackToLoggedOnUser   : False
ItemId                       : aec46c4f-4512-4896-91a2-fd360d67c9d2
ItemMfaMethods               : {4}
ItemOverrideBuiltins         : False
ItemProtocolType             : 6
ItemRuleDuration             : 7
ItemSrcEntityInfos           : {Any asset}
ItemSrcProcessNames          : {*}
ItemSrcUserInfos             : {Any user}
ItemState                    : 1
ItemUpdatedAt                : 1679404767070
StateAssetId                 : 
StateIsAssetConnected        : 
StateLasDisconnectedAt       : 
StateProtectAt               : 
StateProtectionState         : 
```

This cmdlet can get a specific MFA policy for a specific group.

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

### -AddAncestors
show rules where the asset is part of a group

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: $true
Accept pipeline input: False
Accept wildcard characters: False
```

### -AddBuiltins
show global rules

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EntityId
entityId to filter on

```yaml
Type: System.String
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filters
JSON string URI encoded set of filters

```yaml
Type: System.String
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupId
groupId to filter on

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupType
group type to filter on

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Limit
Limit the return results

```yaml
Type: System.Int32
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
```

### -Offset
Used to page through results

```yaml
Type: System.Int32
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ReactivePolicyId
The id of the MFA policy

```yaml
Type: System.String
Parameter Sets: Get
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WithCount
return count of objects

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: $true
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IReactivePolicyList

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IReactivePolicyResponse

## NOTES

## RELATED LINKS

