### Example 1: List namespace labels
```powershell
$k8sCluster = (Get-ZNK8SCluster).Items | Select-Object -First 1 
$k8snamespace = ((Get-ZNK8SClusterNamespace -K8SClusterId $k8sCluster.Id -Limit 400).Items | where {$_.Name -eq "tcp-demo"})
$k8sworkload = ((Get-ZNK8SClusterWorkload -K8SClusterId $k8sCluster.Id -Limit 400).Items | where {$_.Name -eq "tcp-client"})
(Get-ZNK8SNamespaceWorkloadLabel -K8SNamespaceId $k8snamespace.id -K8SWorkloadId $k8sworkload.Id).Items
```

```output
ClusterId   : k:c:ASHpu3tF
ClusterName : openshift
Key         : app
Namespaces  : {}
Nodes       : {}
Value       : tcp-client
Workloads   : {tcp-client}
```

This cmdlet lists the labels for a K8s namespace workload.