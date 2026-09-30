---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znk8sworkload
schema: 2.0.0
---

# Get-ZNK8SWorkload

## SYNOPSIS
Returns a workload for k8s.

## SYNTAX

### List (Default)
```
Get-ZNK8SWorkload [-AccountName <String>] [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>]
 [-Order <String>] [-OrderColumns <List<String>>] [-ShowPodlessWorkloads] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNK8SWorkload -K8SWorkloadId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a workload for k8s.

## EXAMPLES

### Example 1: List K8s workloads
```powershell
(Get-ZNK8SWorkload).Items
```

```output
AnnotationsList  : {true, true, CSISnapshot, 1}
ApplicationsList : {csi-snapshot-controller-operator}
ClusterId        : k:c:osyL1WCW
ClusterName      : openshift
Id               : k:w:vNkEScaA
K8SUid           : 509baa2e-a0b7-4588-a819-f5b0e6aedfe2
LabelsList       : ZeroNetworks.PowerShell.Cmdlets.Api.Models.Any
Name             : csi-snapshot-controller-operator
NamespaceId      : k:n:ZLH0ecAl
NamespaceName    : openshift-cluster-storage-operator
PodsCount        : 1
Type             : 5

AnnotationsList  : {1, 15, Lu4MjsicICN41aUeiFa1-5DJ8Fxh6wVtdPSh609J5gDtEacqei3JN6XvbNamxoItf94LqiUmGdOJ7ARD_XW88g, 
                   b16e24af911d9d34632cf31e109e511b9740b109f1876b2b0c2a950a6b6e2c01…}
ApplicationsList : {oauth-openshift}
ClusterId        : k:c:osyL1WCW
ClusterName      : openshift
Id               : k:w:C0zjIkFz
K8SUid           : 9fe0783a-22ec-418a-85d7-2ea4abca5b06
LabelsList       : ZeroNetworks.PowerShell.Cmdlets.Api.Models.Any
Name             : oauth-openshift-584b7f8985
NamespaceId      : k:n:wUEp5IuI
NamespaceName    : openshift-authentication
PodsCount        : 1
Type             : 15

AnnotationsList  : {}
ApplicationsList : {pruner}
ClusterId        : k:c:osyL1WCW
ClusterName      : openshift
Id               : k:w:BTqE5Ve1
K8SUid           : ae703b20-b4b9-497b-a9cc-7a022b946605
LabelsList       : ZeroNetworks.PowerShell.Cmdlets.Api.Models.Any
Name             : revision-pruner-12-00-0c-29-04-ab-96
NamespaceId      : k:n:MpFi9aIx
NamespaceName    : openshift-kube-apiserver
PodsCount        : 1
Type             : 4

AnnotationsList  : {restricted-v2, 2025-09-23T00:00:00Z}
ApplicationsList : {}
ClusterId        : k:c:osyL1WCW
ClusterName      : openshift
Id               : k:w:Q9zyT10R
K8SUid           : c7c6605a-881b-4784-9726-67c0bce89bf2
LabelsList       : ZeroNetworks.PowerShell.Cmdlets.Api.Models.Any
Name             : image-pruner-29309760
NamespaceId      : k:n:3rbUd1T6
NamespaceName    : openshift-image-registry
PodsCount        : 1
Type             : 8

AnnotationsList  : {22, b5d7ffcc4c7b6ef0e575a5f67bde96306c2cddaf38605b5bdcc398a47a4d68e4, 4.19.7, 1…}
ApplicationsList : {openshift-controller-manager-a}
ClusterId        : k:c:osyL1WCW
ClusterName      : openshift
Id               : k:w:CdVeHcQy
K8SUid           : 55dc7e59-d5f3-4e3b-a6df-0952401d35a1
LabelsList       : ZeroNetworks.PowerShell.Cmdlets.Api.Models.Any
Name             : controller-manager-64886f6d
NamespaceId      : k:n:XNRIgrAG
NamespaceName    : openshift-controller-manager
PodsCount        : 1
Type             : 15

AnnotationsList  : {}
ApplicationsList : {installer}
ClusterId        : k:c:osyL1WCW
ClusterName      : openshift
Id               : k:w:Hs5Wi9SV
K8SUid           : fdf25f05-7ec2-4d5a-a690-989fd6c4c04d
LabelsList       : ZeroNetworks.PowerShell.Cmdlets.Api.Models.Any
Name             : installer-13-00-0c-29-04-ab-96
NamespaceId      : k:n:MpFi9aIx
NamespaceName    : openshift-kube-apiserver
PodsCount        : 1
Type             : 4

AnnotationsList  : {1, 2, 12}
ApplicationsList : {}
ClusterId        : k:c:osyL1WCW
ClusterName      : openshift
Id               : k:w:rGfWglIp
K8SUid           : 3548cc07-0b28-4e86-b42f-7e6d324af856
LabelsList       : ZeroNetworks.PowerShell.Cmdlets.Api.Models.Any
Name             : metrics-server-fd46f75c7
NamespaceId      : k:n:D6eaNizJ
NamespaceName    : openshift-monitoring
PodsCount        : 1
Type             : 15

AnnotationsList  : {1, 20, 8b48788d594a93f91a44d2288fb0de319465f581baa2fedfe536fa92f87d3b84, 4.19.7…}
ApplicationsList : {route-controller-manager}
ClusterId        : k:c:osyL1WCW
ClusterName      : openshift
Id               : k:w:B1ideKz1
K8SUid           : 66086515-297e-4779-8db5-debf58b57db8
LabelsList       : ZeroNetworks.PowerShell.Cmdlets.Api.Models.Any
Name             : route-controller-manager-587bbcd8b5
NamespaceId      : k:n:YYTgXBLY
NamespaceName    : openshift-route-controller-manager
PodsCount        : 1
Type             : 15

AnnotationsList  : {}
ApplicationsList : {pruner}
ClusterId        : k:c:osyL1WCW
ClusterName      : openshift
Id               : k:w:MhlYixG5
K8SUid           : 01201c63-c2ea-45cb-83fb-9a409976bb9d
LabelsList       : ZeroNetworks.PowerShell.Cmdlets.Api.Models.Any
Name             : revision-pruner-13-00-0c-29-04-ab-96
NamespaceId      : k:n:MpFi9aIx
NamespaceName    : openshift-kube-apiserver
PodsCount        : 1
Type             : 4

AnnotationsList  : {true, true, 1, true}
ApplicationsList : {openshift-apiserver-operator}
ClusterId        : k:c:osyL1WCW
ClusterName      : openshift
Id               : k:w:gXM25xga
K8SUid           : a165bfce-6213-41c1-8e74-28f768b4ee2f
LabelsList       : ZeroNetworks.PowerShell.Cmdlets.Api.Models.Any
Name             : openshift-apiserver-operator
NamespaceId      : k:n:pGR6T55u
NamespaceName    : openshift-apiserver-operator
PodsCount        : 1
Type             : 5
```

This cmdlet lists K8s workloads.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SWorkloadEntity

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SWorkloadsList

## NOTES

## RELATED LINKS

