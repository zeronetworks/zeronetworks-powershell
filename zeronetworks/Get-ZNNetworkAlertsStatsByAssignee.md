---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znnetworkalertsstatsbyassignee
schema: 2.0.0
---

# Get-ZNNetworkAlertsStatsByAssignee

## SYNOPSIS
Returns the count of network alerts grouped by assignee.

## SYNTAX

```
Get-ZNNetworkAlertsStatsByAssignee [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the count of network alerts grouped by assignee.

## EXAMPLES

### Example 1: Get network alert stats by assignee
```powershell
Get-ZNNetworkAlertsStatsByAssignee
```

```output
AssigneeId   : 
AssigneeName : 
Count        : 16

AssigneeId   : 7df6ef28-c7f4-4d6b-83ee-25179d89c6d7
AssigneeName : User A
Count        : 4

AssigneeId   : u:a:nfryTLUQ
AssigneeName : User B
Count        : 2
```

This cmdlet gets network alert statistics by assignee.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.INetworkAlertStatsByAssignee

## NOTES

## RELATED LINKS

