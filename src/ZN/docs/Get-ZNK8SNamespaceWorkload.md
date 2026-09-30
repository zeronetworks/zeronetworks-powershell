---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znk8snamespaceworkload
schema: 2.0.0
---

# Get-ZNK8SNamespaceWorkload

## SYNOPSIS
Returns a workload for k8s namespace.

## SYNTAX

### List (Default)
```
Get-ZNK8SNamespaceWorkload -K8SNamespaceId <String> [-AccountName <String>] [-Filters <String>]
 [-Limit <Int32>] [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>] [-ShowPodlessWorkloads]
 [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNK8SNamespaceWorkload -K8SNamespaceId <String> -K8SWorkloadId <String> [-AccountName <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns a workload for k8s namespace.

## EXAMPLES

### Example 1: List namespace workloads
```powershell
(Get-ZNK8SNamespaceWorkload -NamespaceId k:n:Drq2fo6q).Items
```

```output
ClusterId   : k:c:FYe7yLUJ
ClusterName : Openshift
Id          : k:w:3YBsQS76
K8SUid      : d3ea47fa-b434-41dc-a732-ee2792bc77dc
LabelsList  : ZeroNetworks.PowerShell.Cmdlets.Api.Models.Any
Name        : znk8s-cloud-connector
PodsCount   : 1
```

This cmdlet lists workloads in a K8s namespace.

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
Parameter Sets: List
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
Parameter Sets: Get
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
Parameter Sets: List
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
Parameter Sets: List
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
Parameter Sets: List
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
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ShowPodlessWorkloads
show podless workloads

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: List
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
Parameter Sets: List
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SWorkload

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SWorkloadsList

## NOTES

## RELATED LINKS

