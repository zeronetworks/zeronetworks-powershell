<#
    .Synopsis
    Create a in-memory object for VersionMaintenanceWindowBodyMaintenanceWindowsItem
    .Description
    Create a in-memory object for VersionMaintenanceWindowBodyMaintenanceWindowsItem

    .Outputs
    ZeroNetworks.PowerShell.Cmdlets.Api.Models.VersionMaintenanceWindowBodyMaintenanceWindowsItem
    .Link
    https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znsettingsversionmaintenancewindowitem
    #>
function New-ZNSettingsVersionMaintenanceWindowItem {
    [OutputType([ZeroNetworks.PowerShell.Cmdlets.Api.Models.VersionMaintenanceWindowBodyMaintenanceWindowsItem])]
    [CmdletBinding(PositionalBinding = $false)]
    Param(
    
        [Parameter(HelpMessage = "Which hour to start", ParameterSetName = 'VersionMaintenanceWindow')]
        [ValidateSet(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23)]
        $StartTime,

        [Parameter(Mandatory, HelpMessage = "Day of the week", ParameterSetName = 'VersionMaintenanceWindow')]
        [ValidateSet("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")]
        [string]
        $WeekDay
    )

    process {
        $Object = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.VersionMaintenanceWindowBodyMaintenanceWindowsItem]::New()

        $Object.StartTimeUTC = (Get-Date -Hour $PSBoundParameters['StartTime'] -Minute 0 -Second 0).ToUniversalTime().Hour

        switch ($PSBoundParameters['WeekDay']) {
            "Monday" {
                $Object.WeekDay = 2
            }
            "Tuesday" {
                $Object.WeekDay = 3
            }
            "Wednesday" {
                $Object.WeekDay = 4
            }
            "Thursday" {
                $Object.WeekDay = 5
            }
            "Friday" {
                $Object.WeekDay = 6
            }
            "Saturday" {
                $Object.WeekDay = 7
            }
            "Sunday" {
                $Object.WeekDay = 1
            }
        }

        return $Object
    }
}
    
