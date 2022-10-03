$login = az login
$loginreal = $login | ConvertFrom-Json

az account set --subscription $loginreal.id