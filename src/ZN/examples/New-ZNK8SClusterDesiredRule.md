### Example 1: Create K8s Desired rule
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
New-ZNK8SDesiredRule -Action 1 -NetworkPolicyName newpolicy -namespacename powershell -K8SClusterId k8scluster.id -NetworkPolicyId k:f:rlVqIRC0 -Direction 1
```

```output
HostNamespaceId                      : 
HostNamespaceName                    : 
ItemAction                           : 1
ItemChangeTicket                     : 
ItemClusterId                        : k:c:j3PDZgKj
ItemCompliantAt                      : 
ItemCreatedAt                        : 
ItemCreatedById                      : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
ItemCreatedByName                    : powershell-module-development
ItemDeployedAt                       : 
ItemDescription                      : 
ItemDirection                        : 1
ItemEnvironmentId                    : ca90ac47-3e4a-4898-baba-a1640fda83cd
ItemExcludedCidrs                    : {}
ItemId                               : R:k:2lGztizb
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
ItemSource                           : 6
ItemUpdatedAt                        : 
ItemUpdatedById                      : 
ItemUpdatedByName                    : 
LocalEntityApplication               : 
LocalEntityLabelsMap                 : 
LocalEntitySubnet                    : 
LocalEntityType                      : 
LocalPodSelectorMatchExpressionsList : {}
LocalPodSelectorMatchLabelsMap       : {}
NamespaceId                          : 
NamespaceName                        : powershell
```

This cmdlet creates a K8s desired rule.
