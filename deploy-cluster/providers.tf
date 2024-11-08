terraform {
  cloud {
    organization = "cbxon"
    workspaces {
      name = "chatgpt"
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
  pm_api_token_id     = var.proxmox_provider_settings.api_token_id
  pm_api_token_secret = var.proxmox_provider_settings.api_token_secret
  pm_api_url          = var.proxmox_provider_settings.api_url
}