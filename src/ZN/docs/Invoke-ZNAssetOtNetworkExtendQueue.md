---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/invoke-znassetotnetworkextendqueue
schema: 2.0.0
---

# Invoke-ZNAssetOtNetworkExtendQueue

## SYNOPSIS
Extend OT asset learning

## SYNTAX

### QueueExpanded (Default)
```
Invoke-ZNAssetOtNetworkExtendQueue -AssetId <String> -ExtendByDays <Int32> [-AccountName <String>]
 [-RelearnReason <String>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### QueueExpanded1
```
Invoke-ZNAssetOtNetworkExtendQueue -ExtendByDays <Int32> -Items <String[]> [-AccountName <String>]
 [-MaintenanceWindowId <String>] [-RelearnReason <String>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Extend OT asset learning

## EXAMPLES

### Example 1: Extend network learning for several assets
```powershell
Invoke-ZNAssetOtNetworkExtendQueue -Items @('a:a:JZgxbNLi','a:d:9w92xWqF') -ExtendByDays 30
```

This cmdlet will extend network learning for several assets.

### Example 2: Extend network learning for an asset
```powershell
$asset = Search-ZNAsset -Fqdn switch01.posh.local
Invoke-ZNAssetOtNetworkExtendQueue -AssetId $asset -ExtendByDays 30
```

This cmdlet will extend network learning for a specific asset.

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

### -ExtendByDays
number of days

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

### -Items
.

```yaml
Type: System.String[]
Parameter Sets: QueueExpanded1
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaintenanceWindowId
.

```yaml
Type: System.String
Parameter Sets: QueueExpanded1
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RelearnReason
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IAny

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

