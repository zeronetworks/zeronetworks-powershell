---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/invoke-znassetnetworkoutboundextendqueue
schema: 2.0.0
---

# Invoke-ZNAssetNetworkOutboundExtendQueue

## SYNOPSIS
Extend the outbound learning window of an asset in the given outbound directions

## SYNTAX

### QueueExpanded1 (Default)
```
Invoke-ZNAssetNetworkOutboundExtendQueue -AssetIds <String[]> -Directions <Int32[]> -ExtendByDays <Int32>
 [-AccountName <String>] [-RelearnReason <String>] [-PassThru] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### QueueExpanded
```
Invoke-ZNAssetNetworkOutboundExtendQueue -AssetId <String> -AssetIds <String[]> -Directions <Int32[]>
 -ExtendByDays <Int32> [-AccountName <String>] [-RelearnReason <String>] [-PassThru] [-Confirm] [-WhatIf]
 [<CommonParameters>]
```

## DESCRIPTION
Extend the outbound learning window of an asset in the given outbound directions

## EXAMPLES

### Example 1: Enable outbound learning
```powershell
$asset= (Search-ZNAsset -Fqdn al01.posh.local).AssetId
Invoke-ZNAssetNetworkOutboundQueue -AssetIds @($asset) -Directions 1 -QueueDays 14
```

This cmdlet enables outbound learning.

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

### -AssetId
assetId to filter on

```yaml
Type: System.String
Parameter Sets: QueueExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AssetIds
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

### -Directions
* 1 - INTERNAL* 2 - EXTERNAL

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

### -ExtendByDays
number of days to extend the learning window by, or -1 to learn indefinitely

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

### -PassThru
Returns true when the command succeeds

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

### -RelearnReason
why a finished learning window is being reopened, required to relearn

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

## NOTES

## RELATED LINKS

