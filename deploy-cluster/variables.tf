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
variable "cluster_config" {
  type = object({
    primary_service_run_command     = string
    secondaries_service_run_command = string
  })
}

variable "proxmox_vm_config" {
  type = object({
    memory             = optional(number, 4096)
    balloon            = optional(number, 4096)
    cores              = optional(number, 4)
    sockets            = optional(number, 1)
    disk_size_gb       = optional(number, 40)
    os_type            = optional(string, "cloud-init")
    clone              = string
    ip_gateway         = string
    ip_prefix          = string
    subnet_size        = optional(number, 24)
    target_node        = optional(string, "pve")
    nic                = optional(string, "virtio")
    bridge             = optional(string, "vmbr0")
    disk_location      = string
    cloudinit_location = optional(string, "local-lvm")
  })
}

variable "nodes" {
  type = map(object({
    type = string
    vmid = number
  }))
}
