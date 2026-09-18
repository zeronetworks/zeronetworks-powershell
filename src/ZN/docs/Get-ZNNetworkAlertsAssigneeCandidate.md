---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znnetworkalertsassigneecandidate
schema: 2.0.0
---

# Get-ZNNetworkAlertsAssigneeCandidate

## SYNOPSIS
Returns a list of assignee candidates for the assignee filter, including an \"Unassigned\" pseudo-candidate.

## SYNTAX

```
Get-ZNNetworkAlertsAssigneeCandidate [-AccountName <String>] [-Limit <Int32>] [-Search <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns a list of assignee candidates for the assignee filter, including an \"Unassigned\" pseudo-candidate.

## EXAMPLES

### Example 1: List candidates for assigning an alert
```powershell
Get-ZNNetworkAlertsAssigneeCandidate
```

```output
Email                            Id                                   Name
-----                            --                                   ----
                                                                      Unassigned
albert@zeronetworks.com          u:d:AfQefRZK                         Albert Estevez Polo
alberto.lopez@zeronetworks.com   u:a:aZH3vDal                         Alberto Fernández López
amir@zeronetworks.com            u:a:nfryTLUQ                         Amir Frankel
benny@zeronetworks.com           u:a:OOdYqjWI                         Benny Lakunishok
chris.boehm@zeronetworks.com     u:a:muMtJ1am                         Christopher Paul Boehm
ce@zeronetworks.com              u:d:mEKUmFvS                         Customer Engineering
dotan.liba@zeronetworks.com      u:a:EiXwr9G7                         Dotan Liba
dotan.liba+test@zeronetworks.com 88a0bcee-c639-4831-b837-7bb99eb98cc8 dotan+test
eladmanor+test@zeronetworks.com  7df6ef28-c7f4-4d6b-83ee-25179d89c6d7 Elad Manor
ema@zeronetworks.com             u:a:Jl8kZSiQ                         Emanuele Bianchi
```

This cmdlet lists candidates for assigning a network alert.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.INetworkAlertAssigneeCandidateList

## NOTES

## RELATED LINKS

