---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znnetworkalertexclusionsalerttypecandidate
schema: 2.0.0
---

# Get-ZNNetworkAlertExclusionsAlertTypeCandidate

## SYNOPSIS
Returns the alert types that already appeared in this environment.

## SYNTAX

```
Get-ZNNetworkAlertExclusionsAlertTypeCandidate [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the alert types that already appeared in this environment.

## EXAMPLES

### Example 1: List alert type exclusion candidates
```powershell
Get-ZNNetworkAlertExclusionsAlertTypeCandidate
```

```output
Category                    Description
--------                    -----------                                                                                                                            
ANOMALOUS_PROCESS_BEHAVIOUR We have identified non standard processes using sensitive ports. We suggest you investigate the asset for malicious activity.          
ANOMALOUS_PROCESS_BEHAVIOUR We have identified non standard processes using sensitive ports. We suggest you investigate the asset for malicious activity.          
ANOMALOUS_RUNTIME           We have identified a known malicious process running on the asset. We suggest you investigate the related activities of the asset and …
ANOMALOUS_RUNTIME           We have identified processes running from non standard paths. We suggest you investigate the asset for malicious activity.             
ANOMALOUS_RUNTIME           We have identified processes running from non standard paths. We suggest you investigate the asset for malicious activity.             
ANOMALOUS_RUNTIME           We have identified processes running from non standard paths. We suggest you investigate the asset for malicious activity.             
ANOMALOUS_RUNTIME           We have identified processes running from non standard paths. We suggest you investigate the asset for malicious activity.             
ATTACK_TOOLS                We have identified a known malicious process running on the asset. We suggest you investigate the related activities of the asset and …
ATTACK_TOOLS                We have identified a known malicious process running on the asset. We suggest you investigate the related activities of the asset and …
ATTACK_TOOLS                We have identified a known malicious process running on the asset. We suggest you investigate the related activities of the asset and …
ATTACK_TOOLS                We have identified a known malicious process running on the asset. We suggest you investigate the related activities of the asset and …
RECONNAISSANCE              We have identified a known network scanner tool running on the asset. We suggest you investigate the related activities of the asset a…
RECONNAISSANCE              We have identified a known malicious process running on the asset. We suggest you investigate the related activities of the asset and …
SECURITY_VALIDATION_TOOLS   We have identified a commercial security validation tool. We suggest you verify this is a sanctioned tool targeting only relevant asse…
SOCIAL_ENGINEERING          We have identified a known malicious process running on the asset. We suggest you investigate the related activities of the asset and …
```

This cmdlet lists alert types that can be ecluded in network alerts.

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.INetworkAlertTypeList

## NOTES

## RELATED LINKS

