terraform {
  cloud {}
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
    onepassword = {
      source = "1Password/onepassword"
    }
    flux = {
      source = "fluxcd/flux"
    }
    github = {
      source = "integrations/github"
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