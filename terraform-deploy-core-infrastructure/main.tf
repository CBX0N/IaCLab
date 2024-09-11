module "bind9_vm" {
  source            = "../terraform-modules/vm"
  default_vm_config = var.default_vm_config
  vm_config         = var.virtual_machines["bind9"]
  pve_connection    = var.pve_connection
}

# module "k3s_vm" {
#   for_each          = toset(["k3s0", "k3s1", "k3s2"])
#   source            = "../terraform-modules/vm"
#   default_vm_config = var.default_vm_config
#   vm_config         = var.virtual_machines[each.key]
#   pve_connection    = var.pve_connection
# }

module "haproxy_vm" {
  for_each          = toset(["haproxy1"])
  source            = "../terraform-modules/vm"
  default_vm_config = var.default_vm_config
  vm_config         = var.virtual_machines[each.key]
  pve_connection    = var.pve_connection
}