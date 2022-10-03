$RG = az group list

$RGReal = $RG | ConvertFrom-Json

$RGNAME = "`"$($RGReal.Name)`""
$RGID = "`"$($RGReal.ID)`""
$RGLOC = "`"$($RGReal.Location)`""

$NameString
Set-Content -Path Core\terraform.tfvars -Value "rg_name = $RGNAME", "rg_id = $RGID", "rg_location = $RGLOC" -PassThru

Set-Content -Path remote-state\terraform.tfvars -Value "rg_name = $RGNAME", "rg_id = $RGID", "rg_location = $RGLOC" -PassThru