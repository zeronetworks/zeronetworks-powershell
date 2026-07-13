---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znassetslinuxprofile
schema: 2.0.0
---

# Get-ZNAssetsLinuxProfile

## SYNOPSIS
Returns all Linux profiles.

## SYNTAX

```
Get-ZNAssetsLinuxProfile [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns all Linux profiles.

## EXAMPLES

### Example 1: List linux profiles
```powershell
Get-ZNAssetsLinuxProfile
```

```output
AllowInstallPackages : True
Id                   : l:c:0fda83cd
IsUsedByAsset        : True
Name                 : Default Linux Profile
Username             : zn-admin
```

This cmdlet lists linux profiles.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ILinuxProfileList

## NOTES

## RELATED LINKS

