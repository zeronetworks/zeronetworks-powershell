---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/update-znconnectpostureprofile
schema: 2.0.0
---

# Update-ZNConnectPostureProfile

## SYNOPSIS
Updates a Connect posture profile.

## SYNTAX

```
Update-ZNConnectPostureProfile -ProfileId <String> [-AccountName <String>] [-Action <String>]
 [-CheckIntervalSeconds <Int32>] [-Description <String>]
 [-MacCheckCertificateExistsList <MacPostureChecksCertificateExistsListItem[]>]
 [-MacCheckDomainJoinedList <MacPostureChecksDomainJoinedListItem[]>]
 [-MacCheckFileExistsList <MacPostureChecksFileExistsListItem[]>]
 [-MacCheckProcessRunningList <MacPostureChecksProcessRunningListItem[]>] [-MacChecksAntivirusIsEnabled]
 [-MacChecksDiskEncryptedIsEncrypted]
 [-MacChecksOsVersionBuildOSVersionsList <MacPostureChecksOSVersionBuildOsversionsListItem[]>]
 [-Name <String>] [-WindowCheckCertificateExistsList <WindowsPostureChecksCertificateExistsListItem[]>]
 [-WindowCheckDomainJoinedList <WindowsPostureChecksDomainJoinedListItem[]>]
 [-WindowCheckFileExistsList <WindowsPostureChecksFileExistsListItem[]>]
 [-WindowCheckProcessRunningList <WindowsPostureChecksProcessRunningListItem[]>]
 [-WindowCheckRegistryKeyValueDataExistsList <IWindowsPostureChecksRegistryKeyValueDataExistsListItem[]>]
 [-WindowsChecksAntivirusIsEnabled] [-WindowsChecksDiskEncryptedIsEncrypted]
 [-WindowsChecksOsVersionBuildOSVersionsList <WindowsPostureChecksOSVersionBuildOsversionsListItem[]>]
 [-AsJob] [-NoWait] [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Updates a Connect posture profile.

## EXAMPLES

### Example 1: Update a posture profile
```powershell
Update-ZNConnectPostureProfile -ProfileId "P:a:bCRDHJQF" -MacChecksAntivirusIsEnabled
```

This cmdlet updates a Connect posture profile.

## PARAMETERS

### -AccountName
Account Name

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

### -Action
Action

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

### -AsJob
Run the command as a job

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CheckIntervalSeconds
the check interval in seconds.

```yaml
Type: System.Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
description.

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

### -MacCheckCertificateExistsList
Mac certificate check

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.MacPostureChecksCertificateExistsListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MacCheckDomainJoinedList
Mac domain joined check

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.MacPostureChecksDomainJoinedListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MacCheckFileExistsList
Mac file check

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.MacPostureChecksFileExistsListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MacCheckProcessRunningList
Mac process running check

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.MacPostureChecksProcessRunningListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MacChecksAntivirusIsEnabled
Mac AV check

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MacChecksDiskEncryptedIsEncrypted
Mac disk encrypted check

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MacChecksOsVersionBuildOSVersionsList
MAC OS version check

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.MacPostureChecksOSVersionBuildOsversionsListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The policy name

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

### -NoWait
Run the command asynchronously

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProfileId
Profile id.

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

### -WindowCheckCertificateExistsList
Windows certificate check

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.WindowsPostureChecksCertificateExistsListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WindowCheckDomainJoinedList
Windows domain joined check

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.WindowsPostureChecksDomainJoinedListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WindowCheckFileExistsList
Windows file check

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.WindowsPostureChecksFileExistsListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WindowCheckProcessRunningList
Windows process running check

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.WindowsPostureChecksProcessRunningListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WindowCheckRegistryKeyValueDataExistsList
Windows registry key value data exists check

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IWindowsPostureChecksRegistryKeyValueDataExistsListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WindowsChecksAntivirusIsEnabled
Windows AV Check

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WindowsChecksDiskEncryptedIsEncrypted
Windows disk encrypted check

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WindowsChecksOsVersionBuildOSVersionsList
Windows OS version check

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.WindowsPostureChecksOSVersionBuildOsversionsListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases: wi

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

### System.Void

## NOTES

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.


`MACCHECKCERTIFICATEEXISTSLIST <MacPostureChecksCertificateExistsListItem[]>`: Mac certificate check
  - `SubjectNameList <List<String>>`: 

`MACCHECKDOMAINJOINEDLIST <MacPostureChecksDomainJoinedListItem[]>`: Mac domain joined check
  - `DomainList <List<String>>`: 

`MACCHECKFILEEXISTSLIST <MacPostureChecksFileExistsListItem[]>`: Mac file check
  - `[FilesPathsList <List<String>>]`: 

`MACCHECKPROCESSRUNNINGLIST <MacPostureChecksProcessRunningListItem[]>`: Mac process running check
  - `ProcessPathList <List<String>>`: 

`MACCHECKSOSVERSIONBUILDOSVERSIONSLIST <MacPostureChecksOSVersionBuildOsversionsListItem[]>`: MAC OS version check
  - `AllowNewer <Boolean>`: 
  - `OSName <String>`: macOS marketing name
  - `Version <String>`: 

`WINDOWCHECKCERTIFICATEEXISTSLIST <WindowsPostureChecksCertificateExistsListItem[]>`: Windows certificate check
  - `SubjectNameList <List<String>>`: 

`WINDOWCHECKDOMAINJOINEDLIST <WindowsPostureChecksDomainJoinedListItem[]>`: Windows domain joined check
  - `DomainList <List<String>>`: 

`WINDOWCHECKFILEEXISTSLIST <WindowsPostureChecksFileExistsListItem[]>`: Windows file check
  - `FilesPathsList <List<String>>`: 

`WINDOWCHECKPROCESSRUNNINGLIST <WindowsPostureChecksProcessRunningListItem[]>`: Windows process running check
  - `ProcessPathList <List<String>>`: 

`WINDOWCHECKREGISTRYKEYVALUEDATAEXISTSLIST <IWindowsPostureChecksRegistryKeyValueDataExistsListItem[]>`: Windows registry key value data exists check
  - `EntriesList <List<IWindowsPostureChecksRegistryKeyValueDataExistsListPropertiesItemsItem>>`: 
    - `KeyPath <String>`: 
    - `[DataList <List<String>>]`: 
    - `[ValueName <String>]`: 

`WINDOWSCHECKSOSVERSIONBUILDOSVERSIONSLIST <WindowsPostureChecksOSVersionBuildOsversionsListItem[]>`: Windows OS version check
  - `AllowNewer <Boolean>`: 
  - `OSName <String>`: Windows OS marketing name
  - `Version <String>`: 
  - `[Patch <Int32?>]`: 

## RELATED LINKS

