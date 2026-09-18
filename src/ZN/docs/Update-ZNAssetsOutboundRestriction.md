---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/update-znassetsoutboundrestriction
schema: 2.0.0
---

# Update-ZNAssetsOutboundRestriction

## SYNOPSIS
Set the outbound restriction for multiple assets

## SYNTAX

```
Update-ZNAssetsOutboundRestriction -AssetIds <String[]> -OutboundRestriction <Int32> [-AccountName <String>]
 [-PassThru] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Set the outbound restriction for multiple assets

## EXAMPLES

### Example 1: Configure outbound restrictions
```powershell
$assetid = (Search-ZNAsset -Fqdn dc01.posh.local).AssetId
Update-ZNAssetsOutboundRestriction -AssetIds ($assetid) -OutboundRestriction 1 
```

This cmdlet configures outbound restrictions for assets.
1 - NO_RESTRICTION, 2 - RESTRICTED_INTERNAL, 3 - RESTRICTED_EXTERNAL, 4 - RESTRICTED_INTERNAL_EXTERNAL

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

### -OutboundRestriction
* 1 - NO_RESTRICTION* 2 - RESTRICTED_INTERNAL* 3 - RESTRICTED_EXTERNAL* 4 - RESTRICTED_INTERNAL_EXTERNAL

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

