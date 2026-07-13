---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znk8sclusterlabelrule
schema: 2.0.0
---

# Get-ZNK8SClusterLabelRule

## SYNOPSIS
Returns a list of rules in the k8s cluster label.

## SYNTAX

```
Get-ZNK8SClusterLabelRule -K8SClusterId <String> -Label <String> [-AccountName <String>] [-Filters <String>]
 [-IncludeGlobalRules] [-Limit <Int32>] [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>]
 [-WithCount] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of rules in the k8s cluster label.

## EXAMPLES

### Example 1: List rules
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | Select-Object -First 1
$k8slabel = (Get-ZNK8SClusterLabel -K8SClusterId $k8scluster.id -Limit 400).Items | where {$_.Value -eq "znk8s-cloud-connector"} | select -First 1
(Get-ZNK8SClusterLabelRule -K8SClusterId $k8scluster.Id -Label $($k8slabel.Key+":"+$k8slabel.Value).ToString() -IncludeGlobalRules ).Items
```

```output
Action                               : 2
ChangeTicket                         : 
ClusterId                            : k:c:j3PDZgKj
CompliantAt                          : 
CreatedAt                            : 1782291839531
CreatedById                          : 
CreatedByName                        : 
DeployedAt                           : 
Description                          : 
Direction                            : 1
EnvironmentId                        : ca90ac47-3e4a-4898-baba-a1640fda83cd
ExcludedCidrs                        : {}
HostNamespaceId                      : k:n:T1HDuHDF
HostNamespaceName                    : znk8s
Id                                   : R:k:4mzKjmPs
IsDeployed                           : True
IsDesired                            : False
LocalEntityApplication               : 
LocalEntityLabelsMap                 : 
LocalEntitySubnet                    : 
LocalEntityType                      : 7
LocalPodSelectorMatchExpressionsList : {}
LocalPodSelectorMatchLabelsMap       : {app.kubernetes.io/instance znk8s-cloud-connector, app.kubernetes.io/name znk8s-cloud-connector}
LocalSelectors                       : {"matchLabels":{"app.kubernetes.io/instance":"znk8s-cloud-connector","app.kubernetes.io/name":"znk8s-cloud-
                                       connector"}}
NamespaceId                          : k:n:T1HDuHDF
NamespaceName                        : znk8s
NetworkPolicyId                      : k:f:R0xni15n
NetworkPolicyName                    : znk8s-discovery
NetworkPolicyUid                     : dd1c25a6-e892-44cc-8ed2-484050d9adad
PolicyChangeTicket                   : 
PolicyDescription                    : 
Ports                                : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
RemoteEntities                       : {}
RemotePeerSelectorsList              : {}
RemoteSelectors                      : 
Source                               : 13
UpdatedAt                            : 
UpdatedById                          : 
UpdatedByName                        : 

Action                               : 1
ChangeTicket                         : 
ClusterId                            : k:c:j3PDZgKj
CompliantAt                          : 
CreatedAt                            : 1782291839531
CreatedById                          : 
CreatedByName                        : 
DeployedAt                           : 
Description                          : 
Direction                            : 2
EnvironmentId                        : ca90ac47-3e4a-4898-baba-a1640fda83cd
ExcludedCidrs                        : {}
HostNamespaceId                      : k:n:T1HDuHDF
HostNamespaceName                    : znk8s
Id                                   : R:k:5tzie90L
IsDeployed                           : True
IsDesired                            : False
LocalEntityApplication               : 
LocalEntityLabelsMap                 : 
LocalEntitySubnet                    : 
LocalEntityType                      : 7
LocalPodSelectorMatchExpressionsList : {}
LocalPodSelectorMatchLabelsMap       : {app.kubernetes.io/instance znk8s-cloud-connector, app.kubernetes.io/name znk8s-cloud-connector}
LocalSelectors                       : {"matchLabels":{"app.kubernetes.io/instance":"znk8s-cloud-connector","app.kubernetes.io/name":"znk8s-cloud-
                                       connector"}}
NamespaceId                          : k:n:T1HDuHDF
NamespaceName                        : znk8s
NetworkPolicyId                      : k:f:R0xni15n
NetworkPolicyName                    : znk8s-discovery
NetworkPolicyUid                     : dd1c25a6-e892-44cc-8ed2-484050d9adad
PolicyChangeTicket                   : 
PolicyDescription                    : 
Ports                                : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
RemoteEntities                       : {}
RemotePeerSelectorsList              : {}
RemoteSelectors                      : 
Source                               : 13
UpdatedAt                            : 
UpdatedById                          : 
UpdatedByName                        :
```

This cmdlet lists rules for a K8s cluster label.

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

### -Label
id of the K8s namespace

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

