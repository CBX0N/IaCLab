variable "default_vm_config" {
  type = object({
    cores                    = number
    memory                   = number
    target_node              = string
    network_bridge           = string
    network_adapter_firewall = bool
    network_adapter_model    = string
  })
}

variable "vm_config" {
  type = object({
    name             = string
    desc             = optional(string, null)
    boot_order       = optional(string, null)
    target_node      = optional(string, null)
    vm_template_name = string
    vm_state         = optional(string, "stopped")
    qemu_agent       = optional(number, 1)
    cores            = optional(number, null)
    memory           = optional(number, null)
    balloon_min      = optional(number, null)
    cloudinit = optional(object({
      ciuser     = optional(string, null)
      cipassword = optional(string, null)
      dns_server = optional(string, null)
      dns_domain = optional(string, null)
      ipconfig = optional(object({
        ip      = string
        gateway = string
      }), null)
      templatefile = optional(string, null)
    }), null)
    network = optional(object({
      bridge   = string
      firewall = bool
      model    = string
    }))
  })
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