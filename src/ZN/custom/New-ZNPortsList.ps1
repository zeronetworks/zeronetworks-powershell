<#
    .Synopsis
    Create a in-memory object for PortsList
    .Description
    Create a in-memory object for PortsList

    .Outputs
    ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem
    .Link
    https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znportslist
    #>
function New-ZNPortsList {
    [OutputType([ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem])]
    [CmdletBinding(PositionalBinding = $false)]
    Param(
    
        [Parameter(HelpMessage = "List of port numbers", ParameterSetName = 'Protocol')]
        [string]
        $Ports,

        [Parameter(Mandatory, HelpMessage = "Protocol", ParameterSetName = 'Protocol')]
        [ValidateSet("Any", "TCP", "UDP", "ICMP", "1", "6", "17", "256")]
        [string]
        $Protocol,

        [Parameter(Mandatory, HelpMessage = "Empty port list", ParameterSetName = 'Empty')]
        [switch]
        $Empty
    )

    process {
        $Object = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.PortsListItem]::New()

        switch ($PSBoundParameters['Protocol']) {
            "Any" {
                $Object.ProtocolType = 256
                $Object.Ports = ""
            }
            "256" {
                $Object.ProtocolType = 256
                $Object.Ports = ""
            }
            "TCP" {
                $Object.ProtocolType = 6
                $Object.Ports = $PSBoundParameters['Ports']
            }
            "6" {
                $Object.ProtocolType = 6
                $Object.Ports = $PSBoundParameters['Ports']
            }
            "UDP" {
                $Object.ProtocolType = 17
                $Object.Ports = $PSBoundParameters['Ports']
            }
            "17" {
                $Object.ProtocolType = 17
                $Object.Ports = $PSBoundParameters['Ports']
            }
            "ICMP" {
                $Object.ProtocolType = 1
                $Object.Ports = ""
            }
            "1" {
                $Object.ProtocolType = 1
                $Object.Ports = ""
            }
        }

        return $Object
    }
}
    
