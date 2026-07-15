---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znk8sipblock
schema: 2.0.0
---

# New-ZNK8SIPBlock

## SYNOPSIS
Create a in-memory object for K8SIPBlock

## SYNTAX

```
New-ZNK8SIPBlock -Cidr <String> [-ExceptCidrs <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Create a in-memory object for K8SIPBlock

## EXAMPLES

### Example 1: Create K8s Ip Block
```powershell
$ipblock = New-ZNK8SIPBlock -Cidr 192.168.2.0/24 -ExceptCidrs 192.168.2.0/32 
```

This cmdlet creates an in-memory ip block for use in a k8s desired rule.

## PARAMETERS

### -Cidr
CIDR range, e.g.
10.0.0.0/16

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

### -ExceptCidrs
List of CIDR ranges to exclude from the block

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SipBlock

## NOTES

## RELATED LINKS

