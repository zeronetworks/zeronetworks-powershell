---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znaeexclusionsoutbound
schema: 2.0.0
---

# Get-ZNAeExclusionsOutbound

## SYNOPSIS
Returns the properties of the get AE exclusion.

## SYNTAX

### List (Default)
```
Get-ZNAeExclusionsOutbound [-AccountName <String>] [-AddAncestors] [-AddBuiltins] [-EnrichRemoteIps]
 [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>]
 [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNAeExclusionsOutbound -RuleId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the properties of the get AE exclusion.

## EXAMPLES

### Example 1: List AE Inbound Exclusions
```powershell
(Get-ZNAeExclusionsOutbound).Items
```

```output
Action                                 : 1
ActivitiesCount                        : 1
ApprovedAt                             : 
ApprovedById                           : 
ApprovedByName                         : 
AssignedDeploymentName                 : 
ComplimentarySwitchRuleId              : 
CreatedAt                              : 1728312799011
CreatedByEmail                         : 
CreatedByEnforcementSource             : 5
CreatedById                            : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName                          : Zero Networks
CreatedByUserRole                      : 1
DeletedAt                              : 1728313676837
DeletedById                            : 1f352ed0-86f1-454f-90a5-592c197c8000
DeletedByName                          : Zero Networks
Description                            : 
Direction                              : 2
ExcludedEntityInfos                    : {}
ExcludedLocalIdsList                   : {}
ExpiresAt                              : 
HealthStateHealthIssuesList            : 
HealthStateHealthStatus                : 
IPSecOpt                               : 1
Id                                     : e4beaac0-2f57-44f0-85a3-fe7dd6371322
IdNamePairId                           : 
LocalEntityId                          : a:a:5pBO4Cfn
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
LocalProcessesList                     : {C:\program 
                                         files\google\chrome\application\chrome.exe}
ParentId                               : 
ParentType                             : 0
PortsList                              : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.P
                                         ortsListItem}
PreferredDeploymentId1                 : 
PreferredDeploymentName                : 
RemoteEntityIdsList                    : {b:17www.google.com}
RemoteEntityInfos                      : {www.google.com}
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
UpdatedAt                              : 1728313676825
UpdatedById                            : 1f352ed0-86f1-454f-90a5-592c197c8000
UpdatedByName                          : Zero Networks

Action                                 : 1
ActivitiesCount                        : 1
ApprovedAt                             : 
ApprovedById                           : 
ApprovedByName                         : 
AssignedDeploymentName                 : 
ComplimentarySwitchRuleId              : 
CreatedAt                              : 1728313398214
CreatedByEmail                         : 
CreatedByEnforcementSource             : 5
CreatedById                            : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName                          : Zero Networks
CreatedByUserRole                      : 1
DeletedAt                              : 1728313673944
DeletedById                            : 1f352ed0-86f1-454f-90a5-592c197c8000
DeletedByName                          : Zero Networks
Description                            : Created from activity
Direction                              : 2
ExcludedEntityInfos                    : {}
ExcludedLocalIdsList                   : {}
ExpiresAt                              : 
HealthStateHealthIssuesList            : 
HealthStateHealthStatus                : 
IPSecOpt                               : 1
Id                                     : deb6fa76-6930-44ce-b393-b1083086716d
IdNamePairId                           : 
LocalEntityId                          : a:a:5pBO4Cfn
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
LocalProcessesList                     : {C:\program 
                                         files\google\chrome\application\chrome.exe}
ParentId                               : 
ParentType                             : 0
PortsList                              : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.P
                                         ortsListItem}
PreferredDeploymentId1                 : 
PreferredDeploymentName                : 
RemoteEntityIdsList                    : {b:128efa4b2420, b:17www.wigleven.com}
RemoteEntityInfos                      : {142.250.75.36, www.wigleven.com}
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
UpdatedAt                              : 1728313673932
UpdatedById                            : 
UpdatedByName                          : 
```

This cmdlet lists AE Outbound Exclusions.

### Example 2: Page through results
```powershell
(Get-ZNAeExclusionsOutbound -Offset 20).Items
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

