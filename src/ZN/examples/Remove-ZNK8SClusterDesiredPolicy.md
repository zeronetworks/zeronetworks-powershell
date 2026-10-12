### Example 1: Delete a k8s cluster desired policy
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
Remove-ZNK8SClusterDesiredPolicy -K8SClusterId $k8scluster.id -PolicyIds @("k:f:bshj47aH")
```

```output

```

This cmdlet deletes a K8s cluster desired policy.
