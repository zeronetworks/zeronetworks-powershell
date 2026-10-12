### Example 1: Add secondary domain
```powershell
$forest = Get-ZNSettingsAd | where {$_.ActiveDirectoryInfoDomainName -eq "newforest.local"}
New-ZNSettingsAdSecondary -ForestId $$forest.ForestId -Dc dc.child.newforest.local -Domain child.newforest.local
```

```output

```

This cmdlet adds a secondary domain in AD settings.
