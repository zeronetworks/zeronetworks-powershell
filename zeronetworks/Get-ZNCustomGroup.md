---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-zncustomgroup
schema: 2.0.0
---

# Get-ZNCustomGroup

## SYNOPSIS
Returns the properties of an custom group.

## SYNTAX

```
Get-ZNCustomGroup -GroupId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the properties of an custom group.

## EXAMPLES

### Example 1: Get a custom group
```powershell
Get-ZNCustomGroup -groupId g:c:zV1tbs6t
```

```output
AddedById                 : 
AddedByName               : 
EntityAddedAt             : 
EntityCreatedAt           : 1738532128843
EntityDescription         : 
EntityDirectMembersCount  : 2
EntityDomain              : custom
EntityGuid                : 0cd4a243-e90c-4c2c-8db9-119c91628846
EntityHasProtectionPolicy : 
EntityId                  : g:c:zV1tbs6t
EntityName                : MirrorAsset
EntityPrincipalName       : 
EntityRole                : 3
EntitySid                 : 
EntityUpdatedAt           : 1766094171955
```

This cmdlet gets a custom group.

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

### -GroupId
groupId to filter on

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IGroupEntity

## NOTES

## RELATED LINKS

