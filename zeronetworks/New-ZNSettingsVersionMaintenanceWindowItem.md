---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znsettingsversionmaintenancewindowitem
schema: 2.0.0
---

# New-ZNSettingsVersionMaintenanceWindowItem

## SYNOPSIS
Create a in-memory object for VersionMaintenanceWindowBodyMaintenanceWindowsItem

## SYNTAX

```
New-ZNSettingsVersionMaintenanceWindowItem -WeekDay <String> [-StartTime <Object>] [<CommonParameters>]
```

## DESCRIPTION
Create a in-memory object for VersionMaintenanceWindowBodyMaintenanceWindowsItem

## EXAMPLES

### Example 1: Create maint window item
```powershell
New-ZNSettingsVersionMaintenanceWindowItem -WeekDay Sunday -StartTime 2
```

```output
Description StartTimeUtc Weekday
----------- ------------ -------
                       2       1
```

This cmdlet creates an in-memory maintenance window item.

## PARAMETERS

### -StartTime
Which hour to start

```yaml
Type: System.Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WeekDay
Day of the week

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.VersionMaintenanceWindowBodyMaintenanceWindowsItem

## NOTES

## RELATED LINKS

