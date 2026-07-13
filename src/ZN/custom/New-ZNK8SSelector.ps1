<#
    .Synopsis
    Create a in-memory object for K8SSelector
    .Description
    Create a in-memory object for K8SSelector

    .Outputs
    ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SSelector
    .Link
    https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znk8sselector
    #>
function New-ZNK8SSelector {
    [OutputType([ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SSelector])]
    [CmdletBinding(PositionalBinding = $false)]
    Param(

        [Parameter(HelpMessage = "Hashtable of labels to match, converted to [key, value] tuples")]
        [hashtable]
        $MatchLabels,

        [Parameter(HelpMessage = "List of match expressions, use New-ZNK8SMatchExpression to create")]
        [ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SMatchExpression[]]
        $MatchExpressions
    )

    process {
        $Object = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SSelector]::New()

        if ($PSBoundParameters.ContainsKey('MatchLabels')) {
            $labelsMap = @()
            foreach ($key in $PSBoundParameters['MatchLabels'].Keys) {
                $labelsMap += , @([string]$key, [string]$PSBoundParameters['MatchLabels'][$key])
            }
            $Object.MatchLabelsMap = $labelsMap
        }

        if ($PSBoundParameters.ContainsKey('MatchExpressions')) {
            $Object.MatchExpressionsList = $PSBoundParameters['MatchExpressions']
        }

        return $Object
    }
}