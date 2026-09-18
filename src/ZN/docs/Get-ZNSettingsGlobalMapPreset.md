---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znsettingsglobalmappreset
schema: 2.0.0
---

# Get-ZNSettingsGlobalMapPreset

## SYNOPSIS
Returns the configured global map layer presets.

## SYNTAX

```
Get-ZNSettingsGlobalMapPreset [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the configured global map layer presets.

## EXAMPLES

### Example 1: Get global map settings
```powershell
Get-ZNSettingsGlobalMapPreset
```

```output
PresetClient : {Site Business Unit}
PresetCloud  : {}
PresetK8S    : {}
PresetOt     : {Site OTType}
PresetServer : {Application Environment}
```

This cmdlet gets the global map settings.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IGlobalMapLayerPresetsResponse

## NOTES

## RELATED LINKS

