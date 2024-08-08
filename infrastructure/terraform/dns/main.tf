terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.31.0"
    }
  }
  backend "kubernetes" {
    config_path   = "./kube.config"
    secret_suffix = "tfstate"
    namespace     = "terraform"
  }
}

resource "kubernetes_config_map" "bind9_config" {
  metadata {
    name = "bind-config"
  }
  data = {
    "named.conf" = file("./named.conf")
  }
}

# resource "kubernetes_service" "bind9_service" {
#   metadata {
#     name = "bind9-service"
#     labels = {
#       "app" = "bind9"
#     }
#   }
#   spec {
#     selector = {
#       "app" = "bind9"
#     }
#     port {
#       port        = 5353
#       protocol    = "TCP"
#       target_port = 53
#       name        = "bind9-tcp"
#     }
#     port {
#       port        = 5353
#       protocol    = "UDP"
#       target_port = 53
#       name        = "bind9"
#     }
#   }
# }

resource "kubernetes_manifest" "bind9-deployment" {
  manifest = {
    apiVersion = "apps/v1"
    kind       = "Deployment"
    metadata = {
      namespace = "default"
      labels = {
        app = "bind9"
      }
      name = "bind9-deployment"
    }
    spec = {
      replicas = 1
      selector = {
        matchLabels = {
          app = "bind9"
        }
      }
      strategy = {}
      template = {
        metadata = {
          labels = {
            app = "bind9"
          }
          spec = {
            volumes = {
              name = "bind-config"
              configMap = {
                name = "bind-config"
                items = {
                  key  = "named.conf"
                  path = "named.conf"
                }
              }
            }
            containers = {
              image = "ubuntu/bind9"
              name  = "bind9"
              volumeMounts = {
                name      = "bind-config"
                mountPath = "/etc/bind"
              }
              resources = {}
            }
          }
        }
      }
    }
  }
}