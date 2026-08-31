### Example 1: Get K8s Desird Rule
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
Get-ZNK8SClusterDesiredRule -K8SClusterId $k8scluster.id -RuleId "R:k:d96Ctt7J"
```

```output
Action                               : 1
ChangeTicket                         : 
ClusterId                            : k:c:j3PDZgKj
CompliantAt                          : 
CreatedAt                            : 1783553003795
CreatedById                          : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName                        : Zero Networks
DeployedAt                           : 
Description                          : 
Direction                            : 1
EnvironmentId                        : ca90ac47-3e4a-4898-baba-a1640fda83cd
ExcludedCidrs                        : {}
HostNamespaceId                      : k:n:Fo58v1jn
HostNamespaceName                    : powershell
Id                                   : R:k:d96Ctt7J
IsDeployed                           : False
IsDesired                            : True
LocalEntityApplication               : 
LocalEntityLabelsMap                 : 
LocalEntitySubnet                    : 
LocalEntityType                      : 2
LocalPodSelectorMatchExpressionsList : {}
LocalPodSelectorMatchLabelsMap       : {}
LocalSelectors                       : {}
NamespaceId                          : k:n:Fo58v1jn
NamespaceName                        : powershell
NetworkPolicyId                      : k:f:rlVqIRC0
NetworkPolicyName                    : newpolicy
NetworkPolicyUid                     : 
PolicyChangeTicket                   : 
PolicyDescription                    : 
Ports                                : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
RemoteEntities                       : {}
RemotePeerSelectorsList              : {}
RemoteSelectors                      : 
Source                               : 5
UpdatedAt                            : 
UpdatedById                          : 
UpdatedByName                        : 
```

This cmdlet gets a K8s Cluster desired rule.
