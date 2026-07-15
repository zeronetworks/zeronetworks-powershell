---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znswitch
schema: 2.0.0
---

# Get-ZNSwitch

## SYNOPSIS
Gets a switch

## SYNTAX

### List (Default)
```
Get-ZNSwitch [-AccountName <String>] [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>] [-WithCount]
 [<CommonParameters>]
```

### Get
```
Get-ZNSwitch -SwitchId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Gets a switch

## EXAMPLES

### Example 1: List switches
```powershell
(Get-ZNSwitch).items
```

```output
HealthStateHealthIssuesList : {}
HealthStateHealthStatus     : 1
IP                          : 192.168.2.251
Id                          : w:c:IBlczUkw
InterfacesList              : {GigabitEthernet1, GigabitEthernet2, GigabitEthernet3, GigabitEthernet4}
MonitorInterfaceOnOtAdded   : True
MonitorOnInterfaceDiscovery : False
Name                        : eve
NumOfOts                    : 0
Type                        : 1
Username                    : zero
```

This cmdlet lists switches.

### Example 2: Get a switch
```powershell
Get-ZNSwitch -SwitchId w:c:IBlczUkw
```

```output
EntityIP                          : 192.168.2.251
EntityId                          : w:c:IBlczUkw
EntityInterfacesList              : {GigabitEthernet1, GigabitEthernet2, GigabitEthernet3, GigabitEthernet4}
EntityMonitorInterfaceOnOtAdded   : True
EntityMonitorOnInterfaceDiscovery : False
EntityName                        : eve
EntityNumOfOts                    : 1
EntityType                        : 1
EntityUsername                    : zero
HealthStateHealthIssuesList       : {}
HealthStateHealthStatus           : 1
Permission                        : 3
```

This cmdlet gets a switch.

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

### -Filters
JSON string URI encoded set of filters

```yaml
Type: System.String
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Limit
Limit the return results

```yaml
Type: System.Int32
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
```

### -Offset
Used to page through results

```yaml
Type: System.Int32
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -SwitchId
switch to delete

```yaml
Type: System.String
Parameter Sets: Get
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WithCount
return count of objects

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: $true
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISwitchItem

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISwitchList

## NOTES

## RELATED LINKS

