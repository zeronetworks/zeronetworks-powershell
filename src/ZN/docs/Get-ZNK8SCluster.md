---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znk8scluster
schema: 2.0.0
---

# Get-ZNK8SCluster

## SYNOPSIS
Returns a k8s cluster.

## SYNTAX

### List (Default)
```
Get-ZNK8SCluster [-AccountName <String>] [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>]
 [-Order <String>] [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNK8SCluster -K8SClusterId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a k8s cluster.

## EXAMPLES

### Example 1: List K8s clusters
```powershell
(Get-ZNK8SCluster).Items
```

```output
AgentExternalIP   : 50.89.54.67
AgentVersion      : 1.0.0.0
ClusterType       : 2
CniType           : 2
CniVersion        : 4.17.12
ConnectedSince    : 1737941385944
ConnectionState   : 1
CreatedAt         : 1737941241180
CreatedById       : 11778dee-127b-4677-bbba-734040606532
CreatedByName     : Nicholas DiCola
Generation        : 738560025
Id                : k:c:FYe7yLUJ
K8SClusterVersion : 1.30
K8SUid            : e86eb57e-e632-4d0c-813a-9cf6c88cf5bc
LastConnected     : 1737941385944
LastDisconnected  : 
Name              : Openshift
UpdatedAt         : 1737941425498
UpdatedById       : 
UpdatedByName     : 
```

This cmdlet lists K8s (kubernetes) clusters.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SEntity

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SList

## NOTES

## RELATED LINKS

