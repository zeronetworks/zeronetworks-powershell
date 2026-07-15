### Example 1: List linux profiles
```powershell
Get-ZNSettingsLinuxProfile
```

```output
AllowInstallPackages : True
Id                   : l:c:0fda83cd
IsUsedByAsset        : True
Name                 : Default Linux Profile
Username             : zn-admin
```

This cmdlet lists linux profiles.

### Example 2: Get linux profile
```powershell
Get-ZNSettingsLinuxProfile -ProfileId l:c:0fda83cd
```

```output
AllowInstallPackages : True
Id                   : l:c:0fda83cd
IsUsedByAsset        : True
Name                 : Default Linux Profile
Username             : zn-admin
```

This cmdlet gets a linux profile.
