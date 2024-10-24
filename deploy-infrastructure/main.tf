module "cloud_config" {
  source = "./modules/create-cloud-config"
  cloud_config = {
    name         = "basic"
    templatefile = "./cloud-inits/basic.cloud_config.tftpl"
    ssh_user     = var.proxmox_provider_settings.ssh_user
    ssh_password = var.proxmox_provider_settings.ssh_password
    ssh_host     = var.proxmox_provider_settings.ssh_host
  }
}

module "proxmox_vm" {
  depends_on = [module.cloud_config]
  for_each   = toset(["k3s01", "k3s02", "k3s03"])
  source     = "./modules/create-vm"
  vm_config  = var.vm_config[each.value]
}
