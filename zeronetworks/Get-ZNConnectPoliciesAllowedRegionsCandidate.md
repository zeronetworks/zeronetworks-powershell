---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znconnectpoliciesallowedregionscandidate
schema: 2.0.0
---

# Get-ZNConnectPoliciesAllowedRegionsCandidate

## SYNOPSIS
Returns a list of candidates for Connect Policy allowed regions.

## SYNTAX

```
Get-ZNConnectPoliciesAllowedRegionsCandidate [-AccountName <String>] [-Limit <Int32>] [-Offset <Int32>]
 [-Search <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of candidates for Connect Policy allowed regions.

## EXAMPLES

### Example 1: List Connect policies
```powershell
Get-ZNConnectPolicy
```

```output
AlwaysOn AutoDisconnectInOffice ChangeTicket ConnectivityStateAfterReboot CreatedAt     Description ForceSsoAut
                                                                                                    hentication
-------- ---------------------- ------------ ---------------------------- ---------     ----------- -----------
False    False                  123          1                            1775244453929             False      
False    False                               2                            1746151937604 newtest     False      
False    False                               1                            1784683943125             False      
True     True                                1                            1784728780581             True   
```

This cmdlet lists Connect policies.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IConnectRegionsList

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

