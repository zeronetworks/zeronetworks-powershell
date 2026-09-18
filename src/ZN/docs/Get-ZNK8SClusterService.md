---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znk8sclusterservice
schema: 2.0.0
---

# Get-ZNK8SClusterService

## SYNOPSIS
Returns a service for k8s cluster.

## SYNTAX

### List (Default)
```
Get-ZNK8SClusterService -K8SClusterId <String> [-AccountName <String>] [-Filters <String>] [-Limit <Int32>]
 [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNK8SClusterService -K8SClusterId <String> -K8SServiceId <String> [-AccountName <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns a service for k8s cluster.

## EXAMPLES

### Example 1: List K8s Cluster Services
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
(Get-ZNK8SClusterService -K8SClusterId $k8scluster.id).Items
```

```output
AnnotationsList : 
ClusterId       : k:c:j3PDZgKj
ClusterName     : rke
Id              : k:s:slrXfPv0
IpsList         : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SServiceIP}
K8SUid          : 3574b08e-03c2-49cd-9eb9-cf529a448706
LabelsList      : 
Name            : kubernetes
NamespaceId     : k:n:zjcBbbGK
NamespaceName   : default
PortsList       : {https}
TargetsList     : {}
Type            : 1

AnnotationsList : 
ClusterId       : k:c:j3PDZgKj
ClusterName     : rke
Id              : k:s:fQW0d0aq
IpsList         : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SServiceIP}
K8SUid          : 3614fcba-c4d5-47a7-addd-ec15b72301c5
LabelsList      : 
Name            : rke2-metrics-server
NamespaceId     : k:n:VLMwpoCy
NamespaceName   : kube-system
PortsList       : {https}
TargetsList     : {rke2-metrics-server}
Type            : 1

AnnotationsList : 
ClusterId       : k:c:j3PDZgKj
ClusterName     : rke
Id              : k:s:LaNe6zVy
IpsList         : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SServiceIP}
K8SUid          : 781e6de8-2f36-420e-b6e3-aa7c9fe279fc
LabelsList      : 
Name            : rke2-ingress-nginx-controller-admission
NamespaceId     : k:n:VLMwpoCy
NamespaceName   : kube-system
PortsList       : {https-webhook}
TargetsList     : {rke2-ingress-nginx-controller}
Type            : 1

AnnotationsList : 
ClusterId       : k:c:j3PDZgKj
ClusterName     : rke
Id              : k:s:UhopPd3l
IpsList         : {ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SServiceIP}
K8SUid          : e0cdfbd3-34e2-4979-980d-13012a862a4b
LabelsList      : 
Name            : rke2-coredns-rke2-coredns
NamespaceId     : k:n:VLMwpoCy
NamespaceName   : kube-system
PortsList       : {udp-53, tcp-53}
TargetsList     : {rke2-coredns-rke2-coredns}
Type            : 1
```

This cmdlet lists services for a K8s Cluster.

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

### -K8SClusterId
cluserId to filter on

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

