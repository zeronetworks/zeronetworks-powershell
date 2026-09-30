---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znusermfaidentitypolicy
schema: 2.0.0
---

# Get-ZNUserMfaIdentityPolicy

## SYNOPSIS
Returns a Identity MFA policy object.

## SYNTAX

### List (Default)
```
Get-ZNUserMfaIdentityPolicy -UserId <String> [-AccountName <String>] [-AddAncestors] [-AddBuiltins]
 [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>]
 [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNUserMfaIdentityPolicy -ReactivePolicyId <String> -UserId <String> [-AccountName <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns a Identity MFA policy object.

## EXAMPLES

### Example 1: List Identity MFA policies
```powershell
(Get-ZNUserMfaIdentityPolicy -UserId $userId).Items
```

```output
CreatedAt                           : 1711982793191
CreatedByEmail                      : 
CreatedByEnforcementSource          : 5
CreatedById                         : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName                       : Zero Networks
CreatedByUserRole                   : 1
Description                         : 
DstAssetId                          : g:t:01669ce2
DstEntityInfoId                     : 
DstEntityInfoName                   : 
ExcludedDstAssetIdsList             : {}
ExcludedSrcAssetIdsList             : {}
ExcludedSrcAssetInfos               : {}
ExtraIdentityProtectionCategoryList : {}
FallbackToSingleLoggedOnUser        : False
Id                                  : 5b0b1349-1714-4a38-ba07-c32a0957ed3b
IdentityProtectionCategoryList      : {5}
InnerId                             : 
MfaMethodsList                      : {2, 4}
OverrideBuiltins                    : False
RuleDuration                        : 6
SrcAssetIdsList                     : {b:110001}
SrcAssetInfos                       : {Any asset}
SrcUserIdsList                      : {g:a:3U1Z38mF}
SrcUserInfos                        : {Domain Admins}
State                               : 1
UpdatedAt                           : 1712058796790
UpdatedById                         : 1f352ed0-86f1-454f-90a5-592c197c8000
UpdatedByName                       : Zero Networks
```

This cmdlet lists identity MFA policies.

### Example 2: Get a specific Identity MFA policy
```powershell
Get-ZNUserMfaIdentityPolicy -UserId $userId -ReactivePolicyId 5b0b1349-1714-4a38-ba07-c32a0957ed3b
```

```output
CreatedByEmail                          : 
CreatedByEnforcementSource              : 5
CreatedById                             : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName                           : Zero Networks
CreatedByUserRole                       : 1
DstEntityInfoId                         : 
DstEntityInfoName                       : 
ItemCreatedAt                           : 1711982793191
ItemDescription                         : 
ItemDstAssetId                          : g:t:01669ce2
ItemExcludedDstAssetIdsList             : {}
ItemExcludedSrcAssetIdsList             : {}
ItemExcludedSrcAssetInfos               : {}
ItemExtraIdentityProtectionCategoryList : {}
ItemFallbackToSingleLoggedOnUser        : False
ItemId                                  : 5b0b1349-1714-4a38-ba07-c32a0957ed3b
ItemIdentityProtectionCategoryList      : {5}
ItemInnerId                             : 
ItemMfaMethodsList                      : {2, 4}
ItemOverrideBuiltins                    : False
ItemRuleDuration                        : 6
ItemSrcAssetIdsList                     : {b:110001}
ItemSrcAssetInfos                       : {Any asset}
ItemSrcUserIdsList                      : {g:a:3U1Z38mF}
ItemSrcUserInfos                        : {Domain Admins}
ItemState                               : 1
ItemUpdatedAt                           : 1712058796790
UpdatedById                             : 1f352ed0-86f1-454f-90a5-592c197c8000
UpdatedByName                           : Zero Networks
```

This cmdlet gets a specific Identity MFA policy.

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
Type: System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: None
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IIdentityReactivePolicyList

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IIdentityReactivePolicyResponse

## NOTES

## RELATED LINKS

