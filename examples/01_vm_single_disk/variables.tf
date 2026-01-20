variable "location" {
  description = "Azure region"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Resource group name for this example"
  type        = string
  default     = "fk-rg"
}

variable "vm_name" {
  description = "Azure VM name."
  type    = string
  default = "fk-public-vm"
}

variable "vnet_name" {
  description = "VNet Name"
  type        = string
  default     = "fk-vnet"
}

variable "vnet_address_space" {
  description = "VNet CIDR"
  type        = string
  default     = "10.10.0.0/16"
}

variable "vm_size" {
  description = "Azure VM size."
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Linux admin username"
  type        = string
  default     = "azureuser"
}

variable "disk_name" {
  description = "Managed Disk Name."
  type        = string
  default     = "fkdisk"
}
variable "disk_size_gb" {
  description = "Data disk size in GB."
  type        = number
  default     = 64
}

variable "disk_sku" {
  description = "Managed Disk SKU."
  type        = string
  default     = "Premium_LRS"
}

variable "subnets" {
  description = "Purpose-driven subnets"
  type = map(object({
    address_prefixes = list(string)
  }))
  default = {
    fk-subnet-public = {
      address_prefixes = ["10.10.0.0/24"]
    }
  }
}

variable "tags" {
  description = "Tags."
  type        = map(string)
  default     = {
    project = "foggykitchen"
    module  = "terraform-az-fk-disk"
    example = "01_vm_single_disk"
  }
}
