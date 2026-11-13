### Example 1: Update Firewall profile settings
```powershell
$fwprofiles = Get-ZNSettingsFirewallProfile
Update-ZNSettingsFirewallProfile -InboundAllowDomain:$fwprofiles.InboundAllowDomain -InboundAllowPrivate:$fwprofiles.InboundAllowPrivate -InboundAllowPublic:$true -InboundBlockDomain:$fwprofiles.InboundBlockDomain -InboundBlockPrivate:$fwprofiles.InboundBlockPrivate -InboundBlockPublic:$fwprofiles.InboundBlockPublic -OutboundBlockDomain:$fwprofiles.OutboundBlockDomain -OutboundBlockPrivate:$fwprofiles.OutboundBlockPrivate -OutboundBlockPublic:$fwprofiles.OutboundBlockPublic 
```

```output
InboundAllowDomain   : True
InboundAllowPrivate  : True
InboundAllowPublic   : True
InboundBlockDomain   : True
InboundBlockPrivate  : True
InboundBlockPublic   : True
OutboundBlockDomain  : True
OutboundBlockPrivate : True
OutboundBlockPublic  : True
```

This cmdlet updates the Firewall profiles settings.