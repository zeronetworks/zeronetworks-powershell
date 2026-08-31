<#
.Synopsis
Updates a Connect posture profile.
.Description
Updates a Connect posture profile.

.Link
https://github.com/zeronetworks/zero-powershell/zeronetworks/update-znconnectpostureprofile
#>
function Update-ZNConnectPostureProfile {
    [OutputType([void])]
    [CmdletBinding(DefaultParameterSetName = 'UpdateExpanded', PositionalBinding = $false, SupportsShouldProcess, ConfirmImpact = 'Medium')]
    param(
        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Path')]
        [System.String]
        # Account Name
        ${AccountName},

        [Parameter(ParameterSetName = 'UpdateExpanded', Mandatory)]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Path')]
        [System.String]
        # Profile id.
        ${ProfileId},
    
        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [string]
        # Action
        ${Action},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [int]
        # the check interval in seconds.
        ${CheckIntervalSeconds},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [string]
        # description.
        ${Description},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.MacPostureChecksCertificateExistsListItem[]]
        # Mac certificate check
        ${MacCheckCertificateExistsList},
        
        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.MacPostureChecksDomainJoinedListItem[]]
        # Mac domain joined check
        ${MacCheckDomainJoinedList},
        
        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.MacPostureChecksFileExistsListItem[]]
        # Mac file check
        ${MacCheckFileExistsList}, 

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.MacPostureChecksProcessRunningListItem[]]
        # Mac process running check
        ${MacCheckProcessRunningList},
        
        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [switch]
        # Mac AV check
        ${MacChecksAntivirusIsEnabled},
        
        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [switch]
        # Mac disk encrypted check
        ${MacChecksDiskEncryptedIsEncrypted},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.MacPostureChecksOSVersionBuildOsversionsListItem[]]
        # MAC OS version check
        ${MacChecksOsVersionBuildOSVersionsList},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [String]
        # The policy name
        ${Name},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.WindowsPostureChecksCertificateExistsListItem[]]
        # Windows certificate check
        ${WindowCheckCertificateExistsList},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.WindowsPostureChecksDomainJoinedListItem[]]
        # Windows domain joined check
        ${WindowCheckDomainJoinedList},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.WindowsPostureChecksFileExistsListItem[]]
        # Windows file check
        ${WindowCheckFileExistsList},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.WindowsPostureChecksProcessRunningListItem[]]
        # Windows process running check
        ${WindowCheckProcessRunningList},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.IWindowsPostureChecksRegistryKeyValueDataExistsListItem[]]
        # Windows registry key value data exists check
        ${WindowCheckRegistryKeyValueDataExistsList},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [switch]
        # Windows AV Check
        ${WindowsChecksAntivirusIsEnabled},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [switch]
        # Windows disk encrypted check
        ${WindowsChecksDiskEncryptedIsEncrypted},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.WindowsPostureChecksOSVersionBuildOsversionsListItem[]]
        # Windows OS version check
        ${WindowsChecksOsVersionBuildOSVersionsList},

        [Parameter()]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command as a job
        ${AsJob},

        [Parameter(DontShow)]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},

        [Parameter()]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command asynchronously
        ${NoWait},

        [Parameter(DontShow)]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},

        [Parameter(DontShow)]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )

    process {
        try {
            #Handle Get
            $profileId = $PSBoundParameters['ProfileId'].ToString()
            $postureProfile = (ZeroNetworks\Get-ZNConnectPostureProfile  -Limit 400).Items | where {$_.id -eq $ProfileId}

            $updatedPostureProfile = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.PostureProfileBody]::new()
            
            if($PSBoundParameters['Action']){
                $updatedPostureProfile.Action = $PSBoundParameters['Action']
                $null = $PSBoundParameters.Remove('Action')
            }
            else{
                $updatedPostureProfile.Action = $postureProfile.Action
                $null = $PSBoundParameters.Remove('Action')
            }

            if($PSBoundParameters['CheckIntervalSeconds']){
                $updatedPostureProfile.CheckIntervalSeconds = $PSBoundParameters['CheckIntervalSeconds']
                $null = $PSBoundParameters.Remove('CheckIntervalSeconds')
            }
            else{
                $updatedPostureProfile.CheckIntervalSeconds = $postureProfile.CheckIntervalSeconds
                $null = $PSBoundParameters.Remove('CheckIntervalSeconds')
            }


            if($PSBoundParameters['Description']){
                $updatedPostureProfile.Description = $PSBoundParameters['Description']
                $null = $PSBoundParameters.Remove('Description')
            }
            else{
                $updatedPostureProfile.Description = $postureProfile.Description
                $null = $PSBoundParameters.Remove('Description')
            }

            if($PSBoundParameters['MacCheckCertificateExistsList']){
                $updatedPostureProfile.MacCheckCertificateExistsList = $PSBoundParameters['MacCheckCertificateExistsList']
                $null = $PSBoundParameters.Remove('MacCheckCertificateExistsList')
            }
            else{
                $updatedPostureProfile.MacCheckCertificateExistsList = $postureProfile.MacCheckCertificateExistsList
                $null = $PSBoundParameters.Remove('MacCheckCertificateExistsList')
            }

            if($PSBoundParameters['MacCheckDomainJoinedList']){
                $updatedPostureProfile.MacCheckDomainJoinedList = $PSBoundParameters['MacCheckDomainJoinedList']
                $null = $PSBoundParameters.Remove('MacCheckDomainJoinedList')
            }
            else{
                $updatedPostureProfile.MacCheckDomainJoinedList = $postureProfile.MacCheckDomainJoinedList
                $null = $PSBoundParameters.Remove('MacCheckDomainJoinedList')
            }
            if($PSBoundParameters['MacCheckFileExistsList']){
                $updatedPostureProfile.MacCheckFileExistsList = $PSBoundParameters['MacCheckFileExistsList']
                $null = $PSBoundParameters.Remove('MacCheckFileExistsList')
            }
            else{
                $updatedPostureProfile.MacCheckFileExistsList = $postureProfile.MacCheckFileExistsList
                $null = $PSBoundParameters.Remove('MacCheckFileExistsList')
            }

            if($PSBoundParameters['MacCheckProcessRunningList']){
                $updatedPostureProfile.MacCheckProcessRunningList = $PSBoundParameters['MacCheckProcessRunningList']
                $null = $PSBoundParameters.Remove('MacCheckProcessRunningList')
            }
            else{
                $updatedPostureProfile.MacCheckProcessRunningList = $postureProfile.MacCheckProcessRunningList
                $null = $PSBoundParameters.Remove('MacCheckProcessRunningList')
            }

            if($PSBoundParameters['MacChecksAntivirusIsEnabled']){
                $updatedPostureProfile.MacChecksAntivirusIsEnabled = $PSBoundParameters['MacChecksAntivirusIsEnabled']
                $null = $PSBoundParameters.Remove('MacChecksAntivirusIsEnabled')
            }
            else{
                $updatedPostureProfile.MacChecksAntivirusIsEnabled = $postureProfile.MacChecksAntivirusIsEnabled
                $null = $PSBoundParameters.Remove('MacChecksAntivirusIsEnabled')
            }

            if($PSBoundParameters['MacChecksDiskEncryptedIsEncrypted']){
                $updatedPostureProfile.MacChecksDiskEncryptedIsEncrypted = $PSBoundParameters['MacChecksDiskEncryptedIsEncrypted']
                $null = $PSBoundParameters.Remove('MacChecksDiskEncryptedIsEncrypted')
            }
            else{
                $updatedPostureProfile.MacChecksDiskEncryptedIsEncrypted = $postureProfile.MacChecksDiskEncryptedIsEncrypted
                $null = $PSBoundParameters.Remove('MacChecksDiskEncryptedIsEncrypted')
            }
       
            if($PSBoundParameters['MacChecksOsVersionBuildOSVersionsList']){
                $updatedPostureProfile.MacChecksOsVersionBuildOSVersionsList = $PSBoundParameters['MacChecksOsVersionBuildOSVersionsList']
                $null = $PSBoundParameters.Remove('MacChecksOsVersionBuildOSVersionsList')
            }
            else{
                $updatedPostureProfile.MacChecksOsVersionBuildOSVersionsList = $postureProfile.MacChecksOsVersionBuildOSVersionsList
                $null = $PSBoundParameters.Remove('MacChecksOsVersionBuildOSVersionsList')
            }

            if($PSBoundParameters['Name']){
                $updatedPostureProfile.Name = $PSBoundParameters['Name']
                $null = $PSBoundParameters.Remove('Name')
            }
            else{
                $updatedPostureProfile.Name = $postureProfile.Name
                $null = $PSBoundParameters.Remove('Name')
            }

            if($PSBoundParameters['WindowCheckCertificateExistsList']){
                $updatedPostureProfile.WindowCheckCertificateExistsList = $PSBoundParameters['WindowCheckCertificateExistsList']
                $null = $PSBoundParameters.Remove('WindowCheckCertificateExistsList')
            }
            else{
                $updatedPostureProfile.WindowCheckCertificateExistsList = $postureProfile.WindowCheckCertificateExistsList
                $null = $PSBoundParameters.Remove('WindowCheckCertificateExistsList')
            }

            if($PSBoundParameters['WindowCheckDomainJoinedList']){
                $updatedPostureProfile.WindowCheckDomainJoinedList = $PSBoundParameters['WindowCheckDomainJoinedList']
                $null = $PSBoundParameters.Remove('WindowCheckDomainJoinedList')
            }
            else{
                $updatedPostureProfile.WindowCheckDomainJoinedList = $postureProfile.WindowCheckDomainJoinedList
                $null = $PSBoundParameters.Remove('WindowCheckDomainJoinedList')
            }

            if($PSBoundParameters['WindowCheckFileExistsList']){
                $updatedPostureProfile.WindowCheckFileExistsList = $PSBoundParameters['WindowCheckFileExistsList']
                $null = $PSBoundParameters.Remove('WindowCheckFileExistsList')
            }
            else{
                $updatedPostureProfile.WindowCheckFileExistsList = $postureProfile.WindowCheckFileExistsList
                $null = $PSBoundParameters.Remove('WindowCheckFileExistsList')
            }

            if($PSBoundParameters['WindowCheckProcessRunningList']){
                $updatedPostureProfile.WindowCheckProcessRunningList = $PSBoundParameters['WindowCheckProcessRunningList']
                $null = $PSBoundParameters.Remove('WindowCheckProcessRunningList')
            }
            else{
                $updatedPostureProfile.WindowCheckProcessRunningList = $postureProfile.WindowCheckProcessRunningList
                $null = $PSBoundParameters.Remove('WindowCheckProcessRunningList')
            }
            
            if($PSBoundParameters['WindowCheckRegistryKeyValueDataExistsList']){
                $updatedPostureProfile.WindowCheckRegistryKeyValueDataExistsList = $PSBoundParameters['WindowCheckRegistryKeyValueDataExistsList']
                $null = $PSBoundParameters.Remove('WindowCheckRegistryKeyValueDataExistsList')
            }
            else{
                $updatedPostureProfile.WindowCheckRegistryKeyValueDataExistsList = $postureProfile.WindowCheckRegistryKeyValueDataExistsList
                $null = $PSBoundParameters.Remove('WindowCheckRegistryKeyValueDataExistsList')
            }

            if($PSBoundParameters['WindowsChecksAntivirusIsEnabled']){
                $updatedPostureProfile.WindowsChecksAntivirusIsEnabled = $PSBoundParameters['WindowsChecksAntivirusIsEnabled']
                $null = $PSBoundParameters.Remove('WindowsChecksAntivirusIsEnabled')
            }
            else{
                $updatedPostureProfile.WindowsChecksAntivirusIsEnabled = $postureProfile.WindowsChecksAntivirusIsEnabled
                $null = $PSBoundParameters.Remove('WindowsChecksAntivirusIsEnabled')
            }
            
            if($PSBoundParameters['WindowsChecksDiskEncryptedIsEncrypted']){
                $updatedPostureProfile.WindowsChecksDiskEncryptedIsEncrypted = $PSBoundParameters['WindowsChecksDiskEncryptedIsEncrypted']
                $null = $PSBoundParameters.Remove('WindowsChecksDiskEncryptedIsEncrypted')
            }
            else{
                $updatedPostureProfile.WindowsChecksDiskEncryptedIsEncrypted = $postureProfile.WindowsChecksDiskEncryptedIsEncrypted
                $null = $PSBoundParameters.Remove('WindowsChecksDiskEncryptedIsEncrypted')
            }
            
            if($PSBoundParameters['WindowsChecksOsVersionBuildOSVersionsList']){
                $updatedPostureProfile.WindowsChecksOsVersionBuildOSVersionsList = $PSBoundParameters['WindowsChecksOsVersionBuildOSVersionsList']
                $null = $PSBoundParameters.Remove('WindowsChecksOsVersionBuildOSVersionsList')
            }
            else{
                $updatedPostureProfile.WindowsChecksOsVersionBuildOSVersionsList = $postureProfile.WindowsChecksOsVersionBuildOSVersionsList
                $null = $PSBoundParameters.Remove('WindowsChecksOsVersionBuildOSVersionsList')
            }

            #Write-Debug $updatedPostureProfile | Out-String
            $null = $PSBoundParameters.Add('Body', $updatedPostureProfile)
            ZeroNetworks.internal\Update-ZNConnectPostureProfile @PSBoundParameters
        }
        catch {
            throw
        }
    }
}