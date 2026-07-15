### Example 1: Assign a linux profile
```powershell
$linuxprofile = Get-ZNSettingsLinuxProfile -ProfileId l:c:0fda83cd
Update-ZNAssetsLinuxProfile -AssetIds @("a:n:c9PBr848") -ProfileId $linuxprofile.Id
```

```output

```

This cmdlet assigns a linux profile to assets.
