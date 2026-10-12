### Example 1: List Connect policies
```powershell
Get-ZNConnectPolicy
```

```output
AlwaysOn AutoDisconnectInOffice ChangeTicket ConnectivityStateAfterReboot CreatedAt     Description ForceSsoAut
                                                                                                    hentication
-------- ---------------------- ------------ ---------------------------- ---------     ----------- -----------
False    False                  123          1                            1775244453929             False      
False    False                               2                            1746151937604 newtest     False      
False    False                               1                            1784683943125             False      
True     True                                1                            1784728780581             True   
```

This cmdlet lists Connect policies.
