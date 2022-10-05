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

source "azure-arm" "basic-example" {
  use_azure_cli_auth = true
  resource_group_name = var.rg_name
  storage_account = "packersa01"
  subscription_id = "4cedc5dd-e3ad-468d-bf66-32e31bdb9148"

  capture_container_name = "images"
  capture_name_prefix = "packer"

  os_type = "Linux"
  image_publisher = "Canonical"
  image_offer = "UbuntuServer"
  image_sku = "14.04.4-LTS"

  azure_tags = {
    dept = "engineering"
  }

  location = var.rg_location
  vm_size = "Standard_A2"
}

build {
  sources = ["sources.azure-arm.basic-example"]
}