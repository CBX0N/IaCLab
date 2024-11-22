variable "cluster_config" {
  type = object({
    primary_service_run_command     = string
    secondaries_service_run_command = string
    admin_user                      = string
    admin_password                  = optional(string, "")
    ssh_keys                        = optional(list(string), [])
    packages                        = optional(list(string), [])
    k3s_images_url                  = string
    k3s_bin_url                     = string
    k3s_service_url                 = string
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

variable "onepassword_service_account_token" {
  type = string
}

variable "onepassword_vault" {
  type = string
}

variable "onepassword_secrets" {
  type = object({
    proxmox_ssh  = string
    proxmox_api  = string
    github_token = string
  })
}

variable "environment" {
  type = string
}

variable "github_org" {
  description = "GitHub organization"
  type        = string
  default     = ""
}

variable "github_repository" {
  description = "GitHub repository"
  type        = string
  default     = ""
}

variable "github_repository_visibility" {
  description = "GitHub repository visibility"
  type        = string
  default     = "private"
}