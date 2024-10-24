terraform {
  backend "kubernetes" {
    secret_suffix = "helm-state"
    namespace     = "terraform"
    config_path   = "~/.kube/config"
  }
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.16.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.33.0"
    }
    # argocd = {
    #   source  = "argoproj-labs/argocd"
    #   version = "7.0.3"
    # }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# provider "kubernetes" {
#   config_path = "~/.kube/config"
# }

# provider "argocd" {
#     server_addr = var.argocd_url
#     username = "admin"
#     password = var.argocd_server_admin_password
# }