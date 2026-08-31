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
