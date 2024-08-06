resource "proxmox_vm_qemu" "vm" {
  count       = var.vm_config.count
  name        = join("-", [var.vm_config.name, "0${count.index}"])
  boot        = var.vm_config.boot_order
  desc        = var.vm_config.desc
  target_node = var.vm_config.target_node != null ? var.vm_config.target_node : var.default_vm_config.target_node
  clone       = var.vm_config.vm_template_name
  vm_state    = var.vm_config.vm_state
  full_clone  = true
  agent       = var.vm_config.qemu_agent
  cores       = var.vm_config.cores != null ? var.vm_config.cores : var.default_vm_config.cores
  memory      = var.vm_config.memory != null ? var.vm_config.memory : var.default_vm_config.memory
  balloon     = var.vm_config.balloon_min
  skip_ipv6   = true
  network {
    bridge   = var.vm_config.network != null ? var.vm_config.network.bridge : var.default_vm_config.network_bridge
    firewall = var.vm_config.network != null ? var.vm_config.network.firewall : var.default_vm_config.network_adapter_firewall
    model    = var.vm_config.network != null ? var.vm_config.network.model : var.default_vm_config.network_adapter_model
  }
  lifecycle {
    ignore_changes = [disks]
  }
}