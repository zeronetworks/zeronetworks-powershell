### Example 1: Delete desired rules
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
Remove-ZNK8SClusterDesiredRule -K8SClusterId $k8scluster.id -RuleIds @("R:k:2lGztizb")
```

```output

```

This cmdlet deletes K8s desired rules.
