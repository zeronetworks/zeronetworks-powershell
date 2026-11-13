---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znsettingsdeploymentsclustersmappingsource
schema: 2.0.0
---

# Get-ZNSettingsDeploymentsClustersMappingSource

## SYNOPSIS
Returns the sources by which assets are mapped to the deployments cluster.

## SYNTAX

```
Get-ZNSettingsDeploymentsClustersMappingSource -DeploymentsClusterId <String> [-AccountName <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns the sources by which assets are mapped to the deployments cluster.

## EXAMPLES

### Example 1: Get mapping sources for deployment cluster
```powershell
Get-ZNSettingsDeploymentsClustersMappingSource -DeploymentsClusterId C:d:003bd888
```

```output
9
```

This cmdlet gets the mapping sources for a deployments cluster.

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

### -DeploymentsClusterId
.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IClusterMappingSourcesResponse

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

