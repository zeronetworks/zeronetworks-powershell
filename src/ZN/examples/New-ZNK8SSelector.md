### Example 1: Create K8s selector
```powershell
$k8sNSseleector = New-ZNK8SSelector -MatchLabels @{"key"="value"}
```

```output

```

This cmdlet creates an in-memory selector for use in a k8s desired rule.
