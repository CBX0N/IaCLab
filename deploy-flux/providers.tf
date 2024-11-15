terraform {
  cloud {}
  required_version = ">= 1.7.0"
  required_providers {
    flux = {
      source  = "fluxcd/flux"
      version = ">= 1.2"
    }
    github = {
      source  = "integrations/github"
      version = ">= 6.1"
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

provider "flux" {
  kubernetes = {
    config_path = local_file.kubeconfig.filename
  }
  git = {
    url = "https://github.com/${var.github_org}/${var.github_repository}.git"
    http = {
      username = "git" # This can be any string when using a personal access token
      password = data.onepassword_item.github_token.password
    }
  }
}

provider "github" {
  owner = var.github_org
  token = data.onepassword_item.github_token.password
}
