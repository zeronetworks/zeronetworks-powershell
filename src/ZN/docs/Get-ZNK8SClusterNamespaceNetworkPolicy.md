---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znk8sclusternamespacenetworkpolicy
schema: 2.0.0
---

# Get-ZNK8SClusterNamespaceNetworkPolicy

## SYNOPSIS
Returns a list of network policies for a namespaces in the k8s cluster.

## SYNTAX

```
Get-ZNK8SClusterNamespaceNetworkPolicy -K8SClusterId <String> -K8SNamespaceId <String> [-AccountName <String>]
 [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>]
 [-WithCount] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of network policies for a namespaces in the k8s cluster.

## EXAMPLES

### Example 1: List K8s cluster namespace policies
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1
$k8snamespace = (Get-ZNK8SClusterNamespace -K8SClusterId $k8scluster.id -Limit 400).Items | where {$_.Name -eq "powershell"}
(Get-ZNK8SClusterNamespaceNetworkPolicy -K8SClusterId $k8scluster.id -K8SNamespaceId $k8snamespace.Id).Items
```

```output
ChangeTicket           : 
ClusterId              : k:c:j3PDZgKj
CompliantAt            : 
CreatedAt              : 1789130483411
CreatedById            : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName          : Zero Networks
DeployedAt             : 
Description            : 
DesiredRules           : 
EgressRules            : 
EnforcementSource      : 5
HostNamespaceId        : k:n:Fo58v1jn
HostNamespaceName      : powershell
Id                     : k:f:7x4XkLwb
IngressRules           : 
IsCompliant            : False
IsDeployed             : False
IsDesired              : True
IsEgressPolicy         : True
IsIngressPolicy        : False
K8SUid                 : 
LocalEntityApplication : 
LocalEntityLabelsMap   : 
LocalEntitySubnet      : 
LocalEntityType        : 2
Name                   : testpolicy
NamespaceId            : k:n:Fo58v1jn
NamespaceName          : powershell
RulesCount             : 1
SelectorString         : {}
Type                   : 1
UpdatedAt              : 
UpdatedById            : 
UpdatedByName          : 

ChangeTicket           : 
ClusterId              : k:c:j3PDZgKj
CompliantAt            : 
CreatedAt              : 1789130942415
CreatedById            : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName          : Zero Networks
DeployedAt             : 
Description            : 
DesiredRules           : 
EgressRules            : 
EnforcementSource      : 5
HostNamespaceId        : k:n:Fo58v1jn
HostNamespaceName      : powershell
Id                     : k:f:bshj47aH
IngressRules           : 
IsCompliant            : False
IsDeployed             : False
IsDesired              : True
IsEgressPolicy         : True
IsIngressPolicy        : True
K8SUid                 : 
LocalEntityApplication : powershell
LocalEntityLabelsMap   : 
LocalEntitySubnet      : 
LocalEntityType        : 5
Name                   : testpolicy2
NamespaceId            : k:n:Fo58v1jn
NamespaceName          : powershell
RulesCount             : 2
SelectorString         : {"matchLabels": {"app": "powershell"}}
Type                   : 1
UpdatedAt              : 1789142702932
UpdatedById            : 1f352ed0-86f1-454f-90a5-592c197c8000
UpdatedByName          : Zero Networks

ChangeTicket           : 
ClusterId              : k:c:j3PDZgKj
CompliantAt            : 
CreatedAt              : 1789134512379
CreatedById            : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
CreatedByName          : powershell-module-development
DeployedAt             : 
Description            : 
DesiredRules           : 
EgressRules            : 
EnforcementSource      : 6
HostNamespaceId        : k:n:Fo58v1jn
HostNamespaceName      : powershell
Id                     : k:f:E0HcKxyE
IngressRules           : 
IsCompliant            : False
IsDeployed             : False
IsDesired              : True
IsEgressPolicy         : True
IsIngressPolicy        : True
K8SUid                 : 
LocalEntityApplication : 
LocalEntityLabelsMap   : 
LocalEntitySubnet      : 
LocalEntityType        : 2
Name                   : wewpolicy
NamespaceId            : k:n:Fo58v1jn
NamespaceName          : powershell
RulesCount             : 1
SelectorString         : {}
Type                   : 1
UpdatedAt              : 
UpdatedById            : 
UpdatedByName          : 
```

This cmdlet lists K8s cluster namespace network policies.

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
Type: System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=8.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SNetworkPolicyList

## NOTES

## RELATED LINKS

