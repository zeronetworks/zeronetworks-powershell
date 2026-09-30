---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znk8snamespace
schema: 2.0.0
---

# Get-ZNK8SNamespace

## SYNOPSIS
Returns a list of namespaces for the k8s.

## SYNTAX

### List (Default)
```
Get-ZNK8SNamespace [-AccountName <String>] [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>]
 [-Order <String>] [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNK8SNamespace -K8SNamespaceId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of namespaces for the k8s.

## EXAMPLES

### Example 1: List cluster namespaces
```powershell
(Get-ZNK8SNamespace).Items
```

```output
ClusterId     : k:c:FYe7yLUJ
Id            : k:n:4CvhlfjA
K8SUid        : 1f5b6be8-ea56-43a1-a7d8-73b14b4162b5
LabelsList    : {false, assisted-installer, privileged, privileged…}
Name          : assisted-installer
WorkloadsList : {assisted-installer-controller}

ClusterId     : k:c:FYe7yLUJ
Id            : k:n:BCTbp4uf
K8SUid        : bc60f776-f251-4cce-94dc-894f875837b5
LabelsList    : {default, privileged, privileged, privileged}
Name          : default
WorkloadsList : {}
...
```

This cmdlet lists namespaces in a K8s cluster.

### Example 2: Get a cluster namespaces
```powershell
(Get-ZNK8SNamespace -NamespaceId k:n:Drq2fo6q).Items
```

```output
EntityClusterId     : k:c:FYe7yLUJ
EntityId            : k:n:Drq2fo6q
EntityK8SUid        : d67e5c0a-70f8-4a4d-bd25-a052346e526a
EntityLabelsList    : {latest, znk8s, znk8s, restricted…}
EntityName          : znk8s
EntityWorkloadsList : {znk8s-cloud-connector}```

This cmdlet gets a namespace in a K8s cluster.

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

