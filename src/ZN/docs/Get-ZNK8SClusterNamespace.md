---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znk8sclusternamespace
schema: 2.0.0
---

# Get-ZNK8SClusterNamespace

## SYNOPSIS
Returns a list of namespaces for the k8s cluster.

## SYNTAX

### List (Default)
```
Get-ZNK8SClusterNamespace -K8SClusterId <String> [-AccountName <String>] [-Filters <String>] [-Limit <Int32>]
 [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNK8SClusterNamespace -K8SClusterId <String> -K8SNamespaceId <String> [-AccountName <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns a list of namespaces for the k8s cluster.

## EXAMPLES

### Example 1: List K8s cluster namespaces
```powershell
(Get-ZNK8SClusterNamespace -ClusterId k:c:FYe7yLUJ).Items
```

```output
ClusterId     : k:c:FYe7yLUJ
Id            : k:n:4CvhlfjA
K8SUid        : 1f5b6be8-ea56-43a1-a7d8-73b14b4162b5
LabelsList    : {assisted-installer, privileged, privileged, privileged…}
Name          : assisted-installer
WorkloadsList : {assisted-installer-controller}

ClusterId     : k:c:FYe7yLUJ
Id            : k:n:BCTbp4uf
K8SUid        : bc60f776-f251-4cce-94dc-894f875837b5
LabelsList    : {default, privileged, privileged, privileged}
Name          : default
WorkloadsList : {}
```

This cmdlet lists the cluster namespaces.

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

### -K8SNamespaceId
id of the K8s namespace

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SNamespaceEntity

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SNamespacesList

## NOTES

## RELATED LINKS

