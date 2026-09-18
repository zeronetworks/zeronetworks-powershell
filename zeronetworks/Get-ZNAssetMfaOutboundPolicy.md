---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znassetmfaoutboundpolicy
schema: 2.0.0
---

# Get-ZNAssetMfaOutboundPolicy

## SYNOPSIS
Returns the properties of an outbound MFA policy.

## SYNTAX

### List (Default)
```
Get-ZNAssetMfaOutboundPolicy -AssetId <String> [-AccountName <String>] [-AddAncestors] [-AddBuiltins]
 [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNAssetMfaOutboundPolicy -AssetId <String> -ReactivePolicyId <String> [-AccountName <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns the properties of an outbound MFA policy.

## EXAMPLES

### Example 1: List outbound MFA policies for a specific asset
```powershell
$otasset = Get-ZNAssetsOt | where {$_.Fqdn -eq "ot1777"}
Get-ZNAssetMfaOutboundPolicy -AssetId $otasset.Id       
```

```output
SrcEntityInfos         SrcProcessNames SrcUserInfos DstEntityInfoName        DstPort DstProcessNames RuleDuration FallbackToLoggedOnUser MfaMethod
                                                                                                                                         s
--------------         --------------- ------------ -----------------        ------- --------------- ------------ ---------------------- ---------
{All segmented assets} {*}             {Any user}   Segmented OT/IoT devices 80,443  {*}             6            True                   {4}
{All segmented assets} {*}             {Any user}   Segmented OT/IoT devices 22      {*}             6            True                   {4}
```

This cmdlet lists the outbound MFA policies for a specific asset.

### Example 2: Get a specific outbound MFA policy for a specific asset
```powershell
Get-ZNAssetMfaOutboundPolicy -AssetId $otasset.Id -ReactivePolicyId 79b5ed54-16c7-45f1-9a5d-ea1022e1d710
```

```output
DstEntityInfoAssetStatus     : 
DstEntityInfoAssetType       : 
DstEntityInfoDomain          : 
DstEntityInfoFqdn            : 
DstEntityInfoId              : g:s:17445453
DstEntityInfoIpv4Addresses   : 
DstEntityInfoIpv6Addresses   : 
DstEntityInfoName            : Segmented OT/IoT devices
DstEntityInfoOperatingSystem : 
DstEntityInfoProtectionState : 
DstEntityInfoSource          : 
ItemAdditionalPortsList      : {}
ItemCreatedAt                : 1682532554328
ItemCreatedBy                : m:75fae1679ac11d635cd4fbc8921786441ba47a4d
ItemCreatedByName            : irtest
ItemDescription              : 
ItemDstPort                  : 80,443
ItemDstProcessNames          : {*}
ItemEnforcementSource        : 6
ItemExcludedSrcEntityInfos   : {}
ItemExcludedSrcProcesses     : {}
ItemFallbackToLoggedOnUser   : True
ItemId                       : 79b5ed54-16c7-45f1-9a5d-ea1022e1d710
ItemMfaMethods               : {4}
ItemOverrideBuiltins         : False
ItemProtocolType             : 6
ItemRuleDuration             : 6
ItemSrcEntityInfos           : {All segmented assets}
ItemSrcProcessNames          : {*}
ItemSrcUserInfos             : {Any user}
ItemState                    : 1
ItemUpdatedAt                : 1682532554328
StateAssetId                 : 
StateIsAssetConnected        : 
StateLasDisconnectedAt       : 
StateProtectAt               : 
StateProtectionState         : 
```

This cmdlet lists a specific outbound MFA policies for a specific asset.

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

