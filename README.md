### Power BI Inventory

 
**##Install Power BI module**

```powershell
Install-Module -Name MicrosoftPowerBIMgmt
```


**##Login Power BI**

```powershell
Login-PowerBI
```

**##Call Power BI API**

```powershell
$DesktopPath = [Environment]::GetFolderPath("Desktop") +"\inventory.json" 
$myinventory = Invoke-PowerBIRestMethod -Url "https://api.powerbi.com/v1.0/myorg/admin/Groups?%24top=5000&%24expand=users,reports,dashboards,datasets,dataflows" -Method Get
$myinventory | Out-File $DesktopPath
```

