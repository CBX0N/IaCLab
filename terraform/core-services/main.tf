terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.31.0"
    }
  }
  backend "kubernetes" {
    config_path   = "~/.kube/config"
    secret_suffix = "tfstate"
    namespace     = "terraform"
  }
}

resource "kubernetes_pod" "nginx" {
  metadata {
    name = "nginx"
    labels = {
      run = "nginx"
    }
  }
  spec {
    container {
      image = "nginx"
      name  = "nginx"
      port {
        container_port = 80
      }
    }
  }
}

resource "kubernetes_service" "nginx-node-port" {
  metadata {
    name = "nginx-node-port"
    labels = {
      run = "nginx"
    }
  }
  spec {
    type = "NodePort"
    port {
      node_port   = 30030
      target_port = 80
      port        = 80
    }
    selector = {
      run = "nginx"
    }
  }
}