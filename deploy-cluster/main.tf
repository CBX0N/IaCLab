module "k3s_cluster" {
  source            = "./modules/create-k3s-cluster"
  proxmox_vm_config = var.proxmox_vm_config
  cluster_config    = var.cluster_config
  nodes             = var.nodes
  proxmox_ssh_config = {
    ssh_user     = var.proxmox_provider_settings.ssh_user
    ssh_password = var.proxmox_provider_settings.ssh_password
    ssh_host     = var.proxmox_provider_settings.ssh_host
  }
}