---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-zngroupsexternalaccesspolicy
schema: 2.0.0
---

# Get-ZNGroupsExternalAccessPolicy

## SYNOPSIS
Returns an external access policy.

## SYNTAX

### List (Default)
```
Get-ZNGroupsExternalAccessPolicy -GroupId <String> -GroupType <String> [-AccountName <String>] [-AddAncestors]
 [-AddBuiltins] [-Cursor <Int64>] [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>] [-Order <String>]
 [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNGroupsExternalAccessPolicy -GroupId <String> -GroupType <String> -PolicyId <String>
 [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns an external access policy.

## EXAMPLES

### Example 1: List external access policies for a group
```powershell
(Get-ZNGroupsExternalAccessPolicy -Groupid g:t:5V669ce2 -GroupType tag).Items
```

```output
CreatedAt                  : 1728091784452
CreatedByEmail             : 
CreatedByEnforcementSource : 4
CreatedById                : u:a:JnQxZS6j
CreatedByName              : nicholas-ad
CreatedByUserRole          : 1
Description                : 
DstAssetId                 : g:t:5V669ce2
DstAssetInfo               : ZeroNetworks.PowerShell.Cmdlets.Api.Models.Asset
DstPortsList               : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
DstProcessNamesList        : {*}
Id                         : p:e:EhAz2WVR
Name                       : External Servers
RuleDuration               : 8
SrcUserIdsList             : {b:111001}
SrcUserInfos               : {Any user}
State                      : 1
UpdatedAt                  : 1728091784452
UpdatedById                : 
UpdatedByName              : 
Url                        : https://external.posh.local
```

This cmdlet lists external access policies for a group.

### Example 2: Get an external access policy for a group
```powershell
Get-ZNGroupsExternalAccessPolicy -Groupid g:t:5V669ce2 -GroupType tag -PolicyId p:e:EhAz2WVR
```

```output
CreatedByEmail             : 
CreatedByEnforcementSource : 4
CreatedById                : u:a:JnQxZS6j
CreatedByName              : nicholas-ad
CreatedByUserRole          : 1
ItemCreatedAt              : 1728091784452
ItemDescription            : 
ItemDstAssetId             : g:t:5V669ce2
ItemDstAssetInfo           : ZeroNetworks.PowerShell.Cmdlets.Api.Models.Asset
ItemDstPortsList           : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
ItemDstProcessNamesList    : {*}
ItemId                     : p:e:EhAz2WVR
ItemName                   : External Servers
ItemRuleDuration           : 8
ItemSrcUserIdsList         : {b:111001}
ItemSrcUserInfos           : {Any user}
ItemState                  : 1
ItemUpdatedAt              : 1728091784452
ItemUrl                    : https://external.posh.local
UpdatedById                : 
UpdatedByName              : 
```

This cmdlet gets an external access policy for a group.

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

### -Cursor
cursor position to start at

```yaml
Type: System.Int64
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
Type: System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PolicyId
id of the external acess policy

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IExternalAccessPolicyItem

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IExternalAccessPolicyList

## NOTES

## RELATED LINKS

