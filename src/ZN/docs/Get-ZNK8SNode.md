---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znk8snode
schema: 2.0.0
---

# Get-ZNK8SNode

## SYNOPSIS
Returns a single K8s node.

## SYNTAX

### List (Default)
```
Get-ZNK8SNode [-AccountName <String>] [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>] [-Order <String>]
 [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNK8SNode -K8SNodeId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a single K8s node.

## EXAMPLES

### Example 1: List K8s nodes
```powershell
(Get-ZNK8SNode).Items
```

```output
Id           K8SUid                               LabelsList Name
--           ------                               ---------- ----
k:d:xxRJPf3e a3a35f2f-c0ba-4a3e-b668-e68d88abb3b5 {, , , …}  rke-worker.posh.local
k:d:24A6lS06 2248a7e1-741b-441b-9b40-12b11ae0b8c8 {, , , …}  okd-sno.posh.local
k:d:lnflUew2 e6606952-b1c2-48f2-954a-843ddfc5b6ee {, , , …}  openshift-sno.posh.local
k:d:djQViO2Z 888487ac-fe0a-4db0-b2d6-f14615e88fd0 {, , , …}  rke-master.posh.local
```

This cmdlet lists the K8s nodes.

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

### -K8SNodeId
nodeId to filter on

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SNodeEntity

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IK8SNodesList

## NOTES

## RELATED LINKS

