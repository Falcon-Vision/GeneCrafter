$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("authorization", "Bearer ")
$headers.Add("X-GitHub-Api-Version", "2022-11-28")
$headers.Add("Accept", "application/vnd.github.v3.raw")

$apiresponse = Invoke-RestMethod 'https://api.github.com/repos/Vihaswi/GeneCrafter/actions/runs' -Method 'GET' -Headers $headers

$workflows = $apiresponse.workflow_runs

foreach ($workflow in $workflows) {
    $id = $workflow.id
    $url = "https://api.github.com/repos/Vihaswi/GeneCrafter/actions/runs/" + $id
    $response = Invoke-RestMethod $url -Method 'DELETE' -Headers $headers
    $response | ConvertTo-Json
}