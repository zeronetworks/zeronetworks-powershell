---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znk8snamespacelabel
schema: 2.0.0
---

# Get-ZNK8SNamespaceLabel

## SYNOPSIS
Returns a list of labels for the K8s namespace.

## SYNTAX

```
Get-ZNK8SNamespaceLabel -K8SNamespaceId <String> [-AccountName <String>] [-Filters <String>] [-Limit <Int32>]
 [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of labels for the K8s namespace.

## EXAMPLES

### Example 1: List K8s Cluster Namespace labels
```powershell
$k8sCluster = (Get-ZNK8SCluster).Items[0]
$k8sWorkload = (Get-ZNK8SWorkload -Limit 400).Items | Where {$_.Name -eq "znk8s-visibility"}
(Get-ZNK8SWorkloadLabel -K8sWorkloadId $k8sWorkload.id).Items
```

```output
ClusterId   : k:c:osyL1WCW
ClusterName : openshift
Key         : app.kubernetes.io/component
Namespaces  : {}
Nodes       : {}
Value       : agent
Workloads   : {znk8s-visibility}

ClusterId   : k:c:osyL1WCW
ClusterName : openshift
Key         : app.kubernetes.io/instance
Namespaces  : {}
Nodes       : {}
Value       : znk8s-cloud-connector
Workloads   : {znk8s-visibility}

ClusterId   : k:c:osyL1WCW
ClusterName : openshift
Key         : app.kubernetes.io/managed-by
Namespaces  : {}
Nodes       : {}
Value       : Helm
Workloads   : {znk8s-visibility}

ClusterId   : k:c:osyL1WCW
ClusterName : openshift
Key         : app.kubernetes.io/name
Namespaces  : {}
Nodes       : {}
Value       : tetragon
Workloads   : {znk8s-visibility}

ClusterId   : k:c:osyL1WCW
ClusterName : openshift
Key         : app.kubernetes.io/part-of
Namespaces  : {}
Nodes       : {}
Value       : tetragon
Workloads   : {znk8s-visibility}

ClusterId   : k:c:osyL1WCW
ClusterName : openshift
Key         : app.kubernetes.io/version
Namespaces  : {}
Nodes       : {}
Value       : 1.4.0
Workloads   : {znk8s-visibility}

ClusterId   : k:c:osyL1WCW
ClusterName : openshift
Key         : helm.sh/chart
Namespaces  : {}
Nodes       : {}
Value       : tetragon-1.4.0
Workloads   : {znk8s-visibility}
```

This cmdlet lists K8s Workload labels.

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

### -K8SNamespaceId
id of the K8s namespace

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

