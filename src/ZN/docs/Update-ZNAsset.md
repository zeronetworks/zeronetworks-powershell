---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/update-znasset
schema: 2.0.0
---

# Update-ZNAsset

## SYNOPSIS
Update the display name and FQDN for an asset

## SYNTAX

### UpdateExpanded (Default)
```
Update-ZNAsset -AssetId <String> -DisplayName <String> -Fqdn <String> [-AccountName <String>] [-PassThru]
 [-Confirm] [-WhatIf] [<CommonParameters>]
```

### Update1
```
Update-ZNAsset -AssetId <String>
 -Body <IPaths1Xlyi6HAssetsAssetidActionsPutRequestbodyContentApplicationJsonSchema> [-AccountName <String>]
 [-PassThru] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### UpdateExpanded1
```
Update-ZNAsset -AssetId <String> -DisplayName <String> -Fqdn <String> [-AccountName <String>] [-PassThru]
 [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Update the display name and FQDN for an asset

## EXAMPLES

### Example 1: Edit an asset
```powershell
$assetId = (Search-ZNAsset -Fqdn renameLinux.posh.linux).AssetId
$random = Get-Random -Min 1 -Max 100
Update-ZNAsset -AssetId $assetId -DisplayName "renameLinxux$random" -Fqdn renameLinux.posh.linux
```

This cmdlet edits an asset displayname and/or Fqdn.

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
Parameter Sets: (All)
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
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IPaths1Xlyi6HAssetsAssetidActionsPutRequestbodyContentApplicationJsonSchema
Parameter Sets: Update1
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -DisplayName
Display name for the asset

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateExpanded1
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Fqdn
Fully qualified domain name for the asset

```yaml
Type: System.String
Parameter Sets: UpdateExpanded, UpdateExpanded1
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IPaths1Xlyi6HAssetsAssetidActionsPutRequestbodyContentApplicationJsonSchema

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.


`BODY <IPaths1Xlyi6HAssetsAssetidActionsPutRequestbodyContentApplicationJsonSchema>`: .
  - `DisplayName <String>`: Display name for the asset
  - `Fqdn <String>`: Fully qualified domain name for the asset

## RELATED LINKS

