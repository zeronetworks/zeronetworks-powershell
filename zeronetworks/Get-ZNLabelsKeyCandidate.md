---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znlabelskeycandidate
schema: 2.0.0
---

# Get-ZNLabelsKeyCandidate

## SYNOPSIS
Returns a list of key candidates for labels

## SYNTAX

```
Get-ZNLabelsKeyCandidate [-AccountName <String>] [-Limit <Int32>] [-Offset <Int32>] [-Search <String>]
 [-Sources <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of key candidates for labels

## EXAMPLES

### Example 1: List Label keys candidates
```powershell
(Get-ZNLabelsKeyCandidate).Items
```

```output
Id        Name
--        ----
DBServer  DBServer
DBServer2 DBServer2
Key       Key
Label     Label
test      test
```

This cmdlet lists label keys candidates.

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

### -Sources
Label sources to filter candidates by

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ILabelCandidates

## NOTES

## RELATED LINKS

