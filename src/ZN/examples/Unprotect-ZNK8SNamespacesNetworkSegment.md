### Example 1: Disable network segementation for a k8s namespace
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1 
$k8snamespace = (Get-ZNK8SClusterNamespace -K8SClusterId $k8scluster.id -Limit 400).Items | where {$_.Name -eq "powershell"}
Unprotect-ZNK8SNamespacesNetworkSegment -NamespaceIds @($k8snamespace.id)
```

```output

```

This cmdlet disables network segmentation for a K8s namespace.
