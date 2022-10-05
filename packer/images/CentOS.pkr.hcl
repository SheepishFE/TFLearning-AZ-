variable "rg_name"{
    type = string
    default = "1-15643f87-playground-sandbox"
    sensitive = true
}

variable "rg_id"{
    type = string
    default = "/subscriptions/4cedc5dd-e3ad-468d-bf66-32e31bdb9148/resourceGroups/1-15643f87-playground-sandbox"
    sensitive = true
}

variable "rg_location"{
    type = string
    default = "centralus"
    sensitive = true
}

source "azure-arm" "CentOS8" {
  use_azure_cli_auth = true
  resource_group_name = var.rg_name
  storage_account = "packersa01"

  capture_container_name = "images"
  capture_name_prefix = "packer"

  os_type = "Linux"
  image_publisher = "OpenLogic"
  image_offer = "CentOS"
  image_sku = "8_2-gen2"

  azure_tags = {
    dept = "engineering"
  }

  location = var.rg_location
  vm_size = "Standard_A2"
}

build {
  sources = ["sources.azure-arm.CentOS8"]

  
provisioner "shell" {
   execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
   inline = [
        "/usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync"
   ]
   inline_shebang = "/bin/sh -x"
}

}

#Deprovision
