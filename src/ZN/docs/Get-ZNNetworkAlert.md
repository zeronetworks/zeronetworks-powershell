---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znnetworkalert
schema: 2.0.0
---

# Get-ZNNetworkAlert

## SYNOPSIS
Returns a single network alert.

## SYNTAX

### List (Default)
```
Get-ZNNetworkAlert [-AccountName <String>] [-Filters <String>] [-IncludeClosed] [-Limit <Int32>]
 [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNNetworkAlert -AlertId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a single network alert.

## EXAMPLES

### Example 1: List Network alerts
```powershell
(Get-ZNNetworkAlert).Items
```

```output
AlertAlertTypeId                           : anomalous_process_behaviour.unusual_processes_initiating_smb
AlertChangeTicket                          : 
AlertComment                               : test
AlertConfidenceScore                       : 100
AlertEnvironmentId                         : 17624a57-729e-4805-9703-67947d3bd888
AlertId                                    : n:d:451JahV1
AlertOccurrences                           : 2
AlertSeverity                              : 3
AlertState                                 : 2
AlertThreatLevel                           : 2
AlertTypeCategory                          : ANOMALOUS_PROCESS_BEHAVIOUR
AlertTypeDescription                       : We have identified non standard processes using sensetive ports. We suggest you investigate the asset for malicious activity.
AlertTypeName                              : Unusual processes initiating SMB
AlertTypeReferencesList                    : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.AlertTypeReference, ZeroNetworks.PowerShell.Cmdlets.Api.Models.AlertTypeReference}
AlertUserAlertClassification               : 0
AlertUserAlertClassificationCategory       : 0
AssignedDeploymentName                     : 
AssigneeId                                 : 
AssigneeName                               : 
AwResourceInfoAccountId                    : 
AwResourceInfoAwsArn                       : 
AwResourceInfoCreatedAt                    : 
AwResourceInfoRegion                       : 
AwResourceInfoUpdatedAt                    : 
AzureResourceInfoResourceGroupId           : 
AzureResourceInfoResourceGroupName         : 
AzureResourceInfoSubscriptionId            : 
AzureResourceInfoSubscriptionName          : 
AzureResourceInfoTenantId                  : 
AzureResourceInfoTenantName                : 
ClosedTimeNanos                            : 
ClosedTimeSeconds                          : 
CreatedAtNanos                             : 596818000
CreatedAtSeconds                           : 1788537625
DeploymentClusterId                        : 
DeploymentClusterName                      : 
EnvironmentGroupId                         : 
EnvironmentGroupName                       : 
FirstSeenNanos                             : 0
FirstSeenSeconds                           : 1788533745
HealthStateHealthIssuesList                : {}
HealthStateHealthStatus                    : 1
Id                                         : anomalous_process_behaviour.unusual_processes_initiating_smb
IdNamePairId                               : 
InvolvedEntities                           : {}
LastSeenNanos                              : 0
LastSeenSeconds                            : 1789127428
MainEntityAssetStatus                      : 7
MainEntityAssetType                        : 1
MainEntityAssignedDeploymentId             : 
MainEntityBreakGlassActivated              : False
MainEntityCloudConnectorVersion            : 
MainEntityDeploymentaClusterId             : 
MainEntityDeploymentsClusterSource         : 6
MainEntityDomain                           : JAMF
MainEntityEnforcementMethod                : 5
MainEntityExternalDeviceId                 : 
MainEntityFqdn                             : Tony’s MacBook Pro
MainEntityHasDns                           : True
MainEntityHasRunningPerfSensitiveProcess   : False
MainEntityIPSpace                          : 0
MainEntityId                               : a:j:UhEwEH1Q
MainEntityIdentityProtectAt                : 
MainEntityIdentityProtectedAt              : 
MainEntityIdentityProtectionState          : 1
MainEntityInactiveReason                   : 3
MainEntityInactiveSince                    : 
MainEntityIpv4Addresses                    : {}
MainEntityIpv6Addresses                    : {}
MainEntityIsIPSecConfigured                : False
MainEntityIsQuarantined                    : False
MainEntityLabels                           : {Business Unit, Department, Site}
MainEntityLastLogon                        : 
MainEntityLinuxFirewallLogger              : 0
MainEntityLinuxProfileId                   : 
MainEntityManufacturer                     : 
MainEntityMonitoringStatus                 : 1
MainEntityName                             : Tony’s MacBook Pro
MainEntityOSType                           : 4
MainEntityOperatingSystem                  : 
MainEntityOtLocattionInterfaceName         : 
MainEntityOtLocattionName                  : 
MainEntityOtLocattionSwitchId              : 
MainEntityOutboundExternalRestrictionState : 1
MainEntityOutboundInternalRestrictionState : 1
MainEntityOutboundRestriction              : 1
MainEntityPasswordUpdateTime               : 
MainEntityPortsExposure                    : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortExposure}
MainEntityPreferredDeploymentId            : 
MainEntityPrincipalName                    : 
MainEntityProtectAt                        : 
MainEntityProtectedAt                      : 1787066658292
MainEntityProtectionState                  : 3
MainEntityPurdueLevel                      : 0
MainEntityRiskScore                        : 0
MainEntityRpcMonitored                     : False
MainEntityRpcProtectAt                     : 
MainEntityRpcProtectedAt                   : 
MainEntityRpcProtectionState               : 1
MainEntitySource                           : 14
MainEntitySwitchLocationOverridden         : False
PreferredDeploymentId1                     : 
PreferredDeploymentName                    : 
StateAssetId                               : a:j:UhEwEH1Q
StateIdentityProtectAt                     : 
StateIdentityProtectedAt                   : 
StateIdentityProtectionState               : 1
StateIsAssetConnected                      : False
StateLastConnectedAt                       : 
StateLastDisconnectedAt                    : 1789153748160
StateProtectAt                             : 
StateProtectedAt                           : 1787066658292
StateProtectionState                       : 3
StateRpcProtectAt                          : 
StateRpcProtectedAt                        : 
StateRpcProtectionState                    : 1
UpdatedAtNanos                             : 454279000
UpdatedAtSeconds                           : 1788986986
UpdatedById                                : 1f352ed0-86f1-454f-90a5-592c197c8000
UpdatedByName                              : Zero Networks

AlertAlertTypeId                           : anomalous_runtime.privileged_network_activity_from_appdata
AlertChangeTicket                          : 
AlertComment                               : 
AlertConfidenceScore                       : 100
AlertEnvironmentId                         : 17624a57-729e-4805-9703-67947d3bd888
AlertId                                    : n:d:3wliqJhH
AlertOccurrences                           : 2
AlertSeverity                              : 2
AlertState                                 : 1
AlertThreatLevel                           : 2
AlertTypeCategory                          : ANOMALOUS_RUNTIME
AlertTypeDescription                       : We have identified  processes running from non standard paths. We suggest you investigate the asset for malicious activity.
AlertTypeName                              : Privileged network activity from AppData
AlertTypeReferencesList                    : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.AlertTypeReference, ZeroNetworks.PowerShell.Cmdlets.Api.Models.AlertTypeReference}
AlertUserAlertClassification               : 0
AlertUserAlertClassificationCategory       : 0
AssignedDeploymentName                     : 
AssigneeId                                 : 
AssigneeName                               : 
AwResourceInfoAccountId                    : 
AwResourceInfoAwsArn                       : 
AwResourceInfoCreatedAt                    : 
AwResourceInfoRegion                       : 
AwResourceInfoUpdatedAt                    : 
AzureResourceInfoResourceGroupId           : 
AzureResourceInfoResourceGroupName         : 
AzureResourceInfoSubscriptionId            : 
AzureResourceInfoSubscriptionName          : 
AzureResourceInfoTenantId                  : 
AzureResourceInfoTenantName                : 
ClosedTimeNanos                            : 
ClosedTimeSeconds                          : 
CreatedAtNanos                             : 92250000
CreatedAtSeconds                           : 1786032014
DeploymentClusterId                        : 
DeploymentClusterName                      : 
EnvironmentGroupId                         : 
EnvironmentGroupName                       : 
FirstSeenNanos                             : 0
FirstSeenSeconds                           : 1786020261
HealthStateHealthIssuesList                : {}
HealthStateHealthStatus                    : 1
Id                                         : anomalous_runtime.privileged_network_activity_from_appdata
IdNamePairId                               : 
InvolvedEntities                           : {}
LastSeenNanos                              : 0
LastSeenSeconds                            : 1787744627
MainEntityAssetStatus                      : 7
MainEntityAssetType                        : 1
MainEntityAssignedDeploymentId             : 
MainEntityBreakGlassActivated              : False
MainEntityCloudConnectorVersion            : 
MainEntityDeploymentaClusterId             : 
MainEntityDeploymentsClusterSource         : 6
MainEntityDomain                           : Entra ID (Azure AD)
MainEntityEnforcementMethod                : 3
MainEntityExternalDeviceId                 : 
MainEntityFqdn                             : ILZERO-PF4VPVTF
MainEntityHasDns                           : True
MainEntityHasRunningPerfSensitiveProcess   : False
MainEntityIPSpace                          : 0
MainEntityId                               : a:d:QInC9gIm
MainEntityIdentityProtectAt                : 
MainEntityIdentityProtectedAt              : 
MainEntityIdentityProtectionState          : 1
MainEntityInactiveReason                   : 3
MainEntityInactiveSince                    : 
MainEntityIpv4Addresses                    : {}
MainEntityIpv6Addresses                    : {}
MainEntityIsIPSecConfigured                : False
MainEntityIsQuarantined                    : False
MainEntityLabels                           : {Business Unit, Department, Site}
MainEntityLastLogon                        : 
MainEntityLinuxFirewallLogger              : 0
MainEntityLinuxProfileId                   : 
MainEntityManufacturer                     : 
MainEntityMonitoringStatus                 : 1
MainEntityName                             : ILZERO-PF4VPVTF
MainEntityOSType                           : 2
MainEntityOperatingSystem                  : Windows 10.0.26200.9106
MainEntityOtLocattionInterfaceName         : 
MainEntityOtLocattionName                  : 
MainEntityOtLocattionSwitchId              : 
MainEntityOutboundExternalRestrictionState : 1
MainEntityOutboundInternalRestrictionState : 1
MainEntityOutboundRestriction              : 1
MainEntityPasswordUpdateTime               : 
MainEntityPortsExposure                    : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortExposure, ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortExposure, ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortExposure, ZeroNetworks.PowerShell.Cmdlets.Ap
                                             i.Models.PortExposure}
MainEntityPreferredDeploymentId            : 
MainEntityPrincipalName                    : 
MainEntityProtectAt                        : 
MainEntityProtectedAt                      : 1749649243620
MainEntityProtectionState                  : 3
MainEntityPurdueLevel                      : 0
MainEntityRiskScore                        : 1
MainEntityRpcMonitored                     : False
MainEntityRpcProtectAt                     : 
MainEntityRpcProtectedAt                   : 
MainEntityRpcProtectionState               : 1
MainEntitySource                           : 9
MainEntitySwitchLocationOverridden         : False
PreferredDeploymentId1                     : 
PreferredDeploymentName                    : 
StateAssetId                               : a:d:QInC9gIm
StateIdentityProtectAt                     : 
StateIdentityProtectedAt                   : 
StateIdentityProtectionState               : 1
StateIsAssetConnected                      : False
StateLastConnectedAt                       : 
StateLastDisconnectedAt                    : 1789137239828
StateProtectAt                             : 
StateProtectedAt                           : 1749649243620
StateProtectionState                       : 3
StateRpcProtectAt                          : 
StateRpcProtectedAt                        : 
StateRpcProtectionState                    : 1
UpdatedAtNanos                             : 
UpdatedAtSeconds                           : 
UpdatedById                                : 
UpdatedByName                              : 
```

This cmdlet lits network alerts.

### Example 2: Get an alert
```powershell
Get-ZNNetworkAlert -AlertId n:d:3wliqJhH
```

```output
AlertAlertTypeId                           : anomalous_runtime.privileged_network_activity_from_appdata
AlertChangeTicket                          : 
AlertComment                               : 
AlertConfidenceScore                       : 100
AlertEnvironmentId                         : 17624a57-729e-4805-9703-67947d3bd888
AlertId                                    : n:d:3wliqJhH
AlertOccurrences                           : 2
AlertSeverity                              : 2
AlertState                                 : 1
AlertThreatLevel                           : 2
AlertTypeCategory                          : ANOMALOUS_RUNTIME
AlertTypeDescription                       : We have identified  processes running from non standard paths. We suggest you investigate the asset for malicious activity.
AlertTypeName                              : Privileged network activity from AppData
AlertTypeReferencesList                    : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.AlertTypeReference, ZeroNetworks.PowerShell.Cmdlets.Api.Models.AlertTypeReference}
AlertUserAlertClassification               : 0
AlertUserAlertClassificationCategory       : 0
AssignedDeploymentName                     : 
AssigneeId                                 : 
AssigneeName                               : 
AwResourceInfoAccountId                    : 
AwResourceInfoAwsArn                       : 
AwResourceInfoCreatedAt                    : 
AwResourceInfoRegion                       : 
AwResourceInfoUpdatedAt                    : 
AzureResourceInfoResourceGroupId           : 
AzureResourceInfoResourceGroupName         : 
AzureResourceInfoSubscriptionId            : 
AzureResourceInfoSubscriptionName          : 
AzureResourceInfoTenantId                  : 
AzureResourceInfoTenantName                : 
ClosedTimeNanos                            : 
ClosedTimeSeconds                          : 
CreatedAtNanos                             : 92250000
CreatedAtSeconds                           : 1786032014
DeploymentClusterId                        : 
DeploymentClusterName                      : 
EnvironmentGroupId                         : 
EnvironmentGroupName                       : 
FirstSeenNanos                             : 0
FirstSeenSeconds                           : 1786020261
HealthStateHealthIssuesList                : {}
HealthStateHealthStatus                    : 1
Id                                         : anomalous_runtime.privileged_network_activity_from_appdata
IdNamePairId                               : 
InvolvedEntities                           : {}
LastSeenNanos                              : 0
LastSeenSeconds                            : 1787744627
MainEntityAssetStatus                      : 7
MainEntityAssetType                        : 1
MainEntityAssignedDeploymentId             : 
MainEntityBreakGlassActivated              : False
MainEntityCloudConnectorVersion            : 
MainEntityDeploymentaClusterId             : 
MainEntityDeploymentsClusterSource         : 6
MainEntityDomain                           : Entra ID (Azure AD)
MainEntityEnforcementMethod                : 3
MainEntityExternalDeviceId                 : 
MainEntityFqdn                             : ILZERO-PF4VPVTF
MainEntityHasDns                           : True
MainEntityHasRunningPerfSensitiveProcess   : False
MainEntityIPSpace                          : 0
MainEntityId                               : a:d:QInC9gIm
MainEntityIdentityProtectAt                : 
MainEntityIdentityProtectedAt              : 
MainEntityIdentityProtectionState          : 1
MainEntityInactiveReason                   : 3
MainEntityInactiveSince                    : 
MainEntityIpv4Addresses                    : {}
MainEntityIpv6Addresses                    : {}
MainEntityIsIPSecConfigured                : False
MainEntityIsQuarantined                    : False
MainEntityLabels                           : {Business Unit, Department, Site}
MainEntityLastLogon                        : 
MainEntityLinuxFirewallLogger              : 0
MainEntityLinuxProfileId                   : 
MainEntityManufacturer                     : 
MainEntityMonitoringStatus                 : 1
MainEntityName                             : ILZERO-PF4VPVTF
MainEntityOSType                           : 2
MainEntityOperatingSystem                  : Windows 10.0.26200.9106
MainEntityOtLocattionInterfaceName         : 
MainEntityOtLocattionName                  : 
MainEntityOtLocattionSwitchId              : 
MainEntityOutboundExternalRestrictionState : 1
MainEntityOutboundInternalRestrictionState : 1
MainEntityOutboundRestriction              : 1
MainEntityPasswordUpdateTime               : 
MainEntityPortsExposure                    : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortExposure, ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortExposure, ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortExposure, ZeroNetworks.PowerShell.Cmdlets.Ap
                                             i.Models.PortExposure}
MainEntityPreferredDeploymentId            : 
MainEntityPrincipalName                    : 
MainEntityProtectAt                        : 
MainEntityProtectedAt                      : 1749649243620
MainEntityProtectionState                  : 3
MainEntityPurdueLevel                      : 0
MainEntityRiskScore                        : 1
MainEntityRpcMonitored                     : False
MainEntityRpcProtectAt                     : 
MainEntityRpcProtectedAt                   : 
MainEntityRpcProtectionState               : 1
MainEntitySource                           : 9
MainEntitySwitchLocationOverridden         : False
PreferredDeploymentId1                     : 
PreferredDeploymentName                    : 
StateAssetId                               : a:d:QInC9gIm
StateIdentityProtectAt                     : 
StateIdentityProtectedAt                   : 
StateIdentityProtectionState               : 1
StateIsAssetConnected                      : False
StateLastConnectedAt                       : 
StateLastDisconnectedAt                    : 1789137239828
StateProtectAt                             : 
StateProtectedAt                           : 1749649243620
StateProtectionState                       : 3
StateRpcProtectAt                          : 
StateRpcProtectedAt                        : 
StateRpcProtectionState                    : 1
UpdatedAtNanos                             : 
UpdatedAtSeconds                           : 
UpdatedById                                : 
UpdatedByName                              : 
```

This cmdlet gets a network alert by id.

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

### -AlertId
The id of the network alert

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

### -IncludeClosed
Include closed alerts in the results

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.INetworkAlertsList

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.INetworkAlertView

## NOTES

## RELATED LINKS

