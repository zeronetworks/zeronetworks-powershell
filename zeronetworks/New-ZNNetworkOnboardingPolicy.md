---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znnetworkonboardingpolicy
schema: 2.0.0
---

# New-ZNNetworkOnboardingPolicy

## SYNOPSIS
Returns the network onboarding policy that was created.

## SYNTAX

```
New-ZNNetworkOnboardingPolicy -ExistingMembersLearningDays <Int32> -GroupId <String>
 -NewMembersLearningDays <Int32> [-AccountName <String>] [-Description <String>] [-Enabled] [-EnforceBlocks]
 [-MaintenanceWindowId <String>] [-OutboundExternalEnabled]
 [-OutboundExternalExistingMembersLearningDays <Int32>] [-OutboundExternalNewMembersLearningDays <Int32>]
 [-OutboundInternalEnabled] [-OutboundInternalExistingMembersLearningDays <Int32>]
 [-OutboundInternalNewMembersLearningDays <Int32>] [-OutboundInternalSharedMachine] [-Confirm] [-WhatIf]
 [<CommonParameters>]
```

## DESCRIPTION
Returns the network onboarding policy that was created.

## EXAMPLES

### Example 1: Create an Network onboarding policy
```powershell
New-ZNNetworkOnboardingPolicy -GroupId g:s:03669ce2 -ExistingMembersLearningDays 30 -NewMembersLearningDays 30 -Enabled:$false
```

```output
CreatedByEmail                       : 
CreatedByEnforcementSource           : 6
CreatedById                          : m:ea53c6e1d0072c5974ceec597b64989274b7ba5f
CreatedByName                        : powershell
CreatedByUserRole                    : 4
GroupInfoDomain                      : system
GroupInfoGuid                        : 56779f63-9c03-4c5a-9312-cfc7964fc827
GroupInfoHasIdentityProtectionPolicy : False
GroupInfoHasNetworkProtectionPolicy  : False
GroupInfoId                          : g:s:03669ce2
GroupInfoName                        : Servers
ItemCreatedAt                        : -62135596800000
ItemDescription                      : 
ItemEnabled                          : False
ItemEnforceBlocks                    : False
ItemExistingMembersLearningDays      : 30
ItemGroupId                          : g:s:03669ce2
ItemId                               : a36d67e7-8497-4a31-a39b-24e73a6b5c78
ItemInitialProtectAt                 : 1728665476730
ItemNewMembersLearningDays           : 30
ItemPolicyType                       : 1
ItemUpdatedAt                        : 
```

This cmdlet creates an network onboarding learning policy

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

Required: False
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

### -GroupId
.

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

### -MaintenanceWindowId
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

