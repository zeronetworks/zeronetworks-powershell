### Example 1: {{ Add title here }}
```powershell
$rule = New-ZNK8SDesiredRuleBody -Action Allow -Direction Inbound -NamespaceName "powershell" -NetworkPolicyName "newpolicy"                                                                                      
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1 
New-ZNK8SClusterDesiredPolicy -K8SClusterId $k8scluster.Id -IsEgressPolicy -IsIngressPolicy -Name "wewpolicy" -NamespaceName "powershell" -DesiredRules @($rule)
```

```output
ostNamespaceId        : 
HostNamespaceName      : 
ItemChangeTicket       : 
ItemClusterId          : k:c:j3PDZgKj
ItemCompliantAt        : 
ItemCreatedAt          : 1789134512379
ItemCreatedById        : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
ItemCreatedByName      : powershell-module-development
ItemDeployedAt         : 
ItemDescription        : 
ItemDesiredRules       : 
ItemEgressRules        : 
ItemEnforcementSource  : 6
ItemId                 : k:f:E0HcKxyE
ItemIngressRules       : 
ItemIsCompliant        : False
ItemIsDeployed         : False
ItemIsDesired          : True
ItemIsEgressPolicy     : True
ItemIsIngressPolicy    : True
ItemK8SUid             : 
ItemName               : wewpolicy
ItemRulesCount         : 0
ItemSelectorString     : {}
ItemType               : 0
ItemUpdatedAt          : 
ItemUpdatedById        : 
ItemUpdatedByName      : 
LocalEntityApplication : 
LocalEntityLabelsMap   : 
LocalEntitySubnet      : 
LocalEntityType        : 
NamespaceId            : 
NamespaceName          : powershell
```

This cmdlet creates a K8s Cluster desiered network policy.
