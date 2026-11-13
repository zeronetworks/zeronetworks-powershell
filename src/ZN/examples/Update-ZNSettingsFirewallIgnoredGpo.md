### Example 1: Update ignored GPO rules for Asset Health
```powershell
$settingsgpo = Get-ZNSettingsFirewallIgnoredGpo
Update-ZNSettingsFirewallIgnoredGpo -InboundList $settingsgpo.InboundList -OutboundList @("newruletoignore")
```

```output
InboundList OutboundList
----------- ------------
{test}      {newruletoignore}
```

This cmdlet updates the GPO rules to ignore for Asset Health.