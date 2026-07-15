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
