terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.31.0"
    }
    dns = {
      source  = "hashicorp/dns"
      version = "3.4.1"
    }
  }
  backend "kubernetes" {
    config_path   = "./kube.config"
    secret_suffix = "tfstate"
    namespace     = "terraform"
  }
}

provider "kubernetes" {
  config_path = "./kube.config"
}

provider "dns" {
  update {
    server        = var.k3s_master_host
    key_name      = "tsig-key."
    key_algorithm = "hmac-sha256"
    key_secret    = var.bind9_key_secret
  }
}