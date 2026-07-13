### Example 1: Delete a linux profile
```powershell
$linuxprofile = Get-ZNSettingsLinuxProfile -ProfileId l:c:LCxeVK79
Remove-ZNSettingsLinuxProfile -ProfileId $linuxprofile.Id
```

```output

```

This cmdlet deletes a linux profile.
