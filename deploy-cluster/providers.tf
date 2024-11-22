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
    flux = {
      source  = "fluxcd/flux"
      version = ">= 1.2"
    }
    github = {
      source = "integrations/github"
      version = "6.4.0"
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

provider "flux" {
  kubernetes = {
    config_path = local_file.kubeconfig.filename
  }
  git = {
    url = "https://github.com/${var.github_org}/${var.github_repository}.git"
    http = {
      username = "git"
      password = data.onepassword_item.github_token.password
    }
  }
}

provider "github" {
  owner = var.github_org
  token = data.onepassword_item.github_token.password
}
