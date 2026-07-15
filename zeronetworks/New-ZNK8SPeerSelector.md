---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znk8speerselector
schema: 2.0.0
---

# New-ZNK8SPeerSelector

## SYNOPSIS
Create a in-memory object for K8SPeerSelector

## SYNTAX

```
New-ZNK8SPeerSelector [-IPBlock <K8SipBlock>] [-NamespaceSelector <K8SSelector>] [-PodSelector <K8SSelector>]
 [<CommonParameters>]
```

## DESCRIPTION
Create a in-memory object for K8SPeerSelector.
At least one of NamespaceSelector, PodSelector, or IPBlock must be provided.

## EXAMPLES

### Example 1: Create K8s Peer Selector
```powershell
$selector = New-ZNK8SPeerSelector -NamespaceSelector $k8sNSseleector
```

This cmdlet creates an in-memory peer selector for use in a k8s desired rule.

### Example 1: Create K8s Peer Selector
```powershell
$selector = New-ZNK8SPeerSelector -IPBlock $ipblock
```

This cmdlet creates an in-memory peer selector for use in a k8s desired rule.

## PARAMETERS

### -IPBlock
IP block, use New-ZNK8SIPBlock to create

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SipBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NamespaceSelector
Namespace selector, use New-ZNK8SSelector to create

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SSelector
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PodSelector
Pod selector, use New-ZNK8SSelector to create

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SSelector
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SPeerSelector

## NOTES

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.


`IPBLOCK <K8SipBlock>`: IP block, use New-ZNK8SIPBlock to create
  - `Cidr <String>`: 
  - `[ExceptCidrsList <List<String>>]`: 

`NAMESPACESELECTOR <K8SSelector>`: Namespace selector, use New-ZNK8SSelector to create
  - `[MatchExpressionsList <List<IK8SMatchExpression>>]`: 
    - `Key <String>`: 
    - `Operator <Int32>`: * '1' - In         * '2' - NotIn         * '3' - Exists         * '4' - DoesNotExist         
    - `[ValuesList <List<String>>]`: 
  - `[MatchLabelsMap <List<List<String>>>]`: Array of [key, value] tuples.

`PODSELECTOR <K8SSelector>`: Pod selector, use New-ZNK8SSelector to create
  - `[MatchExpressionsList <List<IK8SMatchExpression>>]`: 
    - `Key <String>`: 
    - `Operator <Int32>`: * '1' - In         * '2' - NotIn         * '3' - Exists         * '4' - DoesNotExist         
    - `[ValuesList <List<String>>]`: 
  - `[MatchLabelsMap <List<List<String>>>]`: Array of [key, value] tuples.

## RELATED LINKS

