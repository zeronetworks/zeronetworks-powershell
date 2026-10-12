---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znconnectpoliciesexcludeddestinationscandidate
schema: 2.0.0
---

# Get-ZNConnectPoliciesExcludedDestinationsCandidate

## SYNOPSIS
Returns a list of candidates for Connect Policy excluded destinations.
Only IPv4 subnets typed as free text are returned.

## SYNTAX

```
Get-ZNConnectPoliciesExcludedDestinationsCandidate [-AccountName <String>] [-Limit <Int32>] [-Offset <Int32>]
 [-Search <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of candidates for Connect Policy excluded destinations.
Only IPv4 subnets typed as free text are returned.

## EXAMPLES

### Example 1: List excluded destination candidates
```powershell
Get-ZNConnectPoliciesExcludedDestinationsCandidate
```

```output
Cursor Items ScrollCursor
------ ----- ------------
       {} 
```

This cmdlet lists excluded destination candidates.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IAssetsOrGroupsList

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

