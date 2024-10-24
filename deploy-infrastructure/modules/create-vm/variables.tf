variable "vm_config" {
  type = object({
    name               = string
    vmid               = number
    target_node        = string
    clone              = string
    cores              = number
    sockets            = number
    memory             = number
    balloon            = number
    nic                = string
    bridge             = string
    os_type            = string
    ipconfig           = string
    disk_gb            = number
    disk_location      = string
    cloudinit_location = string
    use_cloud_config   = bool
    cloud_config_path  = string
  })
}
