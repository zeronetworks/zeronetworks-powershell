### Example 1: Mark a rule as desired
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
Update-ZNK8SClusterDesiredRulesMarkAsDesired -K8SClusterId $k8scluster.id -RuleIds @("R:k:CcJAPVqZ")
```

```output

```

This cmdlet marks a K8s rule as desired.
