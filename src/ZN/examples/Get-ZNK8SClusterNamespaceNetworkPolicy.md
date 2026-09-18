### Example 1: List K8s cluster namespace policies
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
$k8snamespace = (Get-ZNK8SClusterNamespace -K8SClusterId $k8scluster.id -Limit 400).Items | where {$_.Name -eq "powershell"}
(Get-ZNK8SClusterNamespaceNetworkPolicy -K8SClusterId $k8scluster.id -K8SNamespaceId $k8snamespace.Id).Items
```

```output
ChangeTicket           : 
ClusterId              : k:c:j3PDZgKj
CompliantAt            : 
CreatedAt              : 1789130483411
CreatedById            : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName          : Zero Networks
DeployedAt             : 
Description            : 
DesiredRules           : 
EgressRules            : 
EnforcementSource      : 5
HostNamespaceId        : k:n:Fo58v1jn
HostNamespaceName      : powershell
Id                     : k:f:7x4XkLwb
IngressRules           : 
IsCompliant            : False
IsDeployed             : False
IsDesired              : True
IsEgressPolicy         : True
IsIngressPolicy        : False
K8SUid                 : 
LocalEntityApplication : 
LocalEntityLabelsMap   : 
LocalEntitySubnet      : 
LocalEntityType        : 2
Name                   : testpolicy
NamespaceId            : k:n:Fo58v1jn
NamespaceName          : powershell
RulesCount             : 1
SelectorString         : {}
Type                   : 1
UpdatedAt              : 
UpdatedById            : 
UpdatedByName          : 

ChangeTicket           : 
ClusterId              : k:c:j3PDZgKj
CompliantAt            : 
CreatedAt              : 1789130942415
CreatedById            : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName          : Zero Networks
DeployedAt             : 
Description            : 
DesiredRules           : 
EgressRules            : 
EnforcementSource      : 5
HostNamespaceId        : k:n:Fo58v1jn
HostNamespaceName      : powershell
Id                     : k:f:bshj47aH
IngressRules           : 
IsCompliant            : False
IsDeployed             : False
IsDesired              : True
IsEgressPolicy         : True
IsIngressPolicy        : True
K8SUid                 : 
LocalEntityApplication : powershell
LocalEntityLabelsMap   : 
LocalEntitySubnet      : 
LocalEntityType        : 5
Name                   : testpolicy2
NamespaceId            : k:n:Fo58v1jn
NamespaceName          : powershell
RulesCount             : 2
SelectorString         : {"matchLabels": {"app": "powershell"}}
Type                   : 1
UpdatedAt              : 1789142702932
UpdatedById            : 1f352ed0-86f1-454f-90a5-592c197c8000
UpdatedByName          : Zero Networks

ChangeTicket           : 
ClusterId              : k:c:j3PDZgKj
CompliantAt            : 
CreatedAt              : 1789134512379
CreatedById            : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
CreatedByName          : powershell-module-development
DeployedAt             : 
Description            : 
DesiredRules           : 
EgressRules            : 
EnforcementSource      : 6
HostNamespaceId        : k:n:Fo58v1jn
HostNamespaceName      : powershell
Id                     : k:f:E0HcKxyE
IngressRules           : 
IsCompliant            : False
IsDeployed             : False
IsDesired              : True
IsEgressPolicy         : True
IsIngressPolicy        : True
K8SUid                 : 
LocalEntityApplication : 
LocalEntityLabelsMap   : 
LocalEntitySubnet      : 
LocalEntityType        : 2
Name                   : wewpolicy
NamespaceId            : k:n:Fo58v1jn
NamespaceName          : powershell
RulesCount             : 1
SelectorString         : {}
Type                   : 1
UpdatedAt              : 
UpdatedById            : 
UpdatedByName          : 
```

This cmdlet lists K8s cluster namespace network policies.
