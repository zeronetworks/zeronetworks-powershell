---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-zninboundrulessourcecandidate
schema: 2.0.0
---

# Get-ZNInboundRulesSourceCandidate

## SYNOPSIS
Returns a list of source candidates for Inbound rules.

## SYNTAX

```
Get-ZNInboundRulesSourceCandidate -RuleType <Int32> [-AccountName <String>] [-CloudProvider <Int32>]
 [-Cursor <Int64>] [-Limit <Int32>] [-Search <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of source candidates for Inbound rules.

## EXAMPLES

### Example 1: List source candidates for inbound allow rule
```powershell
(Get-ZNInboundRulesSourceCandidate).Items
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
OT/IoT     False               g:o:04445453 Cameras
OT/IoT     False               g:o:0A445453 Card readers
posh.local False               g:a:j4oCHNuP Certificate Service DCOM Access
posh.local False               g:a:YeUXSDi6 Cert Publishers
posh.local                     a:a:8ErCHXe8 DC01
                               a:l:Bn5E1jNy linux908049
                               a:l:mnVw2OZs ls01
                               a:t:u7QxbAUn ot193384
                               a:t:aCxJya46 switch01
                               a:t:YunW9uyd test
posh.local                     a:a:t8SZ1cp2 TS01
posh.local                     a:a:OtfLGUBq WC01
```

This cmdlet lists the source candidates for an inbound rule.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ICandidatesList

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

