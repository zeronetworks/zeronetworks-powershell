---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znconnectpolicy
schema: 2.0.0
---

# New-ZNConnectPolicy

## SYNOPSIS
Create a Connect Policy (User Access Configuration)

## SYNTAX

```
New-ZNConnectPolicy -AllowedRegions <String[]> -AlwaysOn -AutoDisconnectInOffice
 -ConnectivityStateAfterReboot <Int32> -DstEntityIdsList <String[]> -ForceSsoAuthentication
 -LoginAuthorizedEntityAllowedAssetIdsList <String[]>
 -LoginAuthorizedEntityAllowedAssetsSourcesList <String[]>
 -LoginAuthorizedEntityAllowedUsersIdsList <String[]> -Name <String> -SessionTtlHours <Int32> -UseDefaultIdp
 -UseExternalBrowserForSso [-AccountName <String>] [-ChangeTicket <String>] [-Description <String>]
 [-LoginAuthorizedEntityExcludedAssetIdsList <String[]>]
 [-LoginAuthorizedEntityExcludedUserIdsList <String[]>] [-PostureProfileIds <String[]>]
 [-PriorityDirection <String>] [-PriorityRoleId <String>] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Create a Connect Policy (User Access Configuration)

## EXAMPLES

### Example 1: Create a Connect Policy
```powershell
$users = (Get-ZNConnectPoliciesSourceUsersCandidate -Search zero).Items | where {$_.Name -eq "zero"}
$destinations = (Get-ZNConnectPoliciesDestinationsCandidate -Search "Internal Subnets").Items
$assets = (Get-ZNConnectPoliciesAssetsCandidate).Items | where {$_.Name -eq "Any Asset"}
New-ZNConnectPolicy -DstEntityIdsList @($destinations.id) -LoginAuthorizedEntityAllowedUsersIdsList @($users.id) -Name UAC -SessionTtlHours 168 -ConnectivityStateAfterReboot 1 -LoginAuthorizedEntityAllowedAssetIdsList @($assets.Id) -LoginAuthorizedEntityAllowedAssetsSourcesList @(1) -AllowedRegions "b:110007"
```

This cmdlet creates a Connect policy.

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

### -AllowedRegions
.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AlwaysOn
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

### -AutoDisconnectInOffice
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

### -ChangeTicket
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

### -ConnectivityStateAfterReboot
dictionary: * '1' Previous connectivity state * '2' Connected (Always-on) * '3' Disconnected * '4' Signed out

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

### -DstEntityIdsList
.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForceSsoAuthentication
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

### -LoginAuthorizedEntityAllowedAssetIdsList
.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LoginAuthorizedEntityAllowedAssetsSourcesList
.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LoginAuthorizedEntityAllowedUsersIdsList
.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LoginAuthorizedEntityExcludedAssetIdsList
.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LoginAuthorizedEntityExcludedUserIdsList
.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
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

### -PostureProfileIds
.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PriorityDirection
Place the policy above or below the anchor role, or at the top or bottom of the list.

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

### -PriorityRoleId
The ID of the anchor role.
Required when direction is ABOVE or BELOW.

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

### -SessionTtlHours
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

### -UseDefaultIdp
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

### -UseExternalBrowserForSso
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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IPaths1Yz2Jj8ConnectPoliciesPostResponses200ContentApplicationJsonSchema

## NOTES

## RELATED LINKS

