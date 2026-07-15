---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znsettingspilotgroupcandidate
schema: 2.0.0
---

# Get-ZNSettingsPilotGroupCandidate

## SYNOPSIS
Returns a list of candidate assets for the pilot group

## SYNTAX

```
Get-ZNSettingsPilotGroupCandidate -OSType <String> -Product <String> [-AccountName <String>] [-Cursor <Int32>]
 [-Limit <Int32>] [-Search <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of candidate assets for the pilot group

## EXAMPLES

### Example 1: List pilot group candidates
```powershell
Get-ZNSettingsPilotGroupCandidate -OSType windows -Product cloud-connector
```

```output
AssetStatus              : 7
AssetType                : 1
BreakGlassActivated      : False
Domain                   : posh.local
Id                       : a:a:o8w4Bpq7
IdentityProtectionState  : 3
IsQuarantined            : 
Name                     : WC01
OtLocattionInterfaceName : 
OtLocattionName          : 
OtLocattionSwitchId      : 
ProtectionState          : 3
RpcProtectionState       : 3
```

This cmdlet lists candidates for a pilot group.

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

### -Cursor
Cursor position (offset) to start at

```yaml
Type: System.Int32
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

### -OSType
OS type for pilot group

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

### -Search
Test to search for

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IAssetBasicInfoList

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

