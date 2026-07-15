---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znk8sselector
schema: 2.0.0
---

# New-ZNK8SSelector

## SYNOPSIS
Create a in-memory object for K8SSelector

## SYNTAX

```
New-ZNK8SSelector [-MatchExpressions <K8SMatchExpression[]>] [-MatchLabels <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
Create a in-memory object for K8SSelector

## EXAMPLES

### Example 1: Create K8s selector
```powershell
$k8sNSseleector = New-ZNK8SSelector -MatchLabels @{"key"="value"}
```

This cmdlet creates an in-memory selector for use in a k8s desired rule.

## PARAMETERS

### -MatchExpressions
List of match expressions, use New-ZNK8SMatchExpression to create

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SMatchExpression[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MatchLabels
Hashtable of labels to match, converted to [key, value] tuples

```yaml
Type: System.Collections.Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SSelector

## NOTES

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.


`MATCHEXPRESSIONS <K8SMatchExpression[]>`: List of match expressions, use New-ZNK8SMatchExpression to create
  - `Key <String>`: 
  - `Operator <Int32>`: * '1' - In         * '2' - NotIn         * '3' - Exists         * '4' - DoesNotExist         
  - `[ValuesList <List<String>>]`: 

## RELATED LINKS

