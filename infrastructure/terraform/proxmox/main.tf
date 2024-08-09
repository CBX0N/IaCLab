terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
}

module "k3s_vms" {
  # Deploy K3s VM's
  source            = "./modules/vm"
  default_vm_config = var.default_vm_config
  vm_config         = var.k3s_vm_config
}