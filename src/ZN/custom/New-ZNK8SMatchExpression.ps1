<#
    .Synopsis
    Create a in-memory object for K8SMatchExpression
    .Description
    Create a in-memory object for K8SMatchExpression

    .Outputs
    ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SMatchExpression
    .Link
    https://github.com/zeronetworks/zero-powershell/zeronetworks/new-znk8smatchexpression
    #>
function New-ZNK8SMatchExpression {
    [OutputType([ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SMatchExpression])]
    [CmdletBinding(PositionalBinding = $false)]
    Param(

        [Parameter(Mandatory, HelpMessage = "Label key the expression applies to")]
        [string]
        $Key,

        [Parameter(Mandatory, HelpMessage = "Match operator")]
        [ValidateSet("In", "NotIn", "Exists", "DoesNotExist")]
        [string]
        $Operator,

        [Parameter(HelpMessage = "List of values, required for In/NotIn operators")]
        [string[]]
        $Values
    )

    process {
        $Object = [ZeroNetworks.PowerShell.Cmdlets.Api.Models.K8SMatchExpression]::New()

        $Object.Key = $PSBoundParameters['Key']

        switch ($PSBoundParameters['Operator']) {
            "In" {
                $Object.Operator = 1
                $Object.ValuesList = $PSBoundParameters['Values']
            }
            "NotIn" {
                $Object.Operator = 2
                $Object.ValuesList = $PSBoundParameters['Values']
            }
            "Exists" {
                $Object.Operator = 3
                $Object.ValuesList = @()
            }
            "DoesNotExist" {
                $Object.Operator = 4
                $Object.ValuesList = @()
            }
        }

        return $Object
    }
}
