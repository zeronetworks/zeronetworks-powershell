---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/unprotect-znk8snamespacesnetworksegment
schema: 2.0.0
---

# Unprotect-ZNK8SNamespacesNetworkSegment

## SYNOPSIS
Sets the desired protection state of the given namespaces to unprotected, routing each change through the enforcement engine.
Namespaces that are not valid for unprotection are skipped.
Returns an empty object.

## SYNTAX

### UnprotectExpanded (Default)
```
Unprotect-ZNK8SNamespacesNetworkSegment -NamespaceIds <String[]> [-AccountName <String>] [-Confirm] [-WhatIf]
 [<CommonParameters>]
```

### Unprotect
```
Unprotect-ZNK8SNamespacesNetworkSegment
 -Body <IPaths1I7ZzgeK8SNamespacesActionsUnprotectPostRequestbodyContentApplicationJsonSchema>
 [-AccountName <String>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Sets the desired protection state of the given namespaces to unprotected, routing each change through the enforcement engine.
Namespaces that are not valid for unprotection are skipped.
Returns an empty object.

## EXAMPLES

### Example 1: Disable network segementation for a k8s namespace
```powershell
$k8scluster = (Get-ZNK8SCluster).Items | where {$_.Name -eq "rke"} |Select-Object -First 1 
$k8snamespace = (Get-ZNK8SClusterNamespace -K8SClusterId $k8scluster.id -Limit 400).Items | where {$_.Name -eq "powershell"}
Unprotect-ZNK8SNamespacesNetworkSegment -NamespaceIds @($k8snamespace.id)
```

This cmdlet disables network segmentation for a K8s namespace.

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

### -Body
.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IPaths1I7ZzgeK8SNamespacesActionsUnprotectPostRequestbodyContentApplicationJsonSchema
Parameter Sets: Unprotect
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -NamespaceIds
.

```yaml
Type: System.String[]
Parameter Sets: UnprotectExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IPaths1I7ZzgeK8SNamespacesActionsUnprotectPostRequestbodyContentApplicationJsonSchema

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IAny

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.


`BODY <IPaths1I7ZzgeK8SNamespacesActionsUnprotectPostRequestbodyContentApplicationJsonSchema>`: .
  - `NamespaceIds <List<String>>`: 

## RELATED LINKS

