---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-zngroupsoutboundotrule
schema: 2.0.0
---

# Get-ZNGroupsOutboundOtRule

## SYNOPSIS
Get an OT/IoT Rule

## SYNTAX

### List (Default)
```
Get-ZNGroupsOutboundOtRule -GroupId <String> -GroupType <String> [-AccountName <String>] [-AddAncestors]
 [-AddBuiltins] [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>] [-Order <String>]
 [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNGroupsOutboundOtRule -GroupId <String> -GroupType <String> -RuleId <String> [-AccountName <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Get an OT/IoT Rule

## EXAMPLES

### Example 1: List outbound OT rules.
```powershell
$group = (Get-ZNGroup -Search "3D Printer").Items | where {$_.Name -eq "3D Printer"} 
(Get-ZNGroupsOutboundOtRule -groupType ot -GroupId $group.id).Items
```

```output
Action                     : 1
ActivitiesCount            : 0
ApprovedAt                 : 
ApprovedById               : 
ApprovedByName             : 
CreatedAt                  : 1739751622975
CreatedByEmail             : 
CreatedByEnforcementSource : 4
CreatedById                : ab803afb-83bd-4bfe-9e0e-a5db211d134b
CreatedByName              : Nick Portal
CreatedByUserRole          : 1
Description                : 
Direction                  : 2
ExcludedAssetInfos         : {}
ExcludedLocalIdsList       : {}
ExpiresAt                  : 
Id                         : R:s:03YHePJY
LocalEntityId              : g:o:1L3bd888
LocalEntityInfos           : {3D Printer}
LocalProcessesList         : {*}
MirrorNetworkRuleId        : 
MirrorSwitchRuleId         : 
MultipleLocalEntityIdsList : {}
PolicyParentRuleId         : 
PolicyParentRuleType       : 0
ProtocolsList              : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.SwitchProtocolsList}
RemoteEntitiesIdList       : {g:s:143bd888}
RemoteEntitiesInfos        : {Internal subnets}
ServicesList               : {}
ShouldBuildMirrorRules     : True
SrcUserInfos               : {}
SrcUsersList               : {}
State                      : 1
SwitchParentRuleId         : 
SwitchParentRuleType       : 0
UpdatedAt                  : 
UpdatedById                : 
UpdatedByName              : 
```

This cmdlet lists outbound OT rules.

### Example 2: Get an outbound OT rule.
```powershell
$group = (Get-ZNGroup -Search "3D Printer").Items | where {$_.Name -eq "3D Printer"} 
Get-ZNGroupsOutboundOtRule -groupType ot -GroupId $group.id -RuleId R:s:03YHePJY
```

```output
ApprovedById                   : 
ApprovedByName                 : 
CreatedByEmail                 : 
CreatedByEnforcementSource     : 4
CreatedById                    : ab803afb-83bd-4bfe-9e0e-a5db211d134b
CreatedByName                  : Nick Portal
CreatedByUserRole              : 1
ItemAction                     : 1
ItemActivitiesCount            : 0
ItemApprovedAt                 : 
ItemCreatedAt                  : 1739751622975
ItemDescription                : 
ItemDirection                  : 2
ItemExcludedAssetInfos         : {}
ItemExcludedLocalIdsList       : {}
ItemExpiresAt                  : 
ItemId                         : R:s:03YHePJY
ItemLocalEntityId              : g:o:1L3bd888
ItemLocalEntityInfos           : {3D Printer}
ItemLocalProcessesList         : {*}
ItemMirrorNetworkRuleId        : 
ItemMirrorSwitchRuleId         : 
ItemMultipleLocalEntityIdsList : {}
ItemPolicyParentRuleId         : 
ItemPolicyParentRuleType       : 0
ItemProtocolsList              : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.SwitchProtocolsList}
ItemRemoteEntitiesIdList       : {g:s:143bd888}
ItemRemoteEntitiesInfos        : {Internal subnets}
ItemServicesList               : {}
ItemShouldBuildMirrorRules     : True
ItemSrcUserInfos               : {}
ItemSrcUsersList               : {}
ItemState                      : 1
ItemSwitchParentRuleId         : 
ItemSwitchParentRuleType       : 0
ItemUpdatedAt                  : 
UpdatedById                    : 
UpdatedByName                  : 
```

This cmdlet gets an outbound OT rules.

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

### -Order
What order to sort the results

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

### -OrderColumns
what column to order on

```yaml
Type: System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=8.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RuleId
The id of the rule

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISwitchRuleItem

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISwitchRulesList

## NOTES

## RELATED LINKS

