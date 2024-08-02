variable "pm_api_url" {
  type = string
}
variable "pm_api_token_id" {
  type = string
}
variable "pm_api_token_secret" {
  type = string
}

variable "default-vm-config" {
  type = object({
    cores                    = number
    memory                   = number
    target_node              = string
    network_bridge           = string
    network_adapter_firewall = bool
    network_adapter_model    = string
  })
}

variable "K3s-vm-config" {
  type = object({
    name             = string
    desc             = optional(string, null)
    boot_order       = optional(string, null)
    target_node      = optional(string, null)
    vm_template_name = string
    qemu_agent       = optional(number, 1)
    cores            = optional(number, null)
    memory           = optional(number, null)
    balloon_min      = optional(number, null)
    network = optional(object({
      bridge   = string
      firewall = bool
      model    = string
    }))
  })
}

variable "HAProxy-vm-config" {
  type = object({
    name             = string
    desc             = optional(string, null)
    boot_order       = optional(string, null)
    target_node      = optional(string, null)
    vm_template_name = string
    qemu_agent       = optional(number, 1)
    cores            = optional(number, null)
    memory           = optional(number, null)
    balloon_min      = optional(number, null)
    network = optional(object({
      bridge   = string
      firewall = bool
      model    = string
    }))
  })
}