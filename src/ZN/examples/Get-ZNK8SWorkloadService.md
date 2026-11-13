### Example 1: List K8s workload serivces
```powershell
$k8sworkload = (Get-ZNK8SNamespaceWorkload -K8SNamespaceId $K8snamespace.id).Items | where {$_.Name -eq "powershell"}
(Get-ZNK8SWorkloadService -K8SWorkloadId $k8sworkload.Id).Items
```

```output
AnnotationsList : {}
ClusterId       : k:c:K4x42qfL
ClusterName     : rke
Id              : k:s:U8yIaDnK
IpsList         : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SServiceIP}
K8SUid          : 89951d04-eabb-417e-938e-7a5ce1be3d25
LabelsList      : {app}
Name            : powershell
NamespaceId     : k:n:n9GxlaA4
NamespaceName   : powershell
PortsList       : {}
TargetsList     : {powershell}
Type            : 1
```

This cmdlet lists K8s workload services.
