### Example 1: Update K8s network policy
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1 
$policy = (Get-ZNK8SClusterNetworkPolicy -K8SClusterId $k8scluster.id).Items | where {$_.Id -eq "k:f:rlVqIRC0"}
Update-ZNK8SClusterDesiredPolicy -K8SClusterId $k8scluster.id -PolicyId $policy.Id -name "newname"
```

```output
HostNamespaceId        : 
HostNamespaceName      : 
ItemChangeTicket       : 
ItemClusterId          : k:c:j3PDZgKj
ItemCompliantAt        : 
ItemCreatedAt          : 1783545642434
ItemCreatedById        : 1f352ed0-86f1-454f-90a5-592c197c8000
ItemCreatedByName      : Zero Networks
ItemDeployedAt         : 
ItemDescription        : 
ItemDesiredRules       : 
ItemEgressRules        : 
ItemEnforcementSource  : 5
ItemId                 : k:f:rlVqIRC0
ItemIngressRules       : 
ItemIsCompliant        : False
ItemIsDeployed         : False
ItemIsDesired          : True
ItemIsEgressPolicy     : True
ItemIsIngressPolicy    : True
ItemK8SUid             : 
ItemName               : newname
ItemRulesCount         : 0
ItemSelectorString     : {"matchLabels":{"test":"test","test2":"test2"}}
ItemType               : 0
ItemUpdatedAt          : 1789584412971
ItemUpdatedById        : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
ItemUpdatedByName      : powershell-module-development
LocalEntityApplication : 
LocalEntityLabelsMap   : 
LocalEntitySubnet      : 
LocalEntityType        : 
NamespaceId            : 
NamespaceName          : powershell
```

This cmdlet updates a K8s network policy.
