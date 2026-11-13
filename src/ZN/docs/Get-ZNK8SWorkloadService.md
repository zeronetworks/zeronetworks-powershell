---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znk8sworkloadservice
schema: 2.0.0
---

# Get-ZNK8SWorkloadService

## SYNOPSIS
Returns a service for a k8s workload.

## SYNTAX

### List (Default)
```
Get-ZNK8SWorkloadService -K8SWorkloadId <String> [-AccountName <String>] [-Filters <String>] [-Limit <Int32>]
 [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNK8SWorkloadService -K8SServiceId <String> -K8SWorkloadId <String> [-AccountName <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns a service for a k8s workload.

## EXAMPLES

### Example 1: List K8s workload serivces
```powershell
$k8sworkload = (Get-ZNK8SNamespaceWorkload -K8SNamespaceId $K8snamespace.id).Items | where {$_.Name -eq "powershell"}
(Get-ZNK8SWorkloadService -K8SWorkloadId $k8sworkload.Id).Items
```

```output
AnnotationsList : {}
ClusterId       : k:c:K4x42qfL
ClusterName     : rke
Id              : k:s:U8yIaDnK
IpsList         : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SServiceIP}
K8SUid          : 89951d04-eabb-417e-938e-7a5ce1be3d25
LabelsList      : {app}
Name            : powershell
NamespaceId     : k:n:n9GxlaA4
NamespaceName   : powershell
PortsList       : {}
TargetsList     : {powershell}
Type            : 1
```

This cmdlet lists K8s workload services.

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

### -K8SServiceId
id of the K8s service

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
Type: System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=8.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SServiceEntity

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SServicesList

## NOTES

## RELATED LINKS

