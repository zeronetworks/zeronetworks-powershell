---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/test-znassetotnetworksegmentunprotect
schema: 2.0.0
---

# Test-ZNAssetOtNetworkSegmentUnprotect

## SYNOPSIS
Returns a number of ot assets that are valid for network segmentation.

## SYNTAX

### ValidateExpanded1 (Default)
```
Test-ZNAssetOtNetworkSegmentUnprotect -Items <String[]> [-AccountName <String>] [-Confirm] [-WhatIf]
 [<CommonParameters>]
```

### Validate
```
Test-ZNAssetOtNetworkSegmentUnprotect -AssetId <String> -Body <IAssetsProtectBody> [-AccountName <String>]
 [-Confirm] [-WhatIf] [<CommonParameters>]
```

### ValidateExpanded
```
Test-ZNAssetOtNetworkSegmentUnprotect -AssetId <String> -Items <String[]> [-AccountName <String>] [-Confirm]
 [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Returns a number of ot assets that are valid for network segmentation.

## EXAMPLES

### Example 1: Test OT asset for network unsegment
```powershell
$asset = Search-ZNAsset -fqdn poshotv1.posh.local
Test-ZNAssetOtNetworkSegmentUnprotect -AssetId $asset.AssetId
```

```output
AffectedAssetsCount
-------------------
                  0
```

This cmdlet validates if an OT assets is suitable for Network unsegmentation.

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
Parameter Sets: Validate, ValidateExpanded
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Body
.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IAssetsProtectBody
Parameter Sets: Validate
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Items
.

```yaml
Type: System.String[]
Parameter Sets: ValidateExpanded, ValidateExpanded1
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IAssetsProtectBody

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IValidateResponse

## NOTES

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.


`BODY <IAssetsProtectBody>`: .
  - `Items <List<String>>`: 

## RELATED LINKS

