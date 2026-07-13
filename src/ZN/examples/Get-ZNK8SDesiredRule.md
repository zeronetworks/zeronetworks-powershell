### Example 1: Get a desired rule
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | Select-Object -First 1
Get-ZNK8SDesiredRule -K8SClusterId $k8scluster.Id -RuleId R:k:4mzKjmPs 
```

```output
HostNamespaceId                      : 
HostNamespaceName                    : 
ItemAction                           : 2
ItemChangeTicket                     : 
ItemClusterId                        : k:c:j3PDZgKj
ItemCompliantAt                      : 1782755585620
ItemCreatedAt                        : 1782291839531
ItemCreatedById                      : 1f352ed0-86f1-454f-90a5-592c197c8000
ItemCreatedByName                    : Zero Networks
ItemDeployedAt                       : 
ItemDescription                      : 
ItemDirection                        : 1
ItemEnvironmentId                    : ca90ac47-3e4a-4898-baba-a1640fda83cd
ItemExcludedCidrs                    : {}
ItemId                               : R:k:4mzKjmPs
ItemIsDeployed                       : True
ItemIsDesired                        : True
ItemLocalSelectors                   : {"matchLabels":{"app.kubernetes.io/instance":"znk8s-cloud-connector","app.kubernetes.io/name":"znk8s-cloud-
                                       connector"}}
ItemNetworkPolicyId                  : k:f:R0xni15n
ItemNetworkPolicyName                : znk8s-discovery
ItemNetworkPolicyUid                 : dd1c25a6-e892-44cc-8ed2-484050d9adad
ItemPolicyChangeTicket               : 
ItemPolicyDescription                : 
ItemPorts                            : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem}
ItemRemoteEntities                   : {}
ItemRemotePeerSelectorsList          : {}
ItemRemoteSelectors                  : 
ItemSource                           : 5
ItemUpdatedAt                        : 
ItemUpdatedById                      : 
ItemUpdatedByName                    : 
LocalEntityApplication               : 
LocalEntityLabelsMap                 : 
LocalEntitySubnet                    : 
LocalEntityType                      : 
LocalPodSelectorMatchExpressionsList : {}
LocalPodSelectorMatchLabelsMap       : {app.kubernetes.io/instance znk8s-cloud-connector, app.kubernetes.io/name znk8s-cloud-connector}
NamespaceId                          : 
NamespaceName                        : znk8s
```

This cmdlet gets a k8s desired rule.
