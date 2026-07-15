### Example 1: Create K8s Ip Block
```powershell
$ipblock = New-ZNK8SIPBlock -Cidr 192.168.2.0/24 -ExceptCidrs 192.168.2.0/32 
```

```output

```

This cmdlet creates an in-memory ip block for use in a k8s desired rule.
