terraform {
  backend "remote" {
    organization = "cbxon"
    workspaces {
      name = "Core-IaC"
    }
  }
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}

provider "proxmox" {
  pm_api_token_id     = var.pve_connection.api_token_id
  pm_api_token_secret = var.pve_connection.api_token_secret
  pm_api_url          = var.pve_connection.api_url
}
