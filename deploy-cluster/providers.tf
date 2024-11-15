terraform {
  cloud {}
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
    onepassword = {
      source  = "1Password/onepassword"
      version = "2.1.2"
    }
  }
}

provider "onepassword" {
  service_account_token = var.onepassword_service_account_token
}

provider "proxmox" {
  pm_api_token_id     = data.onepassword_item.proxmox_api.username
  pm_api_token_secret = data.onepassword_item.proxmox_api.password
  pm_api_url          = data.onepassword_item.proxmox_api.url
}