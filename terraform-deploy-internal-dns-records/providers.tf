terraform {
  backend "remote" {
    organization = "cbxon"
    workspaces {
      name = "Bind9-DNS"
    }
  }
  required_providers {
    dns = {
      source = "hashicorp/dns"
    }
  }
}

provider "dns" {
  update {
    server        = var.dns_provider_settings.server
    key_name      = var.dns_provider_settings.key_name
    key_algorithm = var.dns_provider_settings.key_algorithm
    key_secret    = var.dns_provider_settings.key_secret
  }
}