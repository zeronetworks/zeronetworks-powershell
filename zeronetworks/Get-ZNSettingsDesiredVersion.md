---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znsettingsdesiredversion
schema: 2.0.0
---

# Get-ZNSettingsDesiredVersion

## SYNOPSIS
Get desired version

## SYNTAX

```
Get-ZNSettingsDesiredVersion -Dvplatform <String> -Product <String> [-AccountName <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Get desired version

## EXAMPLES

### Example 1: Get current desired version
```powershell
Get-ZNSettingsDesiredVersion -Product segment-server -Dvplatform WIN_X64
```

```output
VersionInfoReason VersionInfoVersion
----------------- ------------------
                2 24.6.19.5
```

This cmdlet gets the desired version.

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

### -Dvplatform
platform

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

### -Product
Product type for which to modify or fetch the version maintenance window

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IDesiredVersion

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

