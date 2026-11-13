### Example 1: Update ignored GPO rules for Anti-tampering
```powershell
$settingsignore = Get-ZNSettingsFirewallIgnoredRule
Update-ZNSettingsFirewallIgnoredRule -InboundList $settingsignore.InboundList -OutboundList @("newruletoignore")
```

```output
InboundList OutboundList
----------- ------------
{test}      {newruletoignore}
```

This cmdlet updates the rules to ignore for Antitampering.