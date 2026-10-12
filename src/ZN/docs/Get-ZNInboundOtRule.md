---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-zninboundotrule
schema: 2.0.0
---

# Get-ZNInboundOtRule

## SYNOPSIS
Get an OT/IoT Rule

## SYNTAX

### List (Default)
```
Get-ZNInboundOtRule [-AccountName <String>] [-AddAncestors] [-AddBuiltins] [-Filters <String>]
 [-Limit <Int32>] [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>] [-WithCount]
 [<CommonParameters>]
```

### Get
```
Get-ZNInboundOtRule -RuleId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Get an OT/IoT Rule

## EXAMPLES

### Example 1: List inbound OT rules
```powershell
(Get-ZNInboundOtRule).items
```

```output
Action                     : 1
ActivitiesCount            : 0
ApprovedAt                 : 
ApprovedById               : 
ApprovedByName             : 
CreatedAt                  : 1738025801723
CreatedByEmail             : 
CreatedByEnforcementSource : 4
CreatedById                : 11778dee-127b-4677-bbba-734040606532
CreatedByName              : Nicholas DiCola
CreatedByUserRole          : 1
Description                : 
Direction                  : 1
ExcludedEntityInfos        : 
ExcludedLocalIdsList       : {}
ExpiresAt                  : 
IPSecOpt                   : 
Id                         : R:s:caYmXNlz
LocalEntityId              : b:114002
LocalEntityInfos           : {Segmented OT/IoT devices}
LocalEntitySuccessor       : 
LocalProcessesList         : {*}
MirrorSwitchRuleId         : 
ParentId                   : 
ParentType                 : 
PortsList                  : 
RemoteEntityIdsList        : 
RemoteEntityInfos          : 
Ruleclass                  : 
ServicesList               : {}
SrcUserInfos               : 
SrcUsersList               : {}
State                      : 1
UpdatedAt                  : 
UpdatedById                : 
UpdatedByName              : 
```

This cmdlet lists inbound OT rules.

### Example 2: Get a inbound OT rule
```powershell
Get-ZNInboundOtRule -RuleId R:s:caYmXNlz
```

```output
ApprovedById               : 
ApprovedByName             : 
CreatedByEmail             : 
CreatedByEnforcementSource : 4
CreatedById                : 11778dee-127b-4677-bbba-734040606532
CreatedByName              : Nicholas DiCola
CreatedByUserRole          : 1
ItemAction                 : 1
ItemActivitiesCount        : 0
ItemApprovedAt             : 
ItemCreatedAt              : 1738025801723
ItemDescription            : 
ItemDirection              : 1
ItemExcludedEntityInfos    : 
ItemExcludedLocalIdsList   : {}
ItemExpiresAt              : 
ItemIPSecOpt               : 
ItemId                     : R:s:caYmXNlz
ItemLocalEntityId          : b:114002
ItemLocalEntityInfos       : {Segmented OT/IoT devices}
ItemLocalEntitySuccessor   : 
ItemLocalProcessesList     : {*}
ItemMirrorSwitchRuleId     : 
ItemParentId               : 
ItemParentType             : 
ItemPortsList              : 
ItemRemoteEntityIdsList    : 
ItemRemoteEntityInfos      : 
ItemRuleclass              : 
ItemServicesList           : {}
ItemSrcUserInfos           : 
ItemSrcUsersList           : {}
ItemState                  : 1
ItemUpdatedAt              : 
UpdatedById                : 
UpdatedByName              : 
```

The cmdlet gets a inbound OT rule.

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

