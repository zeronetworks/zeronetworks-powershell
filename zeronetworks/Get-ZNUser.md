---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/get-znuser
schema: 2.0.0
---

# Get-ZNUser

## SYNOPSIS
Returns the properties of an user.

## SYNTAX

### List (Default)
```
Get-ZNUser [-AccountName <String>] [-Cursor <Int64>] [-Filters <String>] [-Limit <Int32>] [-Offset <Int32>]
 [-Order <String>] [-OrderColumns <List<String>>] [-Search <String>] [-WithCount] [<CommonParameters>]
```

### Get
```
Get-ZNUser -UserId <String> [-AccountName <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the properties of an user.

## EXAMPLES

### Example 1: List users
```powershell
Get-ZNUser
```

```output
CreatedAt     DistinguishedName                                    Domain    Email                           FirstName Guid                                 Id           JobTitle LastLogon     LastName   Name             OfficePhone Phone Role Sid
---------     -----------------                                    ------    -----                           --------- ----                                 --           -------- ---------     --------   ----             ----------- ----- ---- ---            
1646147850723 CN=Administrator,CN=Users,DC=zero,DC=labs            zero.labs                                           d2ac73db-cb56-4c7e-9818-ddb9e4c9a74c u:a:eTpnZu08          1661438953278            Administrator                      3    S-1-5-21-16551…
1648643718701 CN=Amir Duo,OU=Zero Networks,DC=zero,DC=labs         zero.labs amir+zerolabs@zeronetworks.com  Amir      b43498c6-e79c-49c0-8c17-203c18b4848f u:a:iGn4Hiqf                        Duo        Amir Duo                           3    S-1-5-21-16551…
1646147849725 CN=Amir Frankel,OU=Zero Networks,DC=zero,DC=labs     zero.labs amir@zeronetworks.com           Amir      81abb6ad-5ad5-4bc8-991d-3e1216a74dba u:a:PfGBMNXZ                        Frankel    Amir Frankel                       3    S-1-5-21-16551…
1648643116541 CN=Benny Duo,OU=Zero Networks,DC=zero,DC=labs        zero.labs benny+zerolabs@zeronetworks.com Benny     f1826820-facb-490b-8a95-b45df9b95fa1 u:a:ILBOlZpe                        Duo        Benny Duo                          3    S-1-5-21-16551…
1646147849717 CN=Benny Lakunishok,OU=Zero Networks,DC=zero,DC=labs zero.labs benny@zeronetworks.com          Benny     02323cdf-df65-4bc7-9cf2-b2d4cc012ed1 u:a:JinEj0u0                        Lakunishok Benny Lakunishok                   3    S-1-5-21-16551…
1648476771537 CN=duo account,OU=Zero Networks,DC=zero,DC=labs      zero.labs                                 duo       2c1bcacd-958e-4823-a85e-6053d736208b u:a:7Fp0hF2k                        account    duo account                        3    S-1-5-21-16551…
1648643839174 CN=Ema Duo,OU=Zero Networks,DC=zero,DC=labs          zero.labs ema+zerolabs@zeronetworks.com   Ema       80b93412-d043-441a-94a2-4657668a92d2 u:a:sJKzqaGn                        Duo        Ema Duo                            3    S-1-5-21-16551…
1646147849702 CN=Emanuele Bianchi,OU=Zero Networks,DC=zero,DC=labs zero.labs ema@zeronetworks.com            Emanuele  2d34ad23-28f0-4c47-aa0f-9386137b6ea5 u:a:5bMryabz                        Bianchi    Emanuele Bianchi                   3    S-1-5-21-16551…
1646147849112 CN=Guest,CN=Users,DC=zero,DC=labs                    zero.labs                                           928b03c0-aa7e-4b64-9999-8ee74235d50c u:a:qRcDkgrW                                   Guest                              3    S-1-5-21-16551…
1646147849683 CN=krbtgt,CN=Users,DC=zero,DC=labs                   zero.labs                                           df406d03-ff43-4868-a0c8-d5418391c139 u:a:r0HtwNuC                                   krbtgt                             3    S-1-5-21-16551…
```

This cmdlet will list users for the environment.

### Example 2: Get the next page of system groups
```powershell
 Get-ZNUser -Offset 10
```

```output
CreatedAt     DistinguishedName                                        Domain    Email                              FirstName          Guid                                 Id           JobTitle LastLogon     LastName       Name                 OfficePhone
---------     -----------------                                        ------    -----                              ---------          ----                                 --           -------- ---------     --------       ----                 -----------  
1648643839355 CN=Nicholas DiCola,OU=Zero Networks,DC=zero,DC=labs      zero.labs nicholas@zeronetworks.com          Nicholas           89932c25-5d85-47dd-b0a2-d97ad001fb06 u:a:E6iXCia4                        DiCola         Nicholas DiCola                   
1648643959634 CN=Nicholas Duo,OU=Zero Networks,DC=zero,DC=labs         zero.labs nicholas+zerolabs@zeronetworks.com Nicholas           8014fdaa-1778-4f58-800e-a3e25a7088c4 u:a:vRiuc5GQ                        Duo            Nicholas Duo                      
1646147849749 CN=Polina Blinchevsky,OU=Zero Networks,DC=zero,DC=labs   zero.labs polina@zeronetworks.com            Polina             164a5caa-ecd6-4c53-a0ea-6bdcde01a223 u:a:w0YZi4UW                        Blinchevsky    Polina Blinchevsky                
1648642752971 CN=Polina Duo,OU=Zero Networks,DC=zero,DC=labs           zero.labs polina+zerolabs@zeronetworks.com   Polina             dc8e66b8-73f3-46c3-8970-849c7fd59861 u:a:mGKgwnpj                        Duo            Polina Duo                        
1646147849740 CN=Yossi Ioukhtov,OU=Zero Networks,DC=zero,DC=labs       zero.labs yossii@zeronetworks.com            Yossi              a8abfe04-e94e-4098-9215-f8dcc98c9f8b u:a:uM48jiF7          1662040267812 Ioukhtov       Yossi Ioukhtov       +972525812317
1648642632329 CN=Yossi Ioukhtov - duo,OU=Zero Networks,DC=zero,DC=labs zero.labs yossii+zerolabs@zeronetworks.com   Yossii             4e07c6c1-5a70-481d-9ebf-bb9e02c5fb22 u:a:PMV08LfN          1648647811401 Ioukhtov - duo Yossi Ioukhtov - duo +972525812317
1646147850716 CN=ZNRemoteManagement,OU=Zero Networks,DC=zero,DC=labs   zero.labs                                    ZNRemoteManagement 465bd267-3571-4c52-aef0-b490a1b447d3 u:a:3ESSNWS0          1662626134292                ZNRemoteManagement   
```

Use offset to get the next page of users.

### Example 3: Search for a user
```powershell
Get-ZNUser -Search Administrator
```

```output
CreatedAt     DistinguishedName                         Domain    Email FirstName Guid                                 Id           JobTitle LastLogon     LastName Name          OfficePhone Phone Role Sid                                          Source UserPrincipleName
---------     -----------------                         ------    ----- --------- ----                                 --           -------- ---------     -------- ----          ----------- ----- ---- ---                                          ------ -----------------
1646147850723 CN=Administrator,CN=Users,DC=zero,DC=labs zero.labs                 d2ac73db-cb56-4c7e-9818-ddb9e4c9a74c u:a:eTpnZu08          1661438953278          Administrator                   3    S-1-5-21-1655129710-1269081394-587607975-500 3
```

Use offset to get the next page of users.

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

### -Cursor
cursor position to start at

```yaml
Type: System.Int64
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: None
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

### -Order
What order to sort the results

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

### -OrderColumns
what column to order on

```yaml
Type: System.Collections.Generic.List`1[[System.String, System.Private.CoreLib, Version=10.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e]]
Parameter Sets: List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Search
Test to search for

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

### -UserId
userId to filter on

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

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.ISearchUsersResponse

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IUserResponse

## NOTES

## RELATED LINKS

