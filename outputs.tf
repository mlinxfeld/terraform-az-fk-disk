output "disk_id" {
  description = "Managed Disk resource id."
  value       = azurerm_managed_disk.this.id
}

output "disk_name" {
  description = "Managed Disk name."
  value       = azurerm_managed_disk.this.name
}

output "disk_size_gb" {
  description = "Disk size in GB."
  value       = azurerm_managed_disk.this.disk_size_gb
}

output "storage_account_type" {
  description = "Disk SKU."
  value       = azurerm_managed_disk.this.storage_account_type
}

output "attached_to_vm" {
  description = "True if disk was attached to VM."
  value       = length(azurerm_virtual_machine_data_disk_attachment.this) > 0
}

output "lun" {
  description = "LUN used for attachment (if attached)."
  value       = var.lun
}

