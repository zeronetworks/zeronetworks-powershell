---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-zncustomgroupscandidate
schema: 2.0.0
---

# Get-ZNCustomGroupsCandidate

## SYNOPSIS
Returns a list of candidates for custom group membership.

## SYNTAX

```
Get-ZNCustomGroupsCandidate [-AccountName <String>] [-GroupId <String>] [-Limit <Int32>] [-Offset <Int32>]
 [-Search <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns a list of candidates for custom group membership.

## EXAMPLES

### Example 1: List custom group candidates
```powershell
Get-ZNCustomGroupsCandidate
```

```output
Id           Name                                      Description DirectMembersCount
--           ----                                      ----------- ------------------
g:a:qu04AfTz Access Control Assistance Operators                   
g:a:XDRxcVDz Account Operators                                     
g:a:MBAj0Xfx Administrators                                        
g:a:u6xPbBLg Allowed RODC Password Replication Group               
g:s:18445453 Any asset except protected OT/IoT devices             
g:a:JjhBvgRW Backup Operators                                      
g:o:0T445453 Biometric entry systems                               
g:o:04445453 Cameras                                               
g:o:0A445453 Card readers
```

This cmdlet list candidates for custom group membership.

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
Parameter Sets: (All)
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
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Search
Test to search for

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ICandidatesList

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

## RELATED LINKS

