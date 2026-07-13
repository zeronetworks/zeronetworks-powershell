---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znk8smatchexpression
schema: 2.0.0
---

# New-ZNK8SMatchExpression

## SYNOPSIS
Create a in-memory object for K8SMatchExpression

## SYNTAX

```
New-ZNK8SMatchExpression -Key <String> -Operator <String> [-Values <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Create a in-memory object for K8SMatchExpression

## EXAMPLES

### Example 1: Create a K8s Match expression
```powershell
$k8sMatchexpression = New-ZNK8SMatchExpression -Key key -Operator in -Values @("abc")
```

This cmdlet creates a match expression for a K8s desired rule.

## PARAMETERS

### -Key
Label key the expression applies to

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

### -Operator
Match operator

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

### -Values
List of values, required for In/NotIn operators

```yaml
Type: System.String[]
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SMatchExpression

## NOTES

## RELATED LINKS

