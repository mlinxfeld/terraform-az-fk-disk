locals {
  vm_ok = (!var.attach_to_vm) || (var.attach_to_vm && var.vm_id != null)
}

resource "azurerm_managed_disk" "this" {
  name                 = var.name
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
  tags                 = var.tags

  zone = var.zone == null ? null : tostring(var.zone)

  # UltraSSD only; ignored otherwise
  disk_iops_read_write = var.disk_iops_read_write
  disk_mbps_read_write = var.disk_mbps_read_write

  lifecycle {
    precondition {
      condition     = local.vm_ok
      error_message = "attach_to_vm=true requires vm_id."
    }
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "this" {
  count = var.attach_to_vm ? 1 : 0

  managed_disk_id    = azurerm_managed_disk.this.id
  virtual_machine_id = var.vm_id

  lun     = var.lun
  caching = var.caching

  write_accelerator_enabled = var.write_accelerator_enabled
}

