---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znsettingslinuxprofile
schema: 2.0.0
---

# Get-ZNSettingsLinuxProfile

## SYNOPSIS
Returns a Linux profile by its ID.

## SYNTAX

### List (Default)
```
Get-ZNSettingsLinuxProfile [-AccountName <String>] [<CommonParameters>]
```

### Get
```
Get-ZNSettingsLinuxProfile -ProfileId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a Linux profile by its ID.

## EXAMPLES

### Example 1: List linux profiles
```powershell
Get-ZNSettingsLinuxProfile
```

```output
AllowInstallPackages : True
Id                   : l:c:0fda83cd
IsUsedByAsset        : True
Name                 : Default Linux Profile
Username             : zn-admin
```

This cmdlet lists linux profiles.

### Example 2: Get linux profile
```powershell
Get-ZNSettingsLinuxProfile -ProfileId l:c:0fda83cd
```

```output
AllowInstallPackages : True
Id                   : l:c:0fda83cd
IsUsedByAsset        : True
Name                 : Default Linux Profile
Username             : zn-admin
```

This cmdlet gets a linux profile.

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

### -ProfileId
The Linux profile id

```yaml
Type: System.String
Parameter Sets: Get
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ILinuxProfile

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ILinuxProfileList

## NOTES

## RELATED LINKS

