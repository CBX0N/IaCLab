module "dk_vms" {
  # Deploy Docker VM's
  source            = "./modules/vm"
  default_vm_config = var.default_vm_config
  vm_config         = var.dk_vm_config
}

module "k3s_vms" {
  # Deploy K3s VM's
  source            = "./modules/vm"
  default_vm_config = var.default_vm_config
  vm_config         = var.k3s_vm_config
}

module "lb_vms" {
  # Deploy HAProxy VM's
  source            = "./modules/vm"
  default_vm_config = var.default_vm_config
  vm_config         = var.lb_vm_config
}