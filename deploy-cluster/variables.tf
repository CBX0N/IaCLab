variable "vm_config" {
  type = map(object({
    name               = string
    vmid               = number
    target_node        = optional(string, "pve")
    clone              = optional(string)
    cores              = optional(number, 2)
    sockets            = optional(number, 1)
    memory             = optional(number, 1024)
    balloon            = optional(number, 512)
    nic                = optional(string, "virtio")
    bridge             = optional(string, "vmbr0")
    os_type            = optional(string, "cloud-init")
    ipconfig           = string
    disk_gb            = optional(number, 16)
    disk_location      = optional(string, "datastore1")
    cloudinit_location = optional(string, "local-lvm")
    use_cloud_config   = optional(bool, false)
    cloud_config_path  = optional(string, "user=local:snippets/user_data_basic.yaml")
  }))
}

variable "proxmox_provider_settings" {
  type = object({
    api_token_id     = string
    api_token_secret = string
    api_url          = string
    ssh_user         = string
    ssh_password     = string
    ssh_host         = string
  })
}
