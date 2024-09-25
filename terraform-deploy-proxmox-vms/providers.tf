terraform {
  backend "remote" {
    organization = "cbxon"
    workspaces {
      name = "Core-IaC"
    }
  }
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

provider "proxmox" {
  pm_api_token_id     = var.proxmox_provider_settings.api_token_id
  pm_api_token_secret = var.proxmox_provider_settings.api_token_secret
  pm_api_url          = var.proxmox_provider_settings.api_url
}