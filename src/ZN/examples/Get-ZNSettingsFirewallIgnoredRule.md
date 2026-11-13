### Example 1: Get Anti-tampering - Windows firewall rule exclusions settings
```powershell
Get-ZNSettingsFirewallIgnoredRule
```

```output
InboundList OutboundList
----------- ------------
{test}      {}
```

This cmdlet returns the Anti-tampering - Windows firewall rule exclusions settings.