---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znuserexternalaccesspolicy
schema: 2.0.0
---

# Get-ZNUserExternalAccessPolicy

## SYNOPSIS
Returns an external access policy.

## SYNTAX

### List (Default)
```
Get-ZNUserExternalAccessPolicy -UserId <String> [-AccountName <String>] [-AddAncestors] [-AddBuiltins]
 [-Cursor <Int64>] [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>] [-Order <String>]
 [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNUserExternalAccessPolicy -PolicyId <String> -UserId <String> [-AccountName <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns an external access policy.

## EXAMPLES

### Example 1: List external access policies for a user
```powershell
(Get-ZNUserExternalAccessPolicy -UserId u:a:jRVryncp).Items
```

```output
CreatedAt                  : 1728092471548
CreatedByEmail             : 
CreatedByEnforcementSource : 4
CreatedById                : u:a:JnQxZS6j
CreatedByName              : nicholas-ad
CreatedByUserRole          : 1
Description                : 
DstAssetId                 : a:n:3Odw9d40
DstAssetInfo               : ZeroNetworks.PowerShell.Cmdlets.Api.Models.Asset
DstPortsList               : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
DstProcessNamesList        : {*}
Id                         : p:e:J92SSHLf
Name                       : Ansible
RuleDuration               : 8
SrcUserIdsList             : {u:a:jRVryncp}
SrcUserInfos               : {zero}
State                      : 1
UpdatedAt                  : 1728092471548
UpdatedById                : 
UpdatedByName              : 
Url                        : https://ansible.posh.local
```

This cmdlet lists external access policies for a user.

### Example 2: Get an extenal access policy for a user
```powershell
Get-ZNUserExternalAccessPolicy -UserId u:a:jRVryncp -PolicyId p:e:J92SSHLf
```

```output
CreatedByEmail             : 
CreatedByEnforcementSource : 4
CreatedById                : u:a:JnQxZS6j
CreatedByName              : nicholas-ad
CreatedByUserRole          : 1
ItemCreatedAt              : 1728092471548
ItemDescription            : 
ItemDstAssetId             : a:n:3Odw9d40
ItemDstAssetInfo           : ZeroNetworks.PowerShell.Cmdlets.Api.Models.Asset
ItemDstPortsList           : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
ItemDstProcessNamesList    : {*}
ItemId                     : p:e:J92SSHLf
ItemName                   : Ansible
ItemRuleDuration           : 8
ItemSrcUserIdsList         : {u:a:jRVryncp}
ItemSrcUserInfos           : {zero}
ItemState                  : 1
ItemUpdatedAt              : 1728092471548
ItemUrl                    : https://ansible.posh.local
UpdatedById                : 
UpdatedByName              :
```

This cmdlet gets an external access policy for a user.

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

### -UserId
userId to filter on

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

