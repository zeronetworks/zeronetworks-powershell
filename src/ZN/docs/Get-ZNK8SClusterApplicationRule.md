---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znk8sclusterapplicationrule
schema: 2.0.0
---

# Get-ZNK8SClusterApplicationRule

## SYNOPSIS
Returns a list of rules in the k8s cluster application.

## SYNTAX

```
Get-ZNK8SClusterApplicationRule -ApplicationName <String> -K8SClusterId <String> [-AccountName <String>]
 [-Filters <String>] [-IncludeGlobalRules] [-Limit <Int32>] [-Offset <Int32>] [-Order <String>]
 [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of rules in the k8s cluster application.

## EXAMPLES

### Example 1: List Rules
```powershell
$k8sCluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"}
$k8sApplication = (Get-ZNK8SClusterApplication -K8SClusterId $k8sCluster.Id).Items | where {$_.Name -eq "powershell"}
(Get-ZNK8SClusterApplicationRule -K8SClusterId $k8sCluster.Id -ApplicationName $k8sApplication.Name).Items
```

```output
Action                               : 1
ChangeTicket                         : 
ClusterId                            : k:c:K4x42qfL
CompliantAt                          : 
CreatedAt                            : 1789654528085
CreatedById                          : m:3929d40ebf7ecfe8dbce815b1c97ea93c2b2aa59
CreatedByName                        : poshtesting
DeployedAt                           : 
Description                          : 
Direction                            : 1
EnvironmentId                        : ca90ac47-3e4a-4898-baba-a1640fda83cd
ExcludedCidrDisplayNames             : 
ExcludedCidrs                        : {}
HostNamespaceId                      : k:n:n9GxlaA4
HostNamespaceName                    : powershell
Id                                   : R:k:olp31zQB
IsDeployed                           : True
IsDesired                            : False
LocalEntityApplication               : powershell
LocalEntityLabelsMap                 : 
LocalEntitySubnet                    : 
LocalEntitySubnetDisplayName         : 
LocalEntityType                      : 5
LocalPodSelectorMatchExpressionsList : {}
LocalPodSelectorMatchLabelsMap       : {app powershell}
LocalSelectors                       : {"matchLabels":{"app":"powershell"}}
NamespaceId                          : k:n:n9GxlaA4
NamespaceName                        : powershell
NetworkPolicyId                      : k:f:MYsVYitG
NetworkPolicyName                    : powershell-netpol
NetworkPolicyUid                     : 90eb6f3e-e51a-4b8c-8616-dd39f9be27cb
PolicyChangeTicket                   : 
PolicyDescription                    : 
PolicyEnforcementSource              : 
PolicyType                           : 1
Ports                                : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
RemoteEntities                       : {powershell}
RemotePeerSelectorsList              : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SPeerSelector}
RemoteSelectors                      : [{"podSelector":{}}]
Source                               : 6
UpdatedAt                            : 
UpdatedById                          : 
UpdatedByName                        : 

Action                               : 1
ChangeTicket                         : 
ClusterId                            : k:c:K4x42qfL
CompliantAt                          : 
CreatedAt                            : 1789654528085
CreatedById                          : m:3929d40ebf7ecfe8dbce815b1c97ea93c2b2aa59
CreatedByName                        : poshtesting
DeployedAt                           : 
Description                          : 
Direction                            : 2
EnvironmentId                        : ca90ac47-3e4a-4898-baba-a1640fda83cd
ExcludedCidrDisplayNames             : 
ExcludedCidrs                        : {}
HostNamespaceId                      : k:n:n9GxlaA4
HostNamespaceName                    : powershell
Id                                   : R:k:G7PQF2b2
IsDeployed                           : True
IsDesired                            : False
LocalEntityApplication               : powershell
LocalEntityLabelsMap                 : 
LocalEntitySubnet                    : 
LocalEntitySubnetDisplayName         : 
LocalEntityType                      : 5
LocalPodSelectorMatchExpressionsList : {}
LocalPodSelectorMatchLabelsMap       : {app powershell}
LocalSelectors                       : {"matchLabels":{"app":"powershell"}}
NamespaceId                          : k:n:n9GxlaA4
NamespaceName                        : powershell
NetworkPolicyId                      : k:f:MYsVYitG
NetworkPolicyName                    : powershell-netpol
NetworkPolicyUid                     : 90eb6f3e-e51a-4b8c-8616-dd39f9be27cb
PolicyChangeTicket                   : 
PolicyDescription                    : 
PolicyEnforcementSource              : 
PolicyType                           : 1
Ports                                : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem, ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
RemoteEntities                       : {}
RemotePeerSelectorsList              : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SPeerSelector}
RemoteSelectors                      : [{"namespaceSelector":{}}]
Source                               : 6
UpdatedAt                            : 
UpdatedById                          : 
UpdatedByName                        : 
```

This cmdlet lits rules for a K8s Cluster Application.

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

### -ApplicationName
application name to filter on

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
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeGlobalRules
include global rules in the result

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -K8SClusterId
cluserId to filter on

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
Parameter Sets: (All)
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
Parameter Sets: (All)
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
Parameter Sets: (All)
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
Parameter Sets: (All)
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
Parameter Sets: (All)
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SRulesList

## NOTES

## RELATED LINKS

