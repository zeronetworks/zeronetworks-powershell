---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znassetmemberof
schema: 2.0.0
---

# Get-ZNAssetMemberOf

## SYNOPSIS
Returns a list of groups the asset is a member of.

## SYNTAX

```
Get-ZNAssetMemberOf -AssetId <String> [-AccountName <String>] [-Filters <String>] [-Limit <Int32>]
 [-Offset <Int32>] [-Order <String>] [-OrderColumns <List<String>>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of groups the asset is a member of.

## EXAMPLES

### Example 1: Get groups an asset is a member of
```powershell
Get-ZNAssetMemberOf -AssetId a:a:ZgBWOMyc
```

```output
CreatedAt     Description                                               DirectMembersCount Domain    Guid
---------     -----------                                               ------------------ ------    ----                             
1656865698131 Includes all Domain Controllers in the environment        1                  tag       1246686d-9e06-488a-ae88-414fc3fd…
1656865701309 Includes all servers in the environment                   3                  system    93cc0251-4c7f-4a2f-80fe-3be0cde8…
1665690993630 test                                                      1                  custom    333e66cb-d28e-40a2-ad55-d7a02886…
1646147850799                                                           0                  zero.labs cc9609dd-ae64-45ea-a736-02432f54…
1667984779503 Includes all remotely monitored assets in the environment 8                  system    0b7e476e-8368-49c1-a066-38078d05…
1675962079610 test3                                                     3                  custom    1ed72a4a-8777-4cb8-86bf-4479df01…
```

This cmdlet returns the groups an asset is a member of.

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
Type: System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=8.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
Parameter Sets: (All)
Aliases:

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IGroupsList

## NOTES

## RELATED LINKS

