---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znusermfaoutboundpolicy
schema: 2.0.0
---

# Get-ZNUserMfaOutboundPolicy

## SYNOPSIS
Returns the properties of an outbound MFA policy.

## SYNTAX

### List (Default)
```
Get-ZNUserMfaOutboundPolicy -UserId <String> [-AccountName <String>] [-AddAncestors] [-AddBuiltins]
 [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNUserMfaOutboundPolicy -ReactivePolicyId <String> -UserId <String> [-AccountName <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns the properties of an outbound MFA policy.

## EXAMPLES

### Example 1: List MFA policies
```powershell
$user = (Get-ZNUser -Search zero).Items | where {$_.Name -eq "zero"}
Get-ZNUserMfaOutboundPolicy -UserId $user.id
```

```output
AdditionalPortsList            : {}
CreatedAt                      : 1745321916352
CreatedBy                      : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName                  : Zero Networks
Description                    : 
DstEntityInfoId                : a:t:BPFR4ZlN
DstEntityInfoName              : activeOT
DstPort                        : 22
DstProcessNames                : {*}
EnforcementSource              : 5
ExcludedSrcEntityInfos         : {}
ExcludedSrcProcesses           : {}
FallbackToLoggedOnUser         : False
Id                             : 0e7f8488-2a7e-45dc-925b-e86172ae489f
IdentityProtectionCategoryList : {}
MfaMethods                     : {4}
OverrideBuiltins               : False
ProtocolType                   : 6
RestrictLoginToOriginatingUser : True
RuleDuration                   : 6
SrcEntityInfos                 : {All segmented assets}
SrcProcessNames                : {*}
SrcUserInfos                   : {zero}
State                          : 1
UpdatedAt                      : 1745321916352
UpdatedBy                      : 1f352ed0-86f1-454f-90a5-592c197c8000
UpdatedByName                  : Zero Networks
```

This cmdlet lists MFA policies for a user.

### Example 2: Get MFA policy
```powershell
$user = (Get-ZNUser -Search zero).Items | where {$_.Name -eq "zero"}
Get-ZNUserMfaOutboundPolicy -UserId $user.id -ReactivePolicyId 0e7f8488-2a7e-45dc-925b-e86172ae489f
```

```output
DstEntityInfoId                    : a:t:BPFR4ZlN
DstEntityInfoName                  : activeOT
ItemAdditionalPortsList            : {}
ItemCreatedAt                      : 1745321916352
ItemCreatedBy                      : 1f352ed0-86f1-454f-90a5-592c197c8000
ItemCreatedByName                  : Zero Networks
ItemDescription                    : 
ItemDstPort                        : 22
ItemDstProcessNames                : {*}
ItemEnforcementSource              : 5
ItemExcludedSrcEntityInfos         : {}
ItemExcludedSrcProcesses           : {}
ItemFallbackToLoggedOnUser         : False
ItemId                             : 0e7f8488-2a7e-45dc-925b-e86172ae489f
ItemIdentityProtectionCategoryList : {}
ItemMfaMethods                     : {4}
ItemOverrideBuiltins               : False
ItemProtocolType                   : 6
ItemRestrictLoginToOriginatingUser : True
ItemRuleDuration                   : 6
ItemSrcEntityInfos                 : {All segmented assets}
ItemSrcProcessNames                : {*}
ItemSrcUserInfos                   : {zero}
ItemState                          : 1
ItemUpdatedAt                      : 1745321916352
ItemUpdatedBy                      : 1f352ed0-86f1-454f-90a5-592c197c8000
ItemUpdatedByName                  : Zero Networks
```

This cmdlet gets an MFA policy for a user.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IReactivePolicyList

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IReactivePolicyResponse

## NOTES

## RELATED LINKS

