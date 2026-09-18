---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znuseroutboundrulesdestinationcandidate
schema: 2.0.0
---

# Get-ZNUserOutboundRulesDestinationCandidate

## SYNOPSIS
Returns a list of destination candidates for Outbound rules.

## SYNTAX

```
Get-ZNUserOutboundRulesDestinationCandidate -UserId <String> -RuleType <Int32> [-AccountName <String>]
 [-CloudProvider <Int32>] [-Cursor <Int64>] [-Limit <Int32>] [-Search <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of destination candidates for Outbound rules.

## EXAMPLES

### Example 1: List destination candidates for a rule
```powershell
$user = (Get-ZNUser -Search zero).Items | where {$_.Name -eq "zero"}
(Get-ZNUserOutboundRulesDestinationCandidate -UserId $user.Id -RuleType 3).Items
```

```output
Id           Name                                    Domain
--           ----                                    ------
b:110001     Any asset                               
g:o:1Lda83cd 3D Printer                              OT/IoT
g:a:5C0h1yd5 Access Control Assistance Operators     posh.local
g:o:1Kda83cd Access control devices                  OT/IoT
g:o:1Mda83cd Access control gateway                  OT/IoT
g:a:HJWKrlHo Account Operators                       posh.local
a:t:BPFR4ZlN activeOT                                
g:a:HBWuhIUi Administrators                          posh.local
a:n:c9PBr848 al01                                    
g:a:9vY3VFbm Allowed RODC Password Replication Group posh.local
g:o:1Nda83cd ATM                                     OT/IoT
```

This cmdlet lists destination candidates for a rule.

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

### -CloudProvider
cloud provider of the rule's local entity, used to offer provider specific candidates such as Azure service tags

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

### -Cursor
cursor position to start at

```yaml
Type: System.Int64
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

### -RuleType
rule type to filter on

```yaml
Type: System.Int32
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

### -UserId
userId to filter on

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ICandidatesList

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

