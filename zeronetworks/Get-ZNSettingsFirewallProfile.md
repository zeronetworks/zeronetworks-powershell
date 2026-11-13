---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znsettingsfirewallprofile
schema: 2.0.0
---

# Get-ZNSettingsFirewallProfile

## SYNOPSIS
Returns the properties of firewall profiles in Firewall settings.

## SYNTAX

```
Get-ZNSettingsFirewallProfile [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the properties of firewall profiles in Firewall settings.

## EXAMPLES

### Example 1: Get Firewall Profiles settings
```powershell
Get-ZNSettingsFirewallProfile    
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

This cmdlet returns the Firewall Profiles settings.

## PARAMETERS

### -AccountName
this value is per customer / partner

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Read-ZNJWTtoken $env:ZNApiKey).aud.split(".")[0]
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISettingsFirewallProfiles

## NOTES

## RELATED LINKS

