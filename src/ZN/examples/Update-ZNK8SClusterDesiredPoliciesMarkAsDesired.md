### Example 1: Mark a policy as desired
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
Update-ZNK8SClusterDesiredPoliciesMarkAsDesired -K8SClusterId $k8scluster.Id -PolicyIds @("k:f:R0xni15n")
```

```output

```

This cmdlet marks a K8s policy as desired.
