resource "proxmox_vm_qemu" "K3s-VMs" {
  count       = 4
  name        = join("-", [var.K3s-vm-config.name, "0${count.index}"])
  boot        = var.K3s-vm-config.boot_order
  desc        = var.K3s-vm-config.desc
  target_node = var.K3s-vm-config.target_node != null ? var.K3s-vm-config.target_node : var.default-vm-config.target_node
  clone       = var.K3s-vm-config.vm_template_name
  vm_state    = var.K3s-vm-config.vm_state
  full_clone  = true
  agent       = var.K3s-vm-config.qemu_agent
  cores       = var.K3s-vm-config.cores != null ? var.K3s-vm-config.cores : var.default-vm-config.cores
  memory      = var.K3s-vm-config.memory != null ? var.K3s-vm-config.memory : var.default-vm-config.memory
  balloon     = var.K3s-vm-config.balloon_min
  skip_ipv6   = true 
  network {
    bridge   = var.K3s-vm-config.network != null ? var.K3s-vm-config.network.bridge : var.default-vm-config.network_bridge
    firewall = var.K3s-vm-config.network != null ? var.K3s-vm-config.network.firewall : var.default-vm-config.network_adapter_firewall
    model    = var.K3s-vm-config.network != null ? var.K3s-vm-config.network.model : var.default-vm-config.network_adapter_model
  }
  lifecycle {
    ignore_changes = [disks]
  }
}

resource "proxmox_vm_qemu" "HAProxy-VMs" {
  count       = 0
  name        = join("-", [var.HAProxy-vm-config.name, "0${count.index}"])
  boot        = var.HAProxy-vm-config.boot_order
  desc        = var.HAProxy-vm-config.desc
  target_node = var.HAProxy-vm-config.target_node != null ? var.HAProxy-vm-config.target_node : var.default-vm-config.target_node
  clone       = var.HAProxy-vm-config.vm_template_name
  vm_state    = var.HAProxy-vm-config.vm_state
  full_clone  = true
  agent       = var.HAProxy-vm-config.qemu_agent
  cores       = var.HAProxy-vm-config.cores != null ? var.HAProxy-vm-config.cores : var.default-vm-config.cores
  memory      = var.HAProxy-vm-config.memory != null ? var.HAProxy-vm-config.memory : var.default-vm-config.memory
  balloon     = var.HAProxy-vm-config.balloon_min
  skip_ipv6   = true 
  network {
    bridge   = var.HAProxy-vm-config.network != null ? var.HAProxy-vm-config.network.bridge : var.default-vm-config.network_bridge
    firewall = var.HAProxy-vm-config.network != null ? var.HAProxy-vm-config.network.firewall : var.default-vm-config.network_adapter_firewall
    model    = var.HAProxy-vm-config.network != null ? var.HAProxy-vm-config.network.model : var.default-vm-config.network_adapter_model
  }
  lifecycle {
    ignore_changes = [disks]
  }
}