### Example 1: Update an alert
```powershell
$alert = (Get-ZNNetworkAlert).Items | select -First 1
Update-ZNNetworkAlert -AlertId $alert.alertid -Comment "Investigating"
```

```output

```

This cmdlet updates an alet.
