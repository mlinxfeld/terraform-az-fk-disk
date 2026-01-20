variable "name" {
  description = "Managed Disk name."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where the disk will be created."
  type        = string
}

variable "location" {
  description = "Azure region for the disk."
  type        = string
}

variable "tags" {
  description = "Tags to apply."
  type        = map(string)
  default     = {}
}

variable "zone" {
  description = "Availability Zone for the disk (e.g. 1, 2, 3). Null = no zone."
  type        = number
  default     = null
}

variable "disk_size_gb" {
  description = "Disk size in GB."
  type        = number
}

variable "storage_account_type" {
  description = "Disk SKU: Standard_LRS, Premium_LRS, StandardSSD_LRS, UltraSSD_LRS."
  type        = string
  default     = "Premium_LRS"
  validation {
    condition     = contains(["Standard_LRS", "Premium_LRS", "StandardSSD_LRS", "UltraSSD_LRS"], var.storage_account_type)
    error_message = "storage_account_type must be one of: Standard_LRS, Premium_LRS, StandardSSD_LRS, UltraSSD_LRS."
  }
}

variable "create_option" {
  description = "Create option: Empty (v1)."
  type        = string
  default     = "Empty"
  validation {
    condition     = contains(["Empty"], var.create_option)
    error_message = "Only create_option = \"Empty\" is supported in v1."
  }
}

variable "disk_iops_read_write" {
  description = "Optional IOPS for UltraSSD_LRS."
  type        = number
  default     = null
}

variable "disk_mbps_read_write" {
  description = "Optional throughput (MBps) for UltraSSD_LRS."
  type        = number
  default     = null
}

# ---- VM attachment (optional) ----

variable "attach_to_vm" {
  description = "If true, attach the disk to a target VM."
  type        = bool
  default     = false
}

variable "vm_id" {
  description = "Target VM id (required if attach_to_vm=true)."
  type        = string
  default     = null
}

variable "lun" {
  description = "Logical Unit Number for the data disk."
  type        = number
  default     = 0
}

variable "caching" {
  description = "Disk caching mode: None | ReadOnly | ReadWrite."
  type        = string
  default     = "ReadOnly"
  validation {
    condition     = contains(["None", "ReadOnly", "ReadWrite"], var.caching)
    error_message = "caching must be one of: None, ReadOnly, ReadWrite."
  }
}

variable "write_accelerator_enabled" {
  description = "Enable write accelerator (requires supported VM sizes and disk types)."
  type        = bool
  default     = false
}

