---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znassetsidentityqueued
schema: 2.0.0
---

# Get-ZNAssetsIdentityQueued

## SYNOPSIS
Returns a list of assets that are identity learning.

## SYNTAX

```
Get-ZNAssetsIdentityQueued [-AccountName <String>] [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>]
 [-Order <String>] [-OrderColumns <List<String>>] [-WithCount] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of assets that are identity learning.

## EXAMPLES

### Example 1: List identity learning assets
```powershell
(Get-ZNAssetsIdentityQueued).Items
```

```output
Id           Fqdn            IPV4Addresses IPV6Addresses               Source AssetStatus ProtectionState
--           ----            ------------- -------------               ------ ----------- ---------------
a:a:8ErCHXe8 DC01.posh.local {10.1.0.5}    {fe80::dd2c:f725:b57e:a4b1} 3      2           1
```

This cmdlet lists identity learning assets.

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
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Limit
Limit the return results

```yaml
Type: System.Int32
Parameter Sets: (All)
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
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Order
What order to sort the results

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

### -OrderColumns
what column to order on

```yaml
Type: System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WithCount
return count of objects

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISearchAssetsResponse

## NOTES

## RELATED LINKS

