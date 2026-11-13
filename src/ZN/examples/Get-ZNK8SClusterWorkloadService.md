### Example 1: List K8s Cluster Workload Serivces
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"}
$k8sworkload = (Get-ZNK8SClusterWorkload -K8SClusterId $k8scluster.id).Items | where {$_.Name -eq "powershell"}
(Get-ZNK8SClusterWorkloadService -K8SClusterId $k8scluster.Id -K8SWorkloadId $k8sworkload.Id).Items
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

This cmdlet lits K8s Cluster workload services.
