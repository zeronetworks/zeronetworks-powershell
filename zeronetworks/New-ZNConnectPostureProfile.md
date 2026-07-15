---
external help file:
Module Name: ZeroNetworks
online version: https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znconnectpostureprofile
schema: 2.0.0
---

# New-ZNConnectPostureProfile

## SYNOPSIS
Create a Connect Posture Profile

## SYNTAX

```
New-ZNConnectPostureProfile [-AccountName <String>] [-Action <String>] [-CheckIntervalSeconds <Int32>]
 [-Description <String>] [-MacCheckCertificateExistsList <IMacPostureChecksCertificateExistsListItem[]>]
 [-MacCheckDomainJoinedList <IMacPostureChecksDomainJoinedListItem[]>]
 [-MacCheckFileExistsList <IMacPostureChecksFileExistsListItem[]>]
 [-MacCheckProcessRunningList <IMacPostureChecksProcessRunningListItem[]>] [-MacChecksAntivirusIsEnabled]
 [-MacChecksDiskEncryptedIsEncrypted]
 [-MacChecksOsVersionBuildOSVersionsList <IMacPostureChecksOSVersionBuildOsversionsListItem[]>]
 [-Name <String>] [-WindowCheckCertificateExistsList <IWindowsPostureChecksCertificateExistsListItem[]>]
 [-WindowCheckDomainJoinedList <IWindowsPostureChecksDomainJoinedListItem[]>]
 [-WindowCheckFileExistsList <IWindowsPostureChecksFileExistsListItem[]>]
 [-WindowCheckProcessRunningList <IWindowsPostureChecksProcessRunningListItem[]>]
 [-WindowCheckRegistryKeyValueDataExistsList <IWindowsPostureChecksRegistryKeyValueDataExistsListItem[]>]
 [-WindowsChecksAntivirusIsEnabled] [-WindowsChecksDiskEncryptedIsEncrypted]
 [-WindowsChecksOsVersionBuildOSVersionsList <IWindowsPostureChecksOSVersionBuildOsversionsListItem[]>]
 [-Confirm] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
Create a Connect Posture Profile

## EXAMPLES

### Example 1: Create Connect posture check
```powershell
New-ZNConnectPostureProfile -Action BLOCK -CheckIntervalSeconds 900 -Name AV2 -WindowsChecksAntivirusIsEnabled:$true
```

```output
P:a:5Zs7b52g
```

This cmdlet creates a Connect posture check.

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

### -Action
Posture action

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

### -CheckIntervalSeconds
.

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
.

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
.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IMacPostureChecksCertificateExistsListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MacCheckDomainJoinedList
.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IMacPostureChecksDomainJoinedListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MacCheckFileExistsList
.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IMacPostureChecksFileExistsListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MacCheckProcessRunningList
.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IMacPostureChecksProcessRunningListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MacChecksAntivirusIsEnabled
.

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
.

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
.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IMacPostureChecksOSVersionBuildOsversionsListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
.

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

### -WindowCheckCertificateExistsList
.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IWindowsPostureChecksCertificateExistsListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WindowCheckDomainJoinedList
.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IWindowsPostureChecksDomainJoinedListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WindowCheckFileExistsList
.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IWindowsPostureChecksFileExistsListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WindowCheckProcessRunningList
.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IWindowsPostureChecksProcessRunningListItem[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WindowCheckRegistryKeyValueDataExistsList
.

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
.

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
.

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
.

```yaml
Type: ZeroNetworks.PowerShell.Cmdlets.Api.Models.IWindowsPostureChecksOSVersionBuildOsversionsListItem[]
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

### System.String

### ZeroNetworks.PowerShell.Cmdlets.Api.Models.IError

## NOTES

COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.


`MACCHECKCERTIFICATEEXISTSLIST <IMacPostureChecksCertificateExistsListItem[]>`: .
  - `[SubjectNameList <List<String>>]`: 

`MACCHECKDOMAINJOINEDLIST <IMacPostureChecksDomainJoinedListItem[]>`: .
  - `[DomainList <List<String>>]`: 

`MACCHECKFILEEXISTSLIST <IMacPostureChecksFileExistsListItem[]>`: .
  - `[FilePathList <List<String>>]`: 

`MACCHECKPROCESSRUNNINGLIST <IMacPostureChecksProcessRunningListItem[]>`: .
  - `[ProcessPathList <List<String>>]`: 

`MACCHECKSOSVERSIONBUILDOSVERSIONSLIST <IMacPostureChecksOSVersionBuildOsversionsListItem[]>`: .
  - `AllowNewer <Boolean>`: 
  - `OSName <String>`: macOS marketing name
  - `Version <String>`: 

`WINDOWCHECKCERTIFICATEEXISTSLIST <IWindowsPostureChecksCertificateExistsListItem[]>`: .
  - `[SubjectNameList <List<String>>]`: 

`WINDOWCHECKDOMAINJOINEDLIST <IWindowsPostureChecksDomainJoinedListItem[]>`: .
  - `[DomainList <List<String>>]`: 

`WINDOWCHECKFILEEXISTSLIST <IWindowsPostureChecksFileExistsListItem[]>`: .
  - `[FilesPathsList <List<String>>]`: 

`WINDOWCHECKPROCESSRUNNINGLIST <IWindowsPostureChecksProcessRunningListItem[]>`: .
  - `[ProcessPathList <List<String>>]`: 

`WINDOWCHECKREGISTRYKEYVALUEDATAEXISTSLIST <IWindowsPostureChecksRegistryKeyValueDataExistsListItem[]>`: .
  - `[EntriesList <List<IWindowsPostureChecksRegistryKeyValueDataExistsListPropertiesItemsItem>>]`: 
    - `KeyPath <String>`: 
    - `[DataList <List<String>>]`: 
    - `[ValueName <String>]`: 

`WINDOWSCHECKSOSVERSIONBUILDOSVERSIONSLIST <IWindowsPostureChecksOSVersionBuildOsversionsListItem[]>`: .
  - `AllowNewer <Boolean>`: 
  - `OSName <String>`: Windows OS marketing name
  - `Version <String>`: 
  - `[Patch <Int32?>]`: 

## RELATED LINKS

