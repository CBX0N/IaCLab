variable "proxmox_ssh_config" {
  type = object({
    ssh_user     = string
    ssh_password = string
    ssh_host     = string
  })
}

variable "vm_config" {
  type = object({
    name               = string
    vmid               = string
    memory             = optional(number, 4096)
    balloon            = optional(number, 4096)
    cores              = optional(number, 4)
    sockets            = optional(number, 1)
    disk_size_gb       = optional(number, 40)
    os_type            = optional(string, "cloud-init")
    clone              = string
    ip_config          = string
    target_node        = optional(string, "pve")
    nic                = optional(string, "virtio")
    bridge             = optional(string, "vmbr0")
    disk_location      = string
    cloudinit_location = optional(string, "local-lvm")
    userdata_location  = string
  })
}

variable "userdata_content" {
  type = string
}