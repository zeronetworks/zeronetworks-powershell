### Example 1: Get network alert stats over time
```powershell
Get-ZNNetworkAlertsStatsOverTime -TimeFrame 1 | select ThreatLevel,Count,DaySeconds
```

```output
ThreatLevel Count DaySeconds
----------- ----- ----------
          1     0 1786406400
          2     0 1786406400
          3     0 1786406400
          1     0 1786492800
          2     0 1786492800
          3     0 1786492800
...
```

This cmdlet gets network alert statistics over time.
