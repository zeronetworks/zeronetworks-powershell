---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znk8snamespaceworkloadlabel
schema: 2.0.0
---

# Get-ZNK8SNamespaceWorkloadLabel

## SYNOPSIS
Returns a list of labels for the K8s namespace workload.

## SYNTAX

```
Get-ZNK8SNamespaceWorkloadLabel -K8SNamespaceId <String> -K8SWorkloadId <String> [-AccountName <String>]
 [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>]
 [-WithCount] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of labels for the K8s namespace workload.

## EXAMPLES

### Example 1: {{ Add title here }}
```powershell
$k8sCluster = (Get-ZNK8SCluster).Items | Select-Object -First 1 
$k8snamespace = ((Get-ZNK8SClusterNamespace -K8SClusterId $k8sCluster.Id -Limit 400).Items | where {$_.Name -eq "tcp-demo"})
$k8sworkload = ((Get-ZNK8SClusterWorkload -K8SClusterId $k8sCluster.Id -Limit 400).Items | where {$_.Name -eq "tcp-client"})
(Get-ZNK8SNamespaceWorkloadLabel -K8SNamespaceId $k8snamespace.id -K8SWorkloadId $k8sworkload.Id).Items
```

```output
ClusterId   : k:c:ASHpu3tF
ClusterName : openshift
Key         : app
Namespaces  : {}
Nodes       : {}
Value       : tcp-client
Workloads   : {tcp-client}
```

This cmdlet lists the labels for a K8s namespace workload.

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

