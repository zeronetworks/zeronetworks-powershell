### Example 1: Get network alert stats by threat level
```powershell
(Get-ZNNetworkAlertsStatsByThreatLevel).Items
```

```output
Count ThreatLevel
----- -----------
    0           1
   16           2
    6           3
```

This cmdlet gets network alert statistics by threat level.
