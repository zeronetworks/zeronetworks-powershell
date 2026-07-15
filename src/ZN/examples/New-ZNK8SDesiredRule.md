### Example 1: Create k8s desired rule
```powershell
New-ZNK8SDesiredRule -Action 1 -NetworkPolicyName newpolicy -namespacename powershell -K8SClusterId "k:c:j3PDZgKj" -NetworkPolicyId k:f:rlVqIRC0 -Direction 1
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
ItemId                               : R:k:XDJiV5Wn
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

This cmdlet creats a K8s desired rule.
