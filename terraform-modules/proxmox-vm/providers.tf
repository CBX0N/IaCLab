terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc3"
    }
    local = {
      source = "hashicorp/local"
    }
  }
}