### Example 1: List K8s namespace workload serivces
```powershell
$K8snamespace = (Get-ZNK8SClusterNamespace -K8SClusterId $k8sCluster.id).Items | Where {$_.Name -eq "powershell"}
$k8sworkload = (Get-ZNK8SNamespaceWorkload -K8SNamespaceId $K8snamespace.id).Items | where {$_.Name -eq "powershell"}
(Get-ZNK8SNamespaceWorkloadService -K8SNamespaceId $K8snamespace.id -K8SWorkloadId $k8sworkload.Id).Items
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

This cmdlet lists K8s namepsace workload services.
