---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-zninternalaccesspolicy
schema: 2.0.0
---

# Get-ZNInternalAccessPolicy

## SYNOPSIS
Returns an internal access policy.

## SYNTAX

### List (Default)
```
Get-ZNInternalAccessPolicy [-AccountName <String>] [-AddAncestors] [-AddBuiltins] [-Cursor <Int64>]
 [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>]
 [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNInternalAccessPolicy -PolicyId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns an internal access policy.

## EXAMPLES

### Example 1: List Internal Access Policies
```powershell
(Get-ZNInternalAccessPolicy).Items
```

```output
AssignedDeploymentName               : 
ChangeTicket                         : 
CreatedAt                            : 1774889856481
CreatedByEmail                       : 
CreatedByEnforcementSource           : 0
CreatedById                          : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName                        : Zero Networks
CreatedByUserRole                    : 1
DeploymentClusterId                  : 
DeploymentClusterName                : 
Description                          : 
DstAssetId                           : g:t:5Vda83cd
DstAssetInfoAssetStatus              : 
DstAssetInfoAssetType                : 
DstAssetInfoAssignedDeploymentId     : 
DstAssetInfoBreakGlassActivated      : 
DstAssetInfoCloudConnectorVersion    : 
DstAssetInfoDeploymentaClusterId     : 
DstAssetInfoDeploymentsClusterSource : 
DstAssetInfoDomain                   : tag
DstAssetInfoEnforcementMethod        : 
DstAssetInfoExternalDeviceId         : 
DstAssetInfoFqdn                     : 
DstAssetInfoHasDns                   : 
DstAssetInfoIPSpace                  : 
DstAssetInfoId                       : g:t:5Vda83cd
DstAssetInfoIdentityProtectAt        : 
DstAssetInfoIdentityProtectedAt      : 
DstAssetInfoIdentityProtectionState  : 
DstAssetInfoInactiveReason           : 
DstAssetInfoInactiveSince            : 
DstAssetInfoIpv4Addresses            : 
DstAssetInfoIpv6Addresses            : 
DstAssetInfoIsIPSecConfigured        : 
DstAssetInfoIsQuarantined            : 
DstAssetInfoLastLogon                : 
DstAssetInfoManufacturer             : 
DstAssetInfoName                     : Externally facing servers
DstAssetInfoOSType                   : 
DstAssetInfoOperatingSystem          : 
DstAssetInfoOtLocattionInterfaceName : 
DstAssetInfoOtLocattionName          : 
DstAssetInfoOtLocattionSwitchId      : 
DstAssetInfoOutboundRestriction      : 
DstAssetInfoPasswordUpdateTime       : 
DstAssetInfoPreferredDeploymentId    : 
DstAssetInfoPrincipalName            : 
DstAssetInfoProtectAt                : 
DstAssetInfoProtectedAt              : 
DstAssetInfoProtectionState          : 
DstAssetInfoPurdueLevel              : 
DstAssetInfoRpcMonitored             : 
DstAssetInfoRpcProtectAt             : 
DstAssetInfoRpcProtectedAt           : 
DstAssetInfoRpcProtectionState       : 
DstAssetInfoSource                   : 
DstAssetInfoSwitchLocationOverridden : 
DstPortsList                         : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
DstProcessNamesList                  : {*}
EnvironmentGroupId                   : 
EnvironmentGroupName                 : 
HealthStateHealthIssuesList          : 
HealthStateHealthStatus              : 
Id                                   : p:i:yderI9bF
IdNamePairId                         : 
Name                                 : External Servers
PreferredDeploymentId1               : 
PreferredDeploymentName              : 
RuleDuration                         : 6
SrcUserIdsList                       : {b:111001}
SrcUserInfos                         : {Any user}
State                                : 1
StateAssetId                         : 
StateIdentityProtectAt               : 
StateIdentityProtectedAt             : 
StateIdentityProtectionState         : 
StateIsAssetConnected                : 
StateLastConnectedAt                 : 
StateLastDisconnectedAt              : 
StateProtectAt                       : 
StateProtectedAt                     : 
StateProtectionState                 : 
StateRpcProtectAt                    : 
StateRpcProtectedAt                  : 
StateRpcProtectionState              : 
UpdatedAt                            : 1774889856481
UpdatedById                          : 
UpdatedByName                        : 
```

This cmdlet lists Internal Access Policies.

### Example 2: Get an Internal Access Policies
```powershell
Get-ZNInternalAccessPolicy -PolicyId p:i:yderI9bF
```

```output
AssignedDeploymentName               : 
CreatedByEmail                       : 
CreatedByEnforcementSource           : 0
CreatedById                          : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName                        : Zero Networks
CreatedByUserRole                    : 1
DeploymentClusterId                  : 
DeploymentClusterName                : 
DstAssetInfoAssetStatus              : 
DstAssetInfoAssetType                : 
DstAssetInfoAssignedDeploymentId     : 
DstAssetInfoBreakGlassActivated      : 
DstAssetInfoCloudConnectorVersion    : 
DstAssetInfoDeploymentaClusterId     : 
DstAssetInfoDeploymentsClusterSource : 
DstAssetInfoDomain                   : tag
DstAssetInfoEnforcementMethod        : 
DstAssetInfoExternalDeviceId         : 
DstAssetInfoFqdn                     : 
DstAssetInfoHasDns                   : 
DstAssetInfoIPSpace                  : 
DstAssetInfoId                       : g:t:5Vda83cd
DstAssetInfoIdentityProtectAt        : 
DstAssetInfoIdentityProtectedAt      : 
DstAssetInfoIdentityProtectionState  : 
DstAssetInfoInactiveReason           : 
DstAssetInfoInactiveSince            : 
DstAssetInfoIpv4Addresses            : 
DstAssetInfoIpv6Addresses            : 
DstAssetInfoIsIPSecConfigured        : 
DstAssetInfoIsQuarantined            : 
DstAssetInfoLastLogon                : 
DstAssetInfoManufacturer             : 
DstAssetInfoName                     : Externally facing servers
DstAssetInfoOSType                   : 
DstAssetInfoOperatingSystem          : 
DstAssetInfoOtLocattionInterfaceName : 
DstAssetInfoOtLocattionName          : 
DstAssetInfoOtLocattionSwitchId      : 
DstAssetInfoOutboundRestriction      : 
DstAssetInfoPasswordUpdateTime       : 
DstAssetInfoPreferredDeploymentId    : 
DstAssetInfoPrincipalName            : 
DstAssetInfoProtectAt                : 
DstAssetInfoProtectedAt              : 
DstAssetInfoProtectionState          : 
DstAssetInfoPurdueLevel              : 
DstAssetInfoRpcMonitored             : 
DstAssetInfoRpcProtectAt             : 
DstAssetInfoRpcProtectedAt           : 
DstAssetInfoRpcProtectionState       : 
DstAssetInfoSource                   : 
DstAssetInfoSwitchLocationOverridden : 
EnvironmentGroupId                   : 
EnvironmentGroupName                 : 
HealthStateHealthIssuesList          : 
HealthStateHealthStatus              : 
IdNamePairId                         : 
ItemChangeTicket                     : 
ItemCreatedAt                        : 1774889856481
ItemDescription                      : 
ItemDstAssetId                       : g:t:5Vda83cd
ItemDstPortsList                     : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
ItemDstProcessNamesList              : {*}
ItemId                               : p:i:yderI9bF
ItemName                             : External Servers
ItemRuleDuration                     : 6
ItemSrcUserIdsList                   : {b:111001}
ItemSrcUserInfos                     : {Any user}
ItemState                            : 1
ItemUpdatedAt                        : 1774889856481
PreferredDeploymentId1               : 
PreferredDeploymentName              : 
StateAssetId                         : 
StateIdentityProtectAt               : 
StateIdentityProtectedAt             : 
StateIdentityProtectionState         : 
StateIsAssetConnected                : 
StateLastConnectedAt                 : 
StateLastDisconnectedAt              : 
StateProtectAt                       : 
StateProtectedAt                     : 
StateProtectionState                 : 
StateRpcProtectAt                    : 
StateRpcProtectedAt                  : 
StateRpcProtectionState              : 
UpdatedById                          : 
UpdatedByName                        : 
```

This cmdlet gets an Internal Access Policy.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IInternalAccessPolicyItem

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IInternalAccessPolicyList

## NOTES

## RELATED LINKS

