### Example 1: Set pilot group
```powershell
$cluster = Get-ZNSettingsDeploymentsCluster | where {$_.Name -eq "pilot"}
Update-ZNSettingsClusterPilotGroup -Product segment-server -ClusterId $cluster.Id
```

```output

```

This cmdlet sets the pilot group.
