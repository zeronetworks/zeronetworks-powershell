---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/update-znnetworkonboardingpolicy
schema: 2.0.0
---

# Update-ZNNetworkOnboardingPolicy

## SYNOPSIS
Returns the updated settings for the network onboarding policy.

## SYNTAX

```
Update-ZNNetworkOnboardingPolicy -ProtectionPolicyId <String> -EnforceBlocks
 -ExistingMembersLearningDays <Int32> -NewMembersLearningDays <Int32> [-AccountName <String>]
 [-Description <String>] [-Enabled] [-Id <String>] [-OutboundExternalEnabled]
 [-OutboundExternalExistingMembersLearningDays <Int32>] [-OutboundExternalNewMembersLearningDays <Int32>]
 [-OutboundInternalEnabled] [-OutboundInternalExistingMembersLearningDays <Int32>]
 [-OutboundInternalNewMembersLearningDays <Int32>] [-OutboundInternalSharedMachine] [-Confirm] [-WhatIf]
 [<CommonParameters>]
```

## DESCRIPTION
Returns the updated settings for the network onboarding policy.

## EXAMPLES

### Example 1: Update Network onboarding policies
```powershell
Update-ZNNetworkOnboardingPolicy -OnboardingPolicyId "a36d67e7-8497-4a31-a39b-24e73a6b5c78" -ExistingMembersLearningDays 60 -NewMembersLearningDays 60
```

```output
CreatedByEmail                       : 
CreatedByEnforcementSource           : 4
CreatedById                          : m:ea53c6e1d0072c5974ceec597b64989274b7ba5f
CreatedByName                        : powershell
CreatedByUserRole                    : 4
GroupInfoDomain                      : system
GroupInfoGuid                        : 56779f63-9c03-4c5a-9312-cfc7964fc827
GroupInfoHasIdentityProtectionPolicy : False
GroupInfoHasNetworkProtectionPolicy  : False
GroupInfoId                          : g:s:03669ce2
GroupInfoName                        : Servers
ItemCreatedAt                        : 1726073476732
ItemDescription                      : 
ItemEnabled                          : True
ItemEnforceBlocks                    : False
ItemExistingMembersLearningDays      : 60
ItemGroupId                          : g:s:03669ce2
ItemId                               : a36d67e7-8497-4a31-a39b-24e73a6b5c78
ItemInitialProtectAt                 : 1731355186489
ItemNewMembersLearningDays           : 60
ItemPolicyType                       : 1
ItemUpdatedAt                        : 1726169614643
```

This cmdlet updates an Network onboarding policy.

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

### -Description
.

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

### -Enabled
.

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

### -EnforceBlocks
.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExistingMembersLearningDays
.

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

### -Id
.

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

### -NewMembersLearningDays
.

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

### -OutboundExternalEnabled
.

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

### -OutboundExternalExistingMembersLearningDays
.

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

### -OutboundExternalNewMembersLearningDays
.

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

### -OutboundInternalEnabled
.

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

### -OutboundInternalExistingMembersLearningDays
.

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

### -OutboundInternalNewMembersLearningDays
.

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

### -OutboundInternalSharedMachine
.

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

### -ProtectionPolicyId
The id of the onboarding policy

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

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IProtectionPolicyResponse

## NOTES

## RELATED LINKS

