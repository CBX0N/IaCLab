data "onepassword_item" "proxmox_ssh" {
  vault = var.onepassword_vault
  title = var.onepassword_secrets.proxmox_ssh
}

data "onepassword_item" "proxmox_api" {
  vault = var.onepassword_vault
  title = var.onepassword_secrets.proxmox_api
}

data "onepassword_item" "cluster_ssh_keys" {
  for_each = toset(var.cluster_config.ssh_keys)
  vault    = var.onepassword_vault
  title    = each.key
}