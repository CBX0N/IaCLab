module "core_vms" {
  for_each                  = toset(["bind9", "haproxy1"])
  source                    = "../terraform-modules/proxmox-vm"
  default_vm_config         = var.default_vm_config
  vm_config                 = var.virtual_machines[each.key]
  proxmox_provider_settings = var.proxmox_provider_settings
}

module "k3s_vms" {
  for_each                  = toset(["k3s0", "k3s1", "k3s2"])
  source                    = "../terraform-modules/proxmox-vm"
  default_vm_config         = var.default_vm_config
  vm_config                 = var.virtual_machines[each.key]
  proxmox_provider_settings = var.proxmox_provider_settings
}