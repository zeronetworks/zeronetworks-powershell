### Example 1: Create k8s desired rule in memory
```powershell
$rule = New-ZNK8SDesiredRuleBody -Action Allow -Direction Inbound -NamespaceName "powershell" -NetworkPolicyName "newpolicy"
```

```output

```

This cmdlet creates a k8s desired rule in memory for use with new desired policy.
