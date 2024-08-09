variable "proxmox_url" {
  type        = string
  description = "Proxmox API URL, E.G. https://proxmox:8006/api2/json"
}

variable "proxmox_token" {
  type        = string
  description = "Proxmox API Token"
}

variable "proxmox_user" {
  type        = string
  description = "Proxmox API User E.G. root@pam!terraform"
}

variable "proxmox_node" {
  type        = string
  description = "Proxmox Node E.G. pve"
}

variable "ssh_password" {
  type        = string
  description = "SSH Password"
}