---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/update-zngroupsrpcrule
schema: 2.0.0
---

# Update-ZNGroupsRpcRule

## SYNOPSIS
Updates an RPC rule.

## SYNTAX

```
Update-ZNGroupsRpcRule -GroupId <String> -GroupType <String> -RuleId <String> [-AccountName <String>]
 [-Action <Int32>] [-Description <String>] [-ExcludedAssetIdsList <String[]>] [-ExpiresAt <Int64>]
 [-InterfaceUuidsList <String[]>] [-LocalAssetId <String>] [-OpNumbersList <String[]>]
 [-ProtocolsList <String[]>] [-RemoteAssetIdsList <String[]>] [-State <Int32>] [-UserIdsList <String[]>]
 [-AsJob] [-NoWait] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Updates an RPC rule.

## EXAMPLES

### Example 1: Update an RPC rule
```powershell
$group = (Get-ZNGroup -Search 'domain controllers').Items | where {$_.Id -like 'g:t:*'}
Update-ZNGroupsRpcRule -GroupId $group.Id -GroupType tag -RuleId "114b8846-2594-477f-bf95-f2c57ee964dd" -Description "Updated Description"
```

```output
CreatedByEnforcementSource : 6
CreatedById                : m:ea53c6e1d0072c5974ceec597b64989274b7ba5f
CreatedByName              : powershell
CreatedByUserRole          : 4
ItemAction                 : 1
ItemCreatedAt              : 1709744353362
ItemDescription            : Updated Description
ItemExcludedAssetIdsList   : {}
ItemExcludedAssetInfos     : 
ItemExpiresAt              : 0
ItemId                     : 114b8846-2594-477f-bf95-f2c57ee964dd
ItemInterfaceUuidsList     : {}
ItemLocalAssetId           : g:t:01669ce2
ItemOpNumbersList          : {}
ItemParentId               : 
ItemParentType             : 0
ItemProtocolsList          : {}
ItemRemoteAssetIdsList     : {a:t:4K05Uvvc}
ItemRemoteAssetInfos       : 
ItemRuleClass              : 1
ItemState                  : 1
ItemUserIdsList            : {b:111001}
ItemUserInfos              : 
LocalAssetInfoId           : 
LocalAssetInfoName         : 
UpdatedById                : m:ea53c6e1d0072c5974ceec597b64989274b7ba5f
UpdatedByName              : powershell
```

This cmdlet updates a rpc rule.

## PARAMETERS

### -AccountName
Account Name

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Action
Allow or block.

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AsJob
Run the command as a job

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
the rule description.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExcludedAssetIdsList
the excluded assets.

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

### -ExpiresAt
when the rule should expiry.

```yaml
Type: System.Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupId
Group Id

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

### -GroupType
Group Type

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

### -InterfaceUuidsList
RPC Interface list

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

### -LocalAssetId
The Destination asset(s).

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoWait
Run the command asynchronously

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OpNumbersList
RPC Interface Operations List

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

### -ProtocolsList
RPC Protocols list

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

### -RemoteAssetIdsList
Source asset list

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

### -RuleId
rule Id

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

### -State
the rule state.

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserIdsList
The accounts.

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

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.RpcRuleResponse

## NOTES

## RELATED LINKS

