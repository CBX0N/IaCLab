terraform {
  backend "remote" {
    organization = "cbxon"
    workspaces {
      name = "Bind9-DNS"
    }
  }
  required_providers {
    dns = {
      source  = "hashicorp/dns"
      version = "3.4.1"
    }
  }
}

provider "dns" {
  update {
    server        = var.bind9_ip
    key_name      = "tsig-key."
    key_algorithm = "hmac-sha256"
    key_secret    = var.bind9_key_secret
  }
}