---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/update-znsettingsversionmaintenancewindow
schema: 2.0.0
---

# Update-ZNSettingsVersionMaintenanceWindow

## SYNOPSIS
Modify version maintenance window

## SYNTAX

```
Update-ZNSettingsVersionMaintenanceWindow -Product <String> [-AccountName <String>]
 [-MaintenanceWindows <IVersionMaintenanceWindowBodyMaintenanceWindowsItem[]>] [-PassThru] [-Confirm]
 [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Modify version maintenance window

## EXAMPLES

### Example 1: Update maint window
```powershell
$maintwindow = New-ZNSettingsVersionMaintenanceWindow -StartTime 0 -WeekDay Sunday
Update-ZNSettingsVersionMaintenanceWindow -Product segment-server -MaintenanceWindows @($maintwindow)
```

This cmdlet updates a product maintenance window.

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

### -MaintenanceWindows
.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IVersionMaintenanceWindowBodyMaintenanceWindowsItem[]
Parameter Sets: (All)
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

### -Product
Product type for which to modify or fetch the version maintenance window

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

## NOTES

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.


`MAINTENANCEWINDOWS <IVersionMaintenanceWindowBodyMaintenanceWindowsItem[]>`: .
  - `StartTimeUtc <Int32>`: Start hour of maintenance window (0–24)
  - `Weekday <Int32>`: Day of week (1 = Sunday, 7 = Saturday)
  - `[Description <String>]`: Optional description of the version maintenance window

## RELATED LINKS

