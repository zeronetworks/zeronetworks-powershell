---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znassetoutboundrule
schema: 2.0.0
---

# Get-ZNAssetOutboundRule

## SYNOPSIS
Returns the properties of an Outbound rule.

## SYNTAX

### List (Default)
```
Get-ZNAssetOutboundRule -AssetId <String> [-AccountName <String>] [-AddAncestors] [-AddBuiltins]
 [-Direction <Int32>] [-EnrichRemoteIps] [-EntityParams <String>] [-Filters <String>] [-Limit <Int32>]
 [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNAssetOutboundRule -AssetId <String> -RuleId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the properties of an Outbound rule.

## EXAMPLES

### Example 1: List rules for a specific asset
```powershell
$asset = Search-ZNAsset -Fqdn wc01.posh.local
Get-ZNAssetOutboundRule -AssetId $asset -AddBuiltins
```

```output
CreatedAt     RemoteEntityInfos                           LocalEntityInfoName  Ruleclass ActivitiesCount Id                                   CreatedByEnforcementSource State Description
---------     -----------------                           -------------------  --------- --------------- --                                   -------------------------- ----- -----------
1694372599763 {ot1777}                                    All segmented assets           0               d69a32ec-a5ea-4915-a33f-297c6ec2ceec 5                          1     
1675961668454 {Any asset}                                 All segmented assets           0               721c3616-4914-4b66-b987-64af3d50dbae 5                          1     Allow DNS and DHCP from all…
1675961668436 {Any asset except segmented OT/IoT devices} All segmented assets           36288           b49360ce-3b4b-4e67-a613-42d4704d097f 5                          1     Allow everything to any ass…
```

This cmdlet retruns a list of rules for a specific asset.

### Example 2: Get a specific rule for a specific asset
```powershell
$asset = Search-ZNAsset -Fqdn wc01.posh.local
Get-ZNAssetOutboundRule -AssetId $asset -RuleId b49360ce-3b4b-4e67-a613-42d4704d097f
```

```output
ApprovedById               : 
ApprovedByName             : 
CreatedByEnforcementSource : 5
CreatedById                : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName              : Zero Networks
CreatedByUserRole          : 1
ItemAction                 : 1
ItemActivitiesCount        : 36288
ItemApprovedAt             : 
ItemCreatedAt              : 1675961668436
ItemDescription            : Allow everything to any asset except segmented OT/IoT devices
ItemDirection              : 2
ItemExcludedEntityInfos    : {}
ItemExcludedLocalIdsList   : {}
ItemExpiresAt              : 0
ItemId                     : b49360ce-3b4b-4e67-a613-42d4704d097f
ItemLocalEntityId          : b:110002
ItemLocalProcessesList     : {*}
ItemParentId               : 
ItemParentType             : 0
ItemPortsList              : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
ItemRemoteEntityIdsList    : {g:s:18445453}
ItemRemoteEntityInfos      : {Any asset except segmented OT/IoT devices}
ItemRuleclass              : 
ItemState                  : 1
ItemUpdatedAt              : 1690139822111
LocalEntityInfoId          : b:110002
LocalEntityInfoName        : All segmented assets
UpdatedById                : 
UpdatedByName              :
```

This cmdlet can get a specific rule for a specific asset.

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

### -AssetId
assetId to filter on

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

### -Direction
direction for the query, 1=Inbound, 2=Outbound, 3=Both

```yaml
Type: System.Int32
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: 2
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnrichRemoteIps
enrich remote IPs

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

### -EntityParams
JSON string URI encoded object {id: string, direction: AssetDirection}

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
Type: System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IRuleItem

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IRulesList

## NOTES

## RELATED LINKS

