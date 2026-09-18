### Example 1: List candidates for assigning an alert
```powershell
Get-ZNNetworkAlertsAssigneeCandidate
```

```output
Email                            Id                                   Name
-----                            --                                   ----
                                                                      Unassigned
albert@zeronetworks.com          u:d:AfQefRZK                         Albert Estevez Polo
alberto.lopez@zeronetworks.com   u:a:aZH3vDal                         Alberto Fernández López
amir@zeronetworks.com            u:a:nfryTLUQ                         Amir Frankel
benny@zeronetworks.com           u:a:OOdYqjWI                         Benny Lakunishok
chris.boehm@zeronetworks.com     u:a:muMtJ1am                         Christopher Paul Boehm
ce@zeronetworks.com              u:d:mEKUmFvS                         Customer Engineering
dotan.liba@zeronetworks.com      u:a:EiXwr9G7                         Dotan Liba
dotan.liba+test@zeronetworks.com 88a0bcee-c639-4831-b837-7bb99eb98cc8 dotan+test
eladmanor+test@zeronetworks.com  7df6ef28-c7f4-4d6b-83ee-25179d89c6d7 Elad Manor
ema@zeronetworks.com             u:a:Jl8kZSiQ                         Emanuele Bianchi
```

This cmdlet lists candidates for assigning a network alert.
