---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znassetsipalias
schema: 2.0.0
---

# Get-ZNAssetsIPAlias

## SYNOPSIS
Returns the properties of an IP Alias.

## SYNTAX

### List (Default)
```
Get-ZNAssetsIPAlias [-AccountName <String>] [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>]
 [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNAssetsIPAlias -IPAliasId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the properties of an IP Alias.

## EXAMPLES

### Example 1: List IP aliases
```powershell
(Get-ZNAssetsIPAlias).Items
```

```output
Alias             : NewIpAlias
CreatedAt         : 1765466672902
CreatedById       : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
CreatedByName     : powershell-module-development
EnforcementSource : 5
IP                : 1.1.1.26
Id                : e:i:ZocZFJ6s
UpdatedAt         : 
UpdatedById       : 
UpdatedByName     : 

Alias             : NewIPAlias
CreatedAt         : 1765464092001
CreatedById       : 1f352ed0-86f1-454f-90a5-592c197c8000
CreatedByName     : Zero Networks
EnforcementSource : 5
IP                : 1.1.1.10
Id                : e:i:TgXxpb4l
UpdatedAt         : 
UpdatedById       : 
UpdatedByName     : 

Alias             : NewName
CreatedAt         : 1765990389293
CreatedById       : m:3929d40ebf7ecfe8dbce815b1c97ea93c2b2aa59
CreatedByName     : poshtesting
EnforcementSource : 5
IP                : 2.2.2.4
Id                : e:i:69k7DDLZ
UpdatedAt         : 1780415616690
UpdatedById       : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
UpdatedByName     : powershell-module-development
```

This cmdlet lists IP aliases.

### Example 2: Get an IP Alias
```powershell
Get-ZNAssetsIPAlias -IPAliasId e:i:69k7DDLZ
```

```output
CreatedById           : m:3929d40ebf7ecfe8dbce815b1c97ea93c2b2aa59
CreatedByName         : poshtesting
ItemAlias             : NewName
ItemCreatedAt         : 1765990389293
ItemEnforcementSource : 5
ItemIP                : 2.2.2.4
ItemId                : e:i:69k7DDLZ
ItemUpdatedAt         : 1780415616690
UpdatedById           : m:080b3a44fa9a5d27f2843819bc4687a4dca8f20e
UpdatedByName         : powershell-module-development
```

This cmdlet gets an IP alias.

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

### -Filters
JSON string URI encoded set of filters

```yaml
Type: System.String
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IPAliasId
IP Alias ID

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

### -Limit
Limit the return results

```yaml
Type: System.Int32
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
```

### -Offset
Used to page through results

```yaml
Type: System.Int32
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -WithCount
return count of objects

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: $true
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IAssetIPAliasItem

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IAssetIPAliasList

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

