1. Initialise playground in ACG
2. Run "azscriptlogin.ps1" and authenticate azcli
3. Run "azscriptgetRGinfo.ps1"
4. cd into remote-state, init and apply 
5. cd into packer\terraform, init with *terraform init --backend-config=backend\backend.conf* and apply
6. cd into images, 
7. cd into containeringtf, init with *terraform init --backend-config=backend\backend.conf* and apply