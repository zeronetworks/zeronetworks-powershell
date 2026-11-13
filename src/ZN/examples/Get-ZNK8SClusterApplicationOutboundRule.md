### Example 1: List Rules
```powershell
$k8sCluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"}
$k8sApplication = (Get-ZNK8SClusterApplication -K8SClusterId $k8sCluster.Id).Items | where {$_.Name -eq "powershell"}
(Get-ZNK8SClusterApplicationOutboundRule -K8SClusterId $k8sCluster.Id -ApplicationName $k8sApplication.Name).Items
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
