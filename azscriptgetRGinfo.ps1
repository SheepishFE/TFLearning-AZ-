$RG = az group list

$RGReal = $RG | ConvertFrom-Json

$RGNAME = "`"$($RGReal.Name)`""
$RGID = "`"$($RGReal.ID)`""
$RGLOC = "`"$($RGReal.Location)`""

$NameString
Set-Content -Path containeringtf\modules\Core\terraform.tfvars -Value "rg_name = $RGNAME", "rg_id = $RGID", "rg_location = $RGLOC" -PassThru

Set-Content -Path remote-state\terraform.tfvars -Value "rg_name = $RGNAME", "rg_id = $RGID", "rg_location = $RGLOC" -PassThru

Remove-Item -Path containeringtf\backend\backend.conf -ErrorAction Ignore
New-Item -Path containeringtf\backend\backend.conf -ItemType File
Add-Content -Path containeringtf\backend\backend.conf -Value "    resource_group_name  = $RGNAME"
Add-Content -Path containeringtf\backend\backend.conf -Value '    container_name       = "tfstate"'
Add-Content -Path containeringtf\backend\backend.conf -Value '    key                  = "prod.terraform.tfstate"'
Add-Content -Path containeringtf\backend\backend.conf -Value '    storage_account_name = "tfstateoc2222"'