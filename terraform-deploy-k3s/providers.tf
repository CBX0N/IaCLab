terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.32.0"

    }
  }
  backend "kubernetes" {
    config_path   = "~/.kube/config"
    namespace     = "terraform"
    secret_suffix = "terraform"
  }
}

provider "kubernetes" {
  insecure    = true
  config_path = "~/.kube/config"
}