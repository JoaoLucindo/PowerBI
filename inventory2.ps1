## Referência: https://github.com/Microsoft/powerbi-powershell


## List all Workspaces.

$tentantWorkspaces = Get-PowerBIWorkspace -Scope Organization
Write-Host “Existem –” $tentantWorkspaces.Count “– workspaces nesse tenant, sendo eles:”
$tentantWorkspaces.Id

################################

## List all datasets:

$tentantDataset = Get-PowerBIDataset -Scope Organization
Write-Host “There are –” $tentantDataset.Count “– datasets in this tenant:”
$tentantDataset.Id


################################

## List all datasources

ForEach( $i in $tentantDataset.Id){
Get-PowerBIDatasource -DatasetId $i -Scope Organization | fl

}

################################

## List all gateways using Power BI API: GET https://api.powerbi.com/v1.0/myorg/gateways

$myGateways = Invoke-PowerBIRestMethod -Url ‘Gateways’ -Method Get | ConvertFrom-Json

Write-Host “There are (is) –” $myGateways.value.Count “– gateways:”
$myGateways.value

################################

## List all datasource for each gateway: GET https://api.powerbi.com/v1.0/myorg/gateways/{gatewayId}/datasources

ForEach($j in $myGateways.value.Id) {

$stringAPI = "gateways/"+$j+"/datasources"

$mydatasourcefromgateway = Invoke-PowerBIRestMethod -Url $stringAPI -Method Get | ConvertFrom-Json

$mydatasourcefromgateway.value

}

################################


