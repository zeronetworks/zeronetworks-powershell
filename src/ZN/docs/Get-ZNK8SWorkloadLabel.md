---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znk8sworkloadlabel
schema: 2.0.0
---

# Get-ZNK8SWorkloadLabel

## SYNOPSIS
Returns a list of labels for the K8s workload.

## SYNTAX

```
Get-ZNK8SWorkloadLabel -K8SWorkloadId <String> [-AccountName <String>] [-Filters <String>] [-Limit <Int32>]
 [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of labels for the K8s workload.

## EXAMPLES

### Example 1: List K8s Cluster Workload labels
```powershell
$k8sCluster = (Get-ZNK8SCluster).Items[0]
$k8sNamespace = (Get-ZNK8sNamespace -limit 400).Items | Where {$_.Name -eq "socks-shop"}
(Get-ZNK8SNamespaceLabel -K8SClusterId $k8sCluster.Id -K8sNamespaceId $k8sNamespace.id).Items
```

```output
ClusterId   : k:c:osyL1WCW
ClusterName : openshift
Key         : kubernetes.io/metadata.name
Namespaces  : {socks-shop}
Nodes       : {}
Value       : socks-shop
Workloads   : {}

ClusterId   : k:c:osyL1WCW
ClusterName : openshift
Key         : name
Namespaces  : {}
Nodes       : {}
Value       : carts
Workloads   : {carts-75c4f8b949, carts}

ClusterId   : k:c:osyL1WCW
ClusterName : openshift
Key         : name
Namespaces  : {}
Nodes       : {}
Value       : carts-db
Workloads   : {carts-db, carts-db-d9b755fb6}

ClusterId   : k:c:osyL1WCW
ClusterName : openshift
Key         : name
Namespaces  : {}
Nodes       : {}
Value       : catalogue
Workloads   : {catalogue, catalogue-7c94d6d}

ClusterId   : k:c:osyL1WCW
ClusterName : openshift
Key         : name
Namespaces  : {}
Nodes       : {}
Value       : catalogue-db
Workloads   : {catalogue-db, catalogue-db-65554b764d}

ClusterId   : k:c:osyL1WCW
ClusterName : openshift
Key         : name
Namespaces  : {}
Nodes       : {}
Value       : front-end
Workloads   : {front-end-6bbf8d46c4}

ClusterId   : k:c:osyL1WCW
ClusterName : openshift
Key         : name
Namespaces  : {}
Nodes       : {}
Value       : orders
Workloads   : {orders-7f9bccc7cd, orders}

ClusterId   : k:c:osyL1WCW
ClusterName : openshift
Key         : name
Namespaces  : {}
Nodes       : {}
Value       : orders-db
Workloads   : {orders-db, orders-db-585f6dcbd8}

ClusterId   : k:c:osyL1WCW
ClusterName : openshift
Key         : name
Namespaces  : {}
Nodes       : {}
Value       : payment
Workloads   : {payment, payment-5b65cdd849}

ClusterId   : k:c:osyL1WCW
ClusterName : openshift
Key         : name
Namespaces  : {}
Nodes       : {}
Value       : queue-master
Workloads   : {queue-master-6878f6cf8d, queue-master}
```

This cmdlet lists K8s Namespace labels.

## PARAMETERS

### -AccountName
this value is per customer / partner

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Read-ZNJWTtoken $env:ZNApiKey).aud.split(".")[0]
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filters
JSON string URI encoded set of filters

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -K8SWorkloadId
id of the K8s workload

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Limit
Limit the return results

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
```

### -Offset
Used to page through results

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Order
What order to sort the results

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OrderColumns
what column to order on

```yaml
Type: System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WithCount
return count of objects

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: $true
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SLabelsList

## NOTES

## RELATED LINKS

