function RandomString([bool]$allChars, [int32]$len) {
    if ($allChars) {
        return -join ((33..126) | Get-Random -Count $len | % {[char]$_})
    } else {
        return -join ((48..57) + (97..122) | Get-Random -Count $len | % {[char]$_})
    }
}

function Decode-JWTToken {
 
    [cmdletbinding()]
    param([Parameter(Mandatory=$true)][string]$token)
 
    #Validate as per https://tools.ietf.org/html/rfc7519
    #Access and ID tokens are fine, Refresh tokens will not work
    if (!$token.Contains(".") -or !$token.StartsWith("eyJ")) { Write-Error "Invalid token" -ErrorAction Stop }
 
    #Header
    $tokenheader = $token.Split(".")[0].Replace('-', '+').Replace('_', '/')
    #Fix padding as needed, keep adding "=" until string length modulus 4 reaches 0
    while ($tokenheader.Length % 4) { Write-Verbose "Invalid length for a Base-64 char array or string, adding ="; $tokenheader += "=" }
    Write-Verbose "Base64 encoded (padded) header:"
    Write-Verbose $tokenheader
    #Convert from Base64 encoded string to PSObject all at once
    Write-Verbose "Decoded header:"
    #[System.Text.Encoding]::ASCII.GetString([system.convert]::FromBase64String($tokenheader)) | ConvertFrom-Json | fl | Out-Default
 
    #Payload
    $tokenPayload = $token.Split(".")[1].Replace('-', '+').Replace('_', '/')
    #Fix padding as needed, keep adding "=" until string length modulus 4 reaches 0
    while ($tokenPayload.Length % 4) { Write-Verbose "Invalid length for a Base-64 char array or string, adding ="; $tokenPayload += "=" }
    Write-Verbose "Base64 encoded (padded) payoad:"
    Write-Verbose $tokenPayload
    #Convert to Byte array
    $tokenByteArray = [System.Convert]::FromBase64String($tokenPayload)
    #Convert to string array
    $tokenArray = [System.Text.Encoding]::ASCII.GetString($tokenByteArray)
    Write-Verbose "Decoded array in JSON format:"
    Write-Verbose $tokenArray
    #Convert from JSON to PSObject
    $tokobj = $tokenArray | ConvertFrom-Json
    Write-Verbose "Decoded Payload:"
    
    return $tokobj
}

function Generate-RandomPassword {
    param (
        [int]$length = 16
    )

    $upper = 65..90 | ForEach-Object { [char]$_ } # A-Z
    $lower = 97..122 | ForEach-Object { [char]$_ } # a-z
    $digits = 48..57 | ForEach-Object { [char]$_ } # 0-9
    $special = 33..47 + 58..64 + 91..96 + 123..126 | ForEach-Object { [char]$_ } # Special characters

    $allChars = $upper + $lower + $digits + $special

    $password = -join (1..$length | ForEach-Object { $allChars | Get-Random })

    return $password
}
$env = @{}
if ($UsePreviousConfigForRecord) {
    $previousEnv = Get-Content (Join-Path $PSScriptRoot 'env.json') | ConvertFrom-Json
    $previousEnv.psobject.properties | Foreach-Object { $env[$_.Name] = $_.Value }
}
# Add script method called AddWithCache to $env, when useCache is set true, it will try to get the value from the $env first.
# example: $val = $env.AddWithCache('key', $val, $true)
$env | Add-Member -Type ScriptMethod -Value { param( [string]$key, [object]$val, [bool]$useCache) if ($this.Contains($key) -and $useCache) { return $this[$key] } else { $this[$key] = $val; return $val } } -Name 'AddWithCache'
function setupEnv() {
    # Preload subscriptionId and tenant from context, which will be used in test
    # as default. You could change them if needed.
    #$env.SubscriptionId = (Get-AzContext).Subscription.Id
    #$env.Tenant = (Get-AzContext).Tenant.Id
    if(Get-Module Az.Accounts){} else {
        Install-Module Az.Accounts -Force
    }

    #Constants
    $constants = Get-Content ../../tools/constants.json | ConvertFrom-Json
    #$constants.psobject.Properties | ForEach-Object { $env[$_.Name] = $_.Value }
    if($constants.envToTest){
        $envToTest = $constants.envToTest
    } else { 
        Write-Host "Couldnt find environment to test in constants.json"
        exit
    }

    Connect-AzAccount -UseDeviceAuthentication -Subscription 51a36d38-3b14-471f-8dde-a5867f5e51eb
    $aztoken = Get-AzAccessToken -ResourceUrl  https://znapikeys.vault.azure.net
    $aztoken = ConvertFrom-SecureString $aztoken.Token -AsPlainText
    $azToken = "Bearer "+$azToken
    $azHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $azHeaders.Add("Authorization", $azToken)
    $azHeaders.Add("Content-Type","application/json")
    if($envToTest -eq "prd"){
        $poshSecret = (Invoke-Restmethod -Method Get -Uri https://znapikeys.vault.azure.net/secrets/Posh-PRD-ApiKey?api-version=7.4 -Headers $azHeaders).value
        $teamSecret = (Invoke-Restmethod -Method Get -Uri https://znapikeys.vault.azure.net/secrets/TeamToken?api-version=7.4 -Headers $azHeaders).value
    } elseif($envToTest -eq "stg"){
        $poshSecret = (Invoke-Restmethod -Method Get -Uri https://znapikeys.vault.azure.net/secrets/Posh-STG-ApiKey?api-version=7.4 -Headers $azHeaders).value
        $teamSecret = (Invoke-Restmethod -Method Get -Uri https://znapikeys.vault.azure.net/secrets/TeamToken-Stg?api-version=7.4 -Headers $azHeaders).value
    } elseif($envToTest -eq "dev"){
        $poshSecret = (Invoke-Restmethod -Method Get -Uri https://znapikeys.vault.azure.net/secrets/Posh-DEV-ApiKey?api-version=7.4 -Headers $azHeaders).value
        $teamSecret = (Invoke-Restmethod -Method Get -Uri https://znapikeys.vault.azure.net/secrets/TeamToken-Dev?api-version=7.4 -Headers $azHeaders).value
    } else {
        Write-Host "Couldnt find environment to test in constants.json"
        exit
    }


    try {
        $decodedToken = Decode-JWTToken $poshSecret
        $env:ZNAccountName = $decodedToken.aud.Split(".zeronetworks.com")[0]
        $ZNAccountName = $decodedToken.aud.Split(".zeronetworks.com")[0]
    }
    catch {
        throw
    }

    try {
        $env:ZNApiKey = $poshSecret
    }
    catch {
        throw
    }

    
    #Statics for tests
    $env.Add("baseUri", ("https://"+$decodedToken.aud+"/api/v1"))
    $env.Add("RandomP)", (Generate-RandomPassword))
    $env.Add("K8sCluster", "okd")
    $env.Add("K8sNameSpace", "tcp-demo")
    $env.add("K8sWorkloadInbound", "tcp-echo")
    $env.add("K8sWorkloadOutbound", "tcp-client")

    $znHeader = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    #$znHeader.Add("Authorization", $constants.$envToTest.ZNApiKey)
    $znHeader.Add("Authorization", $poshSecret)
    $znHeader.Add("Content-Type","application/json")

    $znTeamHeader = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    #$znTeamHeader.Add("Authorization", $constants.$envToTest.ZNTeamApiKey)
    $znTeamHeader.Add("Authorization", $teamSecret)
    $znTeamHeader.Add("Content-Type","application/json")
    $znTeamHeader.Add("zn-env-id",$constants.$envToTest.ZNEnvId)


    $expiresAt = [DateTimeOffset]::UtcNow.AddHours(1).ToUnixTimeMilliseconds()

    #assets
    $asset1 = Invoke-RestMethod ($env.baseUri+"/assets/searchId?fqdn=linux0.posh.local") -method GET -Headers $znTeamHeader
    $asset2 = Invoke-RestMethod ($env.baseUri+"/assets/searchId?fqdn=linux1.posh.local") -method GET -Headers $znTeamHeader
    #$asset3 = Invoke-RestMethod ($env.baseUri+"/assets/searchId?fqdn=eve") -method GET -Headers $znTeamHeader

    $env.add("RuleReviewAsset", "linux0.posh.local")
    $env.add("RuleReviewAssetId", $asset1.assetid)

    #Create Review Rules
    #Asset 1-1024, 1025-2048, 2049-3072
    #Inbound
    $rule = "{""action"":1,""remoteEntityIdsList"":["""+($asset2.assetid)+"""],""localEntityId"":"""+($asset1.assetid)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 1 -Maximum 1024)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""state"":1,""localProcessesList"":[""*""],""reviewMode"":2}"
    Invoke-RestMethod ($env.baseUri+"/protection/rules/inbound") -method POST -Headers $znTeamHeader -Body $rule

    $rule = "{""action"":1,""remoteEntityIdsList"":["""+($asset2.assetid)+"""],""localEntityId"":"""+($asset1.assetid)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 1025 -Maximum 2048)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""state"":1,""localProcessesList"":[""*""],""reviewMode"":2}"
    Invoke-RestMethod ($env.baseUri+"/protection/rules/inbound") -method POST -Headers $znTeamHeader -Body $rule
    
    $rule = "{""action"":1,""remoteEntityIdsList"":["""+($asset2.assetid)+"""],""localEntityId"":"""+($asset1.assetid)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 2049 -Maximum 3072)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""state"":1,""localProcessesList"":[""*""],""reviewMode"":2}"
    Invoke-RestMethod ($env.baseUri+"/protection/rules/inbound") -method POST -Headers $znTeamHeader -Body $rule
    #Outbound
    $rule = "{""action"":1,""remoteEntityIdsList"":["""+($asset2.assetid)+"""],""localEntityId"":"""+($asset1.assetid)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 1 -Maximum 1024)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""state"":1,""localProcessesList"":[""*""],""reviewMode"":2}"
    Invoke-RestMethod ($env.baseUri+"/protection/rules/outbound") -method POST -Headers $znTeamHeader -Body $rule

    $rule = "{""action"":1,""remoteEntityIdsList"":["""+($asset2.assetid)+"""],""localEntityId"":"""+($asset1.assetid)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 1025 -Maximum 2048)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""state"":1,""localProcessesList"":[""*""],""reviewMode"":2}"
    Invoke-RestMethod ($env.baseUri+"/protection/rules/outbound") -method POST -Headers $znTeamHeader -Body $rule
    
    $rule = "{""action"":1,""remoteEntityIdsList"":["""+($asset2.assetid)+"""],""localEntityId"":"""+($asset1.assetid)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 2049 -Maximum 3072)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""state"":1,""localProcessesList"":[""*""],""reviewMode"":2}"
    Invoke-RestMethod ($env.baseUri+"/protection/rules/outbound") -method POST -Headers $znTeamHeader -Body $rule
    
    #Generic 6145-7168, 7169-8192, 8193-9216
    #Inbound
    $rule = "{""action"":1,""remoteEntityIdsList"":["""+($asset2.assetid)+"""],""localEntityId"":"""+($asset1.assetid)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 6145 -Maximum 7168)+""",""protocolType"":17}],""expiresAt"":"+($expiresAt)+",""description"":"""",""state"":1,""localProcessesList"":[""*""],""reviewMode"":2}"
    Invoke-RestMethod ($env.baseUri+"/protection/rules/inbound") -method POST -Headers $znTeamHeader -Body $rule

    $rule = "{""action"":1,""remoteEntityIdsList"":["""+($asset2.assetid)+"""],""localEntityId"":"""+($asset1.assetid)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 7169 -Maximum 8192)+""",""protocolType"":17}],""expiresAt"":"+($expiresAt)+",""description"":"""",""state"":1,""localProcessesList"":[""*""],""reviewMode"":2}"
    Invoke-RestMethod ($env.baseUri+"/protection/rules/inbound") -method POST -Headers $znTeamHeader -Body $rule

    $rule = "{""action"":1,""remoteEntityIdsList"":["""+($asset2.assetid)+"""],""localEntityId"":"""+($asset1.assetid)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 8193 -Maximum 9216)+""",""protocolType"":17}],""expiresAt"":"+($expiresAt)+",""description"":"""",""state"":1,""localProcessesList"":[""*""],""reviewMode"":2}"
    Invoke-RestMethod ($env.baseUri+"/protection/rules/inbound") -method POST -Headers $znTeamHeader -Body $rule
    #Outbound
    $rule = "{""action"":1,""remoteEntityIdsList"":["""+($asset2.assetid)+"""],""localEntityId"":"""+($asset1.assetid)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 6145 -Maximum 7168)+""",""protocolType"":17}],""expiresAt"":"+($expiresAt)+",""description"":"""",""state"":1,""localProcessesList"":[""*""],""reviewMode"":2}"
    Invoke-RestMethod ($env.baseUri+"/protection/rules/outbound") -method POST -Headers $znTeamHeader -Body $rule

    $rule = "{""action"":1,""remoteEntityIdsList"":["""+($asset2.assetid)+"""],""localEntityId"":"""+($asset1.assetid)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 7169 -Maximum 8192)+""",""protocolType"":17}],""expiresAt"":"+($expiresAt)+",""description"":"""",""state"":1,""localProcessesList"":[""*""],""reviewMode"":2}"
    Invoke-RestMethod ($env.baseUri+"/protection/rules/outbound") -method POST -Headers $znTeamHeader -Body $rule

    $rule = "{""action"":1,""remoteEntityIdsList"":["""+($asset2.assetid)+"""],""localEntityId"":"""+($asset1.assetid)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 8193 -Maximum 9216)+""",""protocolType"":17}],""expiresAt"":"+($expiresAt)+",""description"":"""",""state"":1,""localProcessesList"":[""*""],""reviewMode"":2}"
    Invoke-RestMethod ($env.baseUri+"/protection/rules/outbound") -method POST -Headers $znTeamHeader -Body $rule

    #Create rules for suggest deletion
    #Approve/Deny
    # 2x Asset, 2x, Asset OT, 2x Groups, 1x User

    #assets
    $assetLinux = Invoke-RestMethod ($env.baseUri+"/assets/searchId?fqdn=linux0.posh.local") -method GET -Headers $znTeamHeader
    $assetOt = Invoke-RestMethod ($env.baseUri+"/assets/searchId?fqdn=poshotv2.posh.local") -method GET -Headers $znTeamHeader
    $group = Invoke-RestMethod ($env.baseUri+"/groups?_limit=10&_offset=0&_search=DHCP") -method GET -Headers $znTeamHeader
    $user = Invoke-RestMethod ($env.baseUri+"/users?_limit=10&_offset=0&_search=posh%5Czero&with_count=True") -method GET -Headers $znTeamHeader

    $env.add("RuleReviewSuggestDeleteAsset", "linux0.posh.local")
    $env.add("RuleReviewSuggestDeleteAssetId", $assetLinux.assetid)
    $env.add("RuleReviewSuggestDeleteAssetOt", "poshotv2.posh.local")
    $env.add("RuleReviewSuggestDeleteAssetOtId", $assetOt.assetid)
    $env.add("RuleReviewSuggestDeleteGroup", "DHCP")
    $env.add("RuleReviewSuggestDeleteGroupId", $group.items[0].id)
    $env.add("RuleReviewSuggestDeleteUser", "posh\zero")
    $env.add("RuleReviewSuggestDeleteUserId", $user.items[0].id)

    $pendingDeletes = @()
    #Asset Inbound Approve Deny
    $rule = "{""action"":1,""remoteEntityIdsList"":[""b:110001""],""localEntityId"":"""+($assetLinux.assetid)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 3000 -Maximum 3500)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""reviewMode"": 1,""state"":1,""localProcessesList"":[""*""]}"
    $pendingDeletes += (Invoke-RestMethod ($env.baseUri+"/protection/rules/inbound") -method POST -Headers $znTeamHeader -Body $rule).item.id
    $rule = "{""action"":1,""remoteEntityIdsList"":[""b:110001""],""localEntityId"":"""+($assetLinux.assetid)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 3501 -Maximum 4000)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""reviewMode"": 1,""state"":1,""localProcessesList"":[""*""]}"
    $pendingDeletes += (Invoke-RestMethod ($env.baseUri+"/protection/rules/inbound") -method POST -Headers $znTeamHeader -Body $rule).item.id
    #Asset Outbound Approve Deny
    $rule = "{""action"":1,""remoteEntityIdsList"":[""b:110001""],""localEntityId"":"""+($assetLinux.assetid)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 4000 -Maximum 4500)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""reviewMode"": 1,""state"":1,""localProcessesList"":[""*""]}"
    $pendingDeletes += (Invoke-RestMethod ($env.baseUri+"/protection/rules/outbound") -method POST -Headers $znTeamHeader -Body $rule).item.id
    $rule = "{""action"":1,""remoteEntityIdsList"":[""b:110001""],""localEntityId"":"""+($assetLinux.assetid)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 4501 -Maximum 5000)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""reviewMode"": 1,""state"":1,""localProcessesList"":[""*""]}"
    $pendingDeletes += (Invoke-RestMethod ($env.baseUri+"/protection/rules/outbound") -method POST -Headers $znTeamHeader -Body $rule).item.id
    
    #Asset OT Inbound Approve Deny
    $rule = "{""action"":1,""remoteEntityIdsList"":["""+$assetOt.assetid+"""],""localEntityId"":""b:110002"",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 3000 -Maximum 3500)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""reviewMode"": 1,""state"":1,""localProcessesList"":[""*""]}"
    $pendingDeletes += (Invoke-RestMethod ($env.baseUri+"/protection/rules/inbound") -method POST -Headers $znTeamHeader -Body $rule).item.id
    $rule = "{""action"":1,""remoteEntityIdsList"":["""+$assetOt.assetid+"""],""localEntityId"":""b:110002"",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 3501 -Maximum 4000)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""reviewMode"": 1,""state"":1,""localProcessesList"":[""*""]}"
    $pendingDeletes += (Invoke-RestMethod ($env.baseUri+"/protection/rules/inbound") -method POST -Headers $znTeamHeader -Body $rule).item.id
    #Asset OT Outbound Approve Deny
    $rule = "{""action"":1,""remoteEntityIdsList"":["""+$assetOt.assetid+"""],""localEntityId"":""b:110002"",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 4000 -Maximum 4500)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""reviewMode"": 1,""state"":1,""localProcessesList"":[""*""]}"
    $pendingDeletes += (Invoke-RestMethod ($env.baseUri+"/protection/rules/outbound") -method POST -Headers $znTeamHeader -Body $rule).item.id
    $rule = "{""action"":1,""remoteEntityIdsList"":["""+$assetOt.assetid+"""],""localEntityId"":""b:110002"",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 4501 -Maximum 5000)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""reviewMode"": 1,""state"":1,""localProcessesList"":[""*""]}"
    $pendingDeletes += (Invoke-RestMethod ($env.baseUri+"/protection/rules/outbound") -method POST -Headers $znTeamHeader -Body $rule).item.id
    
    #Group Inbound Approve Deny
    $rule = "{""action"":1,""remoteEntityIdsList"":[""b:110001""],""localEntityId"":"""+($group.items[0].id)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 3000 -Maximum 3500)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""reviewMode"": 1,""state"":1,""localProcessesList"":[""*""]}"
    $pendingDeletes += (Invoke-RestMethod ($env.baseUri+"/protection/rules/inbound") -method POST -Headers $znTeamHeader -Body $rule).item.id
    $rule = "{""action"":1,""remoteEntityIdsList"":[""b:110001""],""localEntityId"":"""+($group.items[0].id)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 3501 -Maximum 4000)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""reviewMode"": 1,""state"":1,""localProcessesList"":[""*""]}"
    $pendingDeletes += (Invoke-RestMethod ($env.baseUri+"/protection/rules/inbound") -method POST -Headers $znTeamHeader -Body $rule).item.id
    #Group Outbound Approve Deny
    $rule = "{""action"":1,""remoteEntityIdsList"":[""b:110001""],""localEntityId"":"""+($group.items[0].id)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 4000 -Maximum 4500)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""reviewMode"": 1,""state"":1,""localProcessesList"":[""*""]}"
    $pendingDeletes += (Invoke-RestMethod ($env.baseUri+"/protection/rules/outbound") -method POST -Headers $znTeamHeader -Body $rule).item.id
    $rule = "{""action"":1,""remoteEntityIdsList"":[""b:110001""],""localEntityId"":"""+($group.items[0].id)+""",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 4501 -Maximum 5000)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""reviewMode"": 1,""state"":1,""localProcessesList"":[""*""]}"
    $pendingDeletes += (Invoke-RestMethod ($env.baseUri+"/protection/rules/outbound") -method POST -Headers $znTeamHeader -Body $rule).item.id

    #User outbound Approve Deny
    $rule = "{""action"":1,""remoteEntityIdsList"":[""b:110001""],""localEntityId"":""b:110002"",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 5000 -Maximum 5250)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""reviewMode"": 1,""state"":1,""localProcessesList"":[""*""], ""srcUsersList"":[{""id"": """+($user.items[0].id)+"""}]}"
    $pendingDeletes += (Invoke-RestMethod ($env.baseUri+"/protection/rules/outbound") -method POST -Headers $znTeamHeader -Body $rule).item.id
    $rule = "{""action"":1,""remoteEntityIdsList"":[""b:110001""],""localEntityId"":""b:110002"",""excludedLocalIdsList"":[],""portsList"":[{""ports"":"""+(Get-Random -Minimum 5000 -Maximum 5250)+""",""protocolType"":6}],""expiresAt"":"+($expiresAt)+",""description"":"""",""reviewMode"": 1,""state"":1,""localProcessesList"":[""*""], ""srcUsersList"":[{""id"": """+($user.items[0].id)+"""}]}"
    $pendingDeletes += (Invoke-RestMethod ($env.baseUri+"/protection/rules/outbound") -method POST -Headers $znTeamHeader -Body $rule).item.id


    write-Host "Pending Deletes Rule Ids: "+$pendingDeletes
    write-Host "You will need to mark these Ids as proposed deletes."
    start-sleep -Seconds (60*10) # Sleep for 10 minutes to allow time for manual review
    


    #$tagGroup = "g:t:27"+$constants.$envtoTest.ZNEnvId.Substring($constants.$envtoTest.ZNEnvId.Length-6)
    #$assets = Invoke-RestMethod -Method GET -URi ($env.baseUri+"/assets/monitored?_limit=400&_offset=0&_filters=&with_count=true&order=asc&orderColumns[]=name&showInactive=false") -Headers $znTeamHeader
    #$assetId = ($assets.items | where {$_.Name -eq "dc01"}).Id
    #$tagbody = @{
        #"membersId" = @(
    #        "$assetId"
    #    )
    #} | ConvertTo-Json
    #Invoke-RestMethod -Method PUT -URi ($env.baseUri+"/internal/tag-groups/"+$tagGroup+"/members") -Headers $znTeamHeader -Body $tagbody

# For any resources you created for test, you should add it to $env here.
    $envFile = 'env.json'
    if ($TestMode -eq 'live') {
        $envFile = 'localEnv.json'
    }
    set-content -Path (Join-Path $PSScriptRoot $envFile) -Value (ConvertTo-Json $env)
}
function cleanupEnv() {
    # Clean resources you create for testing
    
    $env = @{}

    
}   

