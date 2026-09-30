---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znaeexclusionsinbound
schema: 2.0.0
---

# Get-ZNAeExclusionsInbound

## SYNOPSIS
Returns the properties of the get AE exclusion.

## SYNTAX

### List (Default)
```
Get-ZNAeExclusionsInbound [-AccountName <String>] [-AddAncestors] [-AddBuiltins] [-EnrichRemoteIps]
 [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>]
 [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNAeExclusionsInbound -RuleId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the properties of the get AE exclusion.

## EXAMPLES

### Example 1: List AE Inbound Exclusions
```powershell
(Get-ZNAeExclusionsInbound).Items
```

```output
Action                                 : 1
ActivitiesCount                        : 1
ApprovedAt                             : 
ApprovedById                           : 
ApprovedByName                         : 
AssignedDeploymentName                 : 
ComplimentarySwitchRuleId              : 
CreatedAt                              : 1730108830162
CreatedByEmail                         : 
CreatedByEnforcementSource             : 5
CreatedById                            : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName                          : Zero Networks
CreatedByUserRole                      : 1
DeletedAt                              : 1730109060454
DeletedById                            : 1f352ed0-86f1-454f-90a5-592c197c8000
DeletedByName                          : Zero Networks
Description                            : 
Direction                              : 1
ExcludedEntityInfos                    : {}
ExcludedLocalIdsList                   : {}
ExpiresAt                              : 
HealthStateHealthIssuesList            : 
HealthStateHealthStatus                : 
IPSecOpt                               : 1
Id                                     : 053a0149-3857-4189-8649-16818d14ba26
IdNamePairId                           : 
LocalEntityId                          : a:a:kP1uiAQy
LocalEntityInfoAssetStatus             : 
LocalEntityInfoAssetType               : 
LocalEntityInfoAssignedDeploymentId    : 
LocalEntityInfoBreakGlassActivated     : 
LocalEntityInfoCloudConnectorVersion   : 
LocalEntityInfoDomain                  : 
LocalEntityInfoFqdn                    : 
LocalEntityInfoId                      : 
LocalEntityInfoIdentityProtectAt       : 
LocalEntityInfoIdentityProtectionState : 
LocalEntityInfoInactiveReason          : 
LocalEntityInfoIpv4Addresses           : 
LocalEntityInfoIpv6Addresses           : 
LocalEntityInfoLastLogon               : 
LocalEntityInfoName                    : 
LocalEntityInfoOperatingSystem         : 
LocalEntityInfoPasswordUpdateTime      : 
LocalEntityInfoPreferredDeploymentId   : 
LocalEntityInfoPrincipalName           : 
LocalEntityInfoProtectedAt             : 
LocalEntityInfoProtectionState         : 
LocalEntityInfoRpcMonitored            : 
LocalEntityInfoRpcProtectedAt          : 
LocalEntityInfoRpcProtectionState      : 
LocalEntityInfoSource                  : 
LocalEntitySuccessor                   : 
LocalProcessesList                     : {*}
ParentId                               : 
ParentType                             : 0
PortsList                              : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
PreferredDeploymentId1                 : 
PreferredDeploymentName                : 
RemoteEntityIdsList                    : {b:12c0a8c9fe20}
RemoteEntityInfos                      : {192.168.201.254}
Ruleclass                              : 
ServicesList                           : {}
SrcUserInfos                           : {}
SrcUsersList                           : {}
State                                  : 3
StateAssetId                           : 
StateIdentityProtectAt                 : 
StateIdentityProtectionState           : 
StateIsAssetConnected                  : 
StateLastConnectedAt                   : 
StateLastDisconnectedAt                : 
StateProtectedAt                       : 
StateProtectionState                   : 
StateRpcProtectedAt                    : 
StateRpcProtectionState                : 
UpdatedAt                              : 1730109060434
UpdatedById                            : 
UpdatedByName                          : 

Action                                 : 1
ActivitiesCount                        : 0
ApprovedAt                             : 
ApprovedById                           : 
ApprovedByName                         : 
AssignedDeploymentName                 : 
ComplimentarySwitchRuleId              : 
CreatedAt                              : 1677061288789
CreatedByEmail                         : 
CreatedByEnforcementSource             : 5
CreatedById                            : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName                          : Zero Networks
CreatedByUserRole                      : 1
DeletedAt                              : 1689097393365
DeletedById                            : 
DeletedByName                          : 
Description                            : 
Direction                              : 1
ExcludedEntityInfos                    : {}
ExcludedLocalIdsList                   : {}
ExpiresAt                              : 
HealthStateHealthIssuesList            : 
HealthStateHealthStatus                : 
IPSecOpt                               : 1
Id                                     : bdcef3e8-4b00-4346-837b-46bfe8dc4b02
IdNamePairId                           : 
LocalEntityId                          : a:a:J9CCUyen
LocalEntityInfoAssetStatus             : 
LocalEntityInfoAssetType               : 
LocalEntityInfoAssignedDeploymentId    : 
LocalEntityInfoBreakGlassActivated     : 
LocalEntityInfoCloudConnectorVersion   : 
LocalEntityInfoDomain                  : 
LocalEntityInfoFqdn                    : 
LocalEntityInfoId                      : 
LocalEntityInfoIdentityProtectAt       : 
LocalEntityInfoIdentityProtectionState : 
LocalEntityInfoInactiveReason          : 
LocalEntityInfoIpv4Addresses           : 
LocalEntityInfoIpv6Addresses           : 
LocalEntityInfoLastLogon               : 
LocalEntityInfoName                    : 
LocalEntityInfoOperatingSystem         : 
LocalEntityInfoPasswordUpdateTime      : 
LocalEntityInfoPreferredDeploymentId   : 
LocalEntityInfoPrincipalName           : 
LocalEntityInfoProtectedAt             : 
LocalEntityInfoProtectionState         : 
LocalEntityInfoRpcMonitored            : 
LocalEntityInfoRpcProtectedAt          : 
LocalEntityInfoRpcProtectionState      : 
LocalEntityInfoSource                  : 
LocalEntitySuccessor                   : 
LocalProcessesList                     : {*}
ParentId                               : 
ParentType                             : 0
PortsList                              : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
PreferredDeploymentId1                 : 
PreferredDeploymentName                : 
RemoteEntityIdsList                    : {a:a:0n0gAS5K}
RemoteEntityInfos                      : {SHLUPO-LAPTOP}
Ruleclass                              : 
ServicesList                           : {}
SrcUserInfos                           : {}
SrcUsersList                           : {}
State                                  : 3
StateAssetId                           : 
StateIdentityProtectAt                 : 
StateIdentityProtectionState           : 
StateIsAssetConnected                  : 
StateLastConnectedAt                   : 
StateLastDisconnectedAt                : 
StateProtectedAt                       : 
StateProtectionState                   : 
StateRpcProtectedAt                    : 
StateRpcProtectionState                : 
UpdatedAt                              : 1689097393365
UpdatedById                            : 
UpdatedByName                          :
```

This cmdlet lists AE Inbound Exclusions.

### Example 2: Page through results
```powershell
(Get-ZNAeExclusionsInbound -Offset 20).Items
```

This cmdlet uses limit and offset to handle paging.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IAeExclusionList

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IAeExclusionRuleResponse

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

