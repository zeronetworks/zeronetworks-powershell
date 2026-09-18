---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-zngroupsoutboundrulesdestinationcandidate
schema: 2.0.0
---

# Get-ZNGroupsOutboundRulesDestinationCandidate

## SYNOPSIS
Returns a list of destination candidates for Outbound rules.

## SYNTAX

```
Get-ZNGroupsOutboundRulesDestinationCandidate -GroupId <String> -GroupType <String> -RuleType <Int32>
 [-AccountName <String>] [-CloudProvider <Int32>] [-Cursor <Int64>] [-Limit <Int32>] [-Search <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns a list of destination candidates for Outbound rules.

## EXAMPLES

### Example 1: Get destination candidates for an rule for a specific group
```powershell
$group = (Get-ZNGroup -Search "Domain controllers").Items | where {$_.Domain -eq "tag"}
(Get-ZNGroupsOutboundRulesDestinationCandidate -Groupid $group.id -GroupType tag).Items
```

```output
Domain     HasProtectionPolicy Id           Name
------     ------------------- --           ----
                               b:110001     Any asset
posh.local False               g:a:qu04AfTz Access Control Assistance Operators
posh.local False               g:a:XDRxcVDz Account Operators
posh.local False               g:a:MBAj0Xfx Administrators
posh.local False               g:a:u6xPbBLg Allowed RODC Password Replication Group
posh.local False               g:a:JjhBvgRW Backup Operators
OT/IoT     False               g:o:0T445453 Biometric entry systems
                               a:l:aayoPnNJ CS01
OT/IoT     False               g:o:04445453 Cameras
OT/IoT     False               g:o:0A445453 Card readers
posh.local False               g:a:j4oCHNuP Certificate Service DCOM Access
posh.local False               g:a:YeUXSDi6 Cert Publishers
posh.local                     a:a:8ErCHXe8 DC01
                               a:l:hC8rOTo0 Linux0
                               a:l:goXZ3fpT Linux1
                               a:l:FB8CBey8 Linux10
                               a:l:9CbKWeTW Linux100
                               a:l:ZVocc16n Linux1000
                               a:l:jhmIsjL9 Linux1001
                               a:l:8249TvxO Linux1002
                               a:l:aHMCQGN2 Linux1003
```

This cmdlet gets the possible destination candidates for a rule for a specific group.

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

### -GroupId
groupId to filter on

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

### -GroupType
group type to filter on

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ICandidatesList

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

