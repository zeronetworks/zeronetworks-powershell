### Example 1: Update K8s desired rule
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
Update-ZNK8SClusterDesiredRule -K8SClusterId $k8scluster.Id -RuleId "R:k:d96Ctt7J" -Description "NewDescription"
```

```output
ostNamespaceId                      : 
HostNamespaceName                    : 
ItemAction                           : 1
ItemChangeTicket                     : 
ItemClusterId                        : k:c:j3PDZgKj
ItemCompliantAt                      : 
ItemCreatedAt                        : 1783553003795
ItemCreatedById                      : 1f352ed0-86f1-454f-90a5-592c197c8000
ItemCreatedByName                    : Zero Networks
ItemDeployedAt                       : 
ItemDescription                      : NewDescription
ItemDirection                        : 1
ItemEnvironmentId                    : ca90ac47-3e4a-4898-baba-a1640fda83cd
ItemExcludedCidrs                    : {}
ItemId                               : R:k:d96Ctt7J
ItemIsDeployed                       : False
ItemIsDesired                        : True
ItemLocalSelectors                   : {}
ItemNetworkPolicyId                  : k:f:rlVqIRC0
ItemNetworkPolicyName                : newpolicy
ItemNetworkPolicyUid                 : 
ItemPolicyChangeTicket               : 
ItemPolicyDescription                : 
ItemPorts                            : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
ItemRemoteEntities                   : {}
ItemRemotePeerSelectorsList          : {}
ItemRemoteSelectors                  : 
ItemSource                           : 5
ItemUpdatedAt                        : 1788184333785
ItemUpdatedById                      : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
ItemUpdatedByName                    : powershell-module-development
LocalEntityApplication               : 
LocalEntityLabelsMap                 : 
LocalEntitySubnet                    : 
LocalEntityType                      : 
LocalPodSelectorMatchExpressionsList : {}
LocalPodSelectorMatchLabelsMap       : {}
NamespaceId                          : 
NamespaceName                        : powershell
```

This cmdlet updates a K8s desired rule.
