### PowerBI Inventory

 
**##Install Power BI module**

```sh
Install-Module -Name MicrosoftPowerBIMgmt
```


**##Login Power BI**

```sh
Login-PowerBI
```

**##Call Power BI API**

```sh
$DesktopPath = [Environment]::GetFolderPath("Desktop") +"\inventory.json" 
$myinventory = Invoke-PowerBIRestMethod -Url "https://api.powerbi.com/v1.0/myorg/admin/Groups?%24top=2&%24expand=users,reports,dashboards,datasets,dataflows" -Method Get
$myinventory | Out-File $DesktopPath
```

