resource "random_password" "cluster_token" {
  length  = 10
  lower   = true
  special = false
}

module "proxmox_vm" {
  depends_on         = [random_password.cluster_token]
  for_each           = var.nodes
  source             = "./modules/create-proxmox-vm"
  userdata_content   = local.cloud_config[each.key]
  vm_config          = local.vm_config[each.key]
  proxmox_ssh_config = var.proxmox_ssh_config
}