<#
.Synopsis
Replaces the exclusion fields.
When applyToExistingAlerts is true, every open alert the edited exclusion fully covers is closed with closure reason Excluded.
No alert is reopened.
.Description
Replaces the exclusion fields.
When applyToExistingAlerts is true, every open alert the edited exclusion fully covers is closed with closure reason Excluded.
No alert is reopened.

.Link
https://github.com/zeronetworks/zero-powershell/zeronetworks/update-znnetworkalertexclusion
#>
function Update-ZNNetworkAlertExclusion {
    [OutputType([ZeroNetworks.PowerShell.Cmdlets.Api.Models.NetworkAlertExclusionCreateResult])]
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
        # The id of the network alert exclusion
        ${ExclusionId},

        [Parameter(ParameterSetName = 'UpdateExpanded', Mandatory)]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ValidateScript({
            $validValues = 'unclassified', 'multi_staged_attack', 'malware', 'malicious_user_activity', 'unwanted_software', 'phishing', 'compromised_account', 'true_positive_other', 'security_testing', 'confirmed_activity', 'line_of_business_application', 'informational_other', 'not_malicious', 'not_enough_data', 'false_positive_other'
            $parsed = 0
            if ([int]::TryParse([string]$_, [ref]$parsed)) {
                if ($parsed -lt 0 -or $parsed -gt 14) {
                    throw "UserAlertClassification integer value '$parsed' is out of range. Valid values are 0-14, or one of: $($validValues -join ', ')"
                }
            }
            elseif ($_ -notin $validValues) {
                throw "UserAlertClassification value '$_' is invalid. Valid values are: $($validValues -join ', ')"
            }
            $true
        })]
        # The user alert classification. Accepts the string value, or the integer value returned by Get-ZNNetworkAlertExclusion (converted automatically).
        ${UserAlertClassification},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.String]
        # Empty string means any alert.
        ${AlertTypeId},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        # Also close every open alert the edited exclusion fully covers, with closure reason Excluded.
        # Partially covered alerts stay open.
        ${ApplyToExistingAlerts},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.String]
        # Change ticket.
        ${ChangeTicket},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.String]
        # Required when userAlertClassification is true_positive_other, informational_other or false_positive_other.
        ${Comment},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [AllowEmptyCollection()]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.String[]]
        # Asset and group ids, or process full paths and patterns with a leading or trailing wildcard.
        # Empty means every involved entity.
        ${InvolvedEntityIds},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [ValidateScript({
            $validValues = 'asset', 'process'
            $parsed = 0
            if ([int]::TryParse([string]$_, [ref]$parsed)) {
                if ($parsed -lt 0 -or $parsed -gt 4) {
                    throw "InvolvedEntityType integer value '$parsed' is out of range. Valid values are 0-4 (Unspecified, Asset, IP, Process, User), or one of: $($validValues -join ', ')"
                }
            }
            elseif ($_ -notin $validValues) {
                throw "InvolvedEntityType value '$_' is invalid. Valid values are: $($validValues -join ', ')"
            }
            $true
        })]
        # The involved entity type. Accepts 'asset' or 'process', or the integer value returned by Get-ZNNetworkAlertExclusion (converted automatically; only Asset(1) and Process(3) have a string equivalent).
        ${InvolvedEntityType},

        [Parameter(ParameterSetName = 'UpdateExpanded')]
        [AllowEmptyCollection()]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Category('Body')]
        [System.String[]]
        # Asset and group ids.
        # Empty means every asset.
        ${MainEntityIds},

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
            # the API returns involvedEntityType/userAlertClassification as integer enums,
            # but the update body only accepts their string equivalents.
            $involvedEntityTypeMap = @{ 1 = 'asset'; 3 = 'process' }
            $userAlertClassificationMap = @{
                0 = 'unclassified'; 1 = 'multi_staged_attack'; 2 = 'malware'; 3 = 'malicious_user_activity'; 4 = 'unwanted_software';
                5 = 'phishing'; 6 = 'compromised_account'; 7 = 'true_positive_other'; 8 = 'security_testing'; 9 = 'confirmed_activity';
                10 = 'line_of_business_application'; 11 = 'informational_other'; 12 = 'not_malicious'; 13 = 'not_enough_data'; 14 = 'false_positive_other'
            }

            # converts a value that may be the API's integer enum or already the string the update body expects
            function ConvertTo-ZNEnumStringValue {
                param($Value, [hashtable]$Map, [string]$ParameterName)
                $parsed = 0
                if ([int]::TryParse([string]$Value, [ref]$parsed)) {
                    if (-not $Map.Contains($parsed)) {
                        throw "The current $ParameterName value ($parsed) has no string equivalent accepted by the update API. Supply a valid -$ParameterName value explicitly."
                    }
                    return $Map[$parsed]
                }
                return $Value
            }

            #Handle Get
            $exclusionId = $PSBoundParameters['ExclusionId'].ToString()
            $networkAlertExclusion = ZeroNetworks\Get-ZNNetworkAlertExclusion -ExclusionId $exclusionId

            $updatedNetworkAlertExclusion = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.NetworkAlertExclusionUpdateBody]::new()

            if($PSBoundParameters['AlertTypeId']){
                $updatedNetworkAlertExclusion.AlertTypeId = $PSBoundParameters['AlertTypeId']
                $null = $PSBoundParameters.Remove('AlertTypeId')
            }
            else{
                $updatedNetworkAlertExclusion.AlertTypeId = $networkAlertExclusion.AlertTypeId
                $null = $PSBoundParameters.Remove('AlertTypeId')
            }

            if($PSBoundParameters['ChangeTicket']){
                $updatedNetworkAlertExclusion.ChangeTicket = $PSBoundParameters['ChangeTicket']
                $null = $PSBoundParameters.Remove('ChangeTicket')
            }
            else{
                $updatedNetworkAlertExclusion.ChangeTicket = $networkAlertExclusion.ChangeTicket
                $null = $PSBoundParameters.Remove('ChangeTicket')
            }

            if($PSBoundParameters['Comment']){
                $updatedNetworkAlertExclusion.Comment = $PSBoundParameters['Comment']
                $null = $PSBoundParameters.Remove('Comment')
            }
            else{
                $updatedNetworkAlertExclusion.Comment = $networkAlertExclusion.Comment
                $null = $PSBoundParameters.Remove('Comment')
            }

            if($PSBoundParameters['InvolvedEntityIds']){
                $updatedNetworkAlertExclusion.InvolvedEntityIds = $PSBoundParameters['InvolvedEntityIds']
                $null = $PSBoundParameters.Remove('InvolvedEntityIds')
            }
            else{
                $updatedNetworkAlertExclusion.InvolvedEntityIds = @($networkAlertExclusion.InvolvedEntities | ForEach-Object { $_.Id })
                $null = $PSBoundParameters.Remove('InvolvedEntityIds')
            }

            if($PSBoundParameters['InvolvedEntityType']){
                $updatedNetworkAlertExclusion.InvolvedEntityType = ConvertTo-ZNEnumStringValue -Value $PSBoundParameters['InvolvedEntityType'] -Map $involvedEntityTypeMap -ParameterName 'InvolvedEntityType'
                $null = $PSBoundParameters.Remove('InvolvedEntityType')
            }
            else{
                $updatedNetworkAlertExclusion.InvolvedEntityType = ConvertTo-ZNEnumStringValue -Value $networkAlertExclusion.InvolvedEntityType -Map $involvedEntityTypeMap -ParameterName 'InvolvedEntityType'
                $null = $PSBoundParameters.Remove('InvolvedEntityType')
            }

            if($PSBoundParameters['MainEntityIds']){
                $updatedNetworkAlertExclusion.MainEntityIds = $PSBoundParameters['MainEntityIds']
                $null = $PSBoundParameters.Remove('MainEntityIds')
            }
            else{
                $updatedNetworkAlertExclusion.MainEntityIds = @($networkAlertExclusion.MainEntities | ForEach-Object { $_.Id })
                $null = $PSBoundParameters.Remove('MainEntityIds')
            }

            if($PSBoundParameters['UserAlertClassification']){
                $updatedNetworkAlertExclusion.UserAlertClassification = ConvertTo-ZNEnumStringValue -Value $PSBoundParameters['UserAlertClassification'] -Map $userAlertClassificationMap -ParameterName 'UserAlertClassification'
                $null = $PSBoundParameters.Remove('UserAlertClassification')
            }
            else{
                $updatedNetworkAlertExclusion.UserAlertClassification = ConvertTo-ZNEnumStringValue -Value $networkAlertExclusion.UserAlertClassification -Map $userAlertClassificationMap -ParameterName 'UserAlertClassification'
                $null = $PSBoundParameters.Remove('UserAlertClassification')
            }

            if($PSBoundParameters['ApplyToExistingAlerts']){
                $updatedNetworkAlertExclusion.ApplyToExistingAlerts = $PSBoundParameters['ApplyToExistingAlerts'].IsPresent
                $null = $PSBoundParameters.Remove('ApplyToExistingAlerts')
            }

            #Write-Debug $updatedNetworkAlertExclusion | Out-String
            $null = $PSBoundParameters.Add('Body', $updatedNetworkAlertExclusion)
            ZeroNetworks.internal\Update-ZNNetworkAlertExclusion @PSBoundParameters
        }
        catch {
            throw
        }
    }
}
