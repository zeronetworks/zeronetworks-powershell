---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znmfainboundpolicy
schema: 2.0.0
---

# Get-ZNMfaInboundPolicy

## SYNOPSIS
Returns a inbound MFA policy object.

## SYNTAX

### List (Default)
```
Get-ZNMfaInboundPolicy [-AccountName <String>] [-AddAncestors] [-AddBuiltins] [-EntityId <String>]
 [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNMfaInboundPolicy -ReactivePolicyId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a inbound MFA policy object.

## EXAMPLES

### Example 1: List inbound MFA policies
```powershell
Get-ZNMfaInboundPolicy
```

```output
CreatedAt     CreatedBy                                  CreatedByName Description DstPort DstProcessNames FallbackToLoggedOnUser Id                                   MfaMethods   ProtocolType RuleDuration Src
                                                                                                                                                                                                              Pro
                                                                                                                                                                                                              ces
                                                                                                                                                                                                              sNa
                                                                                                                                                                                                              mes
---------     ---------                                  ------------- ----------- ------- --------------- ---------------------- --                                   ----------   ------------ ------------ ---
1666114167336 m:86786c2f022cf2bd7dc38f165c98b4ee736c8c3b PowerShell                22      {*}             True                   e1db180f-e435-498c-ae17-59651f3c3dc3 {4}          6            6            {*}
1666100652229 m:86786c2f022cf2bd7dc38f165c98b4ee736c8c3b PowerShell                22-24   {*}             False                  01d37aff-309e-4581-9f2a-c12c811b035e {4}          6            6            {*}
1665664407052 1f352ed0-86f1-454f-90a5-592c197c8000       Zero Networks             2223    {*}             True                   4de27a4f-d351-4d40-bd82-92e5d039b890 {4}          6            6            {*}
1649105796514 1f352ed0-86f1-454f-90a5-592c197c8000       Zero Networks             345     {*}             False                  f68d322c-1cb0-451d-aff2-c920a1a17333 {1}          6            6            {*}
1646149214106 1f352ed0-86f1-454f-90a5-592c197c8000       Zero Networks             3389    {*}             False                  1bb6439f-ee73-4b7e-b555-30dbbd17418e {1, 2, 3, 4} 6            6            {*}
```

This cmdlet gets inbound MFA policies from the environment.

### Example 2: Get a specific inbound MFA policy
```powershell
Get-ZNMfaInboundPolicy -ReactivePolicyId "f68d322c-1cb0-451d-aff2-c920a1a17333"
I```

```

```output
temAdditionalPortsList    : {}
ItemCreatedAt              : 1649105796514
ItemCreatedBy              : 1f352ed0-86f1-454f-90a5-592c197c8000
ItemCreatedByName          : Zero Networks
ItemDescription            : 
ItemDstEntityInfos         : 
ItemDstPort                : 345
ItemDstProcessNames        : {*}
ItemFallbackToLoggedOnUser : False
ItemId                     : f68d322c-1cb0-451d-aff2-c920a1a17333
ItemMfaMethods             : {1}
ItemProtocolType           : 6
ItemRuleDuration           : 6
ItemSrcEntityInfos         : {Any asset}
ItemSrcProcessNames        : {*}
ItemSrcUserInfos           : {Benny Lakunishok}
ItemState                  : 1
ItemUpdatedAt              : 1649105796514
```

Get a specific inbound MFA policy.

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

### -AddAncestors
show rules where the asset is part of a group

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

### -AddBuiltins
show global rules

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EntityId
entityId to filter on

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

### -ReactivePolicyId
The id of the MFA policy

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IReactivePolicyList

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IReactivePolicyResponse

## NOTES

## RELATED LINKS

