---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/new-zngroupsrpcrule
schema: 2.0.0
---

# New-ZNGroupsRpcRule

## SYNOPSIS
Returns the properties of the create RPC rule.

## SYNTAX

```
New-ZNGroupsRpcRule -GroupId <String> -GroupType <String> -Action <Int32> -Description <String>
 -ExcludedAssetIdsList <String[]> -InterfaceUuidsList <String[]> -LocalAssetId <String>
 -OpNumbersList <Int32[]> -ProtocolsList <Int32[]> -RemoteAssetIdsList <String[]> -State <Int32>
 -UserIdsList <String[]> [-AccountName <String>] [-ChangeTicket <String>] [-ExpiresAt <Int64>]
 [-Name <String>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Returns the properties of the create RPC rule.

## EXAMPLES

### Example 1: Create a RPC rule for a specific asset
```powershell
New-ZNGroupsRpcRule -GroupType tag -GroupId 'g:t:01669ce2' -Action 1 -Description "New RPC Rule" -ExcludedAssetIdsList @() -InterfaceUuidsList @() -LocalAssetId 'g:t:01669ce2' -OpNumbersList @() -ProtocolsList @() -RemoteAssetIdsList @('b:110001') -State 1 -UserIdsList @('b:111001')
```

```output
CreatedByEnforcementSource : 6
CreatedById                : m:ea53c6e1d0072c5974ceec597b64989274b7ba5f
CreatedByName              : powershell
CreatedByUserRole          : 4
ItemAction                 : 1
ItemCreatedAt              : 1708008427013
ItemDescription            : New RPC Rule
ItemExcludedAssetIdsList   : {}
ItemExcludedAssetInfos     : 
ItemExpiresAt              : 0
ItemId                     : 098dc1d0-91e8-4602-93c5-687ba860a877
ItemInterfaceUuidsList     : {}
ItemLocalAssetId           : g:t:01669ce2
ItemOpNumbersList          : {}
ItemParentId               : 
ItemParentType             : 0
ItemProtocolsList          : {}
ItemRemoteAssetIdsList     : {b:110001}
ItemRemoteAssetInfos       : 
ItemRuleClass              : 1
ItemState                  : 1
ItemUserIdsList            : {b:111001}
ItemUserInfos              : 
LocalAssetInfoId           : 
LocalAssetInfoName         : 
UpdatedById                : 
UpdatedByName              : 
```

This cmdlet creates a RPC rule for a specific group.

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

### -Action
* 1 - Allow* 2 - Block* 3 - Force Block

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ChangeTicket
.

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

### -Description
.

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

### -ExcludedAssetIdsList
.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExpiresAt
Epoch Millis

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
groupId to filter on

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
group type to filter on

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
one of the following:* "rpcAnyInterfaceId" for any interface* List of interface uuids for explicit interfaces

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LocalAssetId
.

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

### -Name
.

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

### -OpNumbersList
.

```yaml
Type: System.Int32[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProtocolsList
* NULL - Any* '1' - Rules RPC over SMB* '2' - Rules RPC over TCP

```yaml
Type: System.Int32[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RemoteAssetIdsList
.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -State
* '1' - Enabled* '2' - Disabled* '3' - Deleted By User* '4' - Pending Review* '5' - Pending Review Auto* '6' - Rejected by User* '7' - Excluded by User

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserIdsList
.

```yaml
Type: System.String[]
Parameter Sets: (All)
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

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IRpcRuleResponse

## NOTES

## RELATED LINKS

