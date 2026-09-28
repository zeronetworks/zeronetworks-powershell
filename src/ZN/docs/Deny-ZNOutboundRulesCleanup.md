---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/deny-znoutboundrulescleanup
schema: 2.0.0
---

# Deny-ZNOutboundRulesCleanup

## SYNOPSIS
Deny deleting a rule AE suggested for cleanup

## SYNTAX

### DenyExpanded (Default)
```
Deny-ZNOutboundRulesCleanup -RuleId <String> [-AccountName <String>] [-Details <String>] [-Reason <Int32>]
 [-PassThru] [-Confirm] [-WhatIf] [<CommonParameters>]
```

### Deny
```
Deny-ZNOutboundRulesCleanup -RuleId <String> -Body <IRuleReviewReason> [-AccountName <String>] [-PassThru]
 [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Deny deleting a rule AE suggested for cleanup

## EXAMPLES

### Example 1: Deny a suggested rule deletion
```powershell
Deny-ZNOutboundRulesCleanup -RuleId 14ecd0ea-7fc6-4258-910f-ba2fa509d2c2
```

This cmdlet denies a suggested rule deletion.

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

### -Body
Mandatory object for rule review approve_with_changes / reject.

reason: {
 HUMAN_TRAFFIC_COVERED_BY_MFA = 1,
 TIGHTEN_RULE_SCOPE = 2,
 MISSING_PORT_OR_PROCESS = 3,
 AFFECTED_ENTITIES_CONTAINED_IN_AN_EXISTING_GROUP = 4,
 REDUNDANT_RULE = 5,
 TRAFFIC_SHOULD_BE_BLOCKED = 6,
 OTHER = 7
}

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IRuleReviewReason
Parameter Sets: Deny
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Details
Optional if reason != OTHER(7), mandatory if reason == OTHER(7)

```yaml
Type: System.String
Parameter Sets: DenyExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
Returns true when the command succeeds

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Reason
.

```yaml
Type: System.Int32
Parameter Sets: DenyExpanded
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RuleId
The id of the rule

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

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IRuleReviewReason

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.


`BODY <IRuleReviewReason>`: Mandatory object for rule review approve_with_changes / reject.          reason: {          HUMAN_TRAFFIC_COVERED_BY_MFA = 1,          TIGHTEN_RULE_SCOPE = 2,          MISSING_PORT_OR_PROCESS = 3,          AFFECTED_ENTITIES_CONTAINED_IN_AN_EXISTING_GROUP = 4,          REDUNDANT_RULE = 5,          TRAFFIC_SHOULD_BE_BLOCKED = 6,          OTHER = 7         }
  - `Reason <Int32>`: 
  - `[Details <String>]`: Optional if reason != OTHER(7), mandatory if reason == OTHER(7)

## RELATED LINKS

