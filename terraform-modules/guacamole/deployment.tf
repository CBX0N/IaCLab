resource "kubernetes_deployment" "postgresql_deployment" {
  metadata {
    labels = {
      app     = "postgres"
      service = "guacamole"
    }
    name = "postgresql-deployment"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "postgres"
      }
    }
    template {
      metadata {
        labels = {
          app     = "postgres"
          service = "guacamole"
        }
        name = "postgres"
      }
      spec {
        volume {
          name = "postgresql-data"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.postgresql_pvc.metadata[0].name
          }
        }
        container {
          name              = "postgres"
          image             = "postgres:11"
          image_pull_policy = "IfNotPresent"
          port {
            container_port = 5432
          }
          env {
            name  = "PGDATA"
            value = "/var/lib/postgresql/data"
          }
          env {
            name = "POSTGRES_PASSWORD"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.postgresql_secret.metadata[0].name
                key  = "password"
              }
            }
          }
          volume_mount {
            mount_path = var.postgresql_data_path
            name       = "postgresql-data"
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "guacd_deployment" {
  metadata {
    labels = {
      app     = "guacd"
      service = "guacamole"
    }
    name = "guacd-deployment"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "guacd"
      }
    }
    template {
      metadata {
        labels = {
          app     = "guacd"
          service = "guacamole"
        }
        name = "guacd"
      }
      spec {
        container {
          name              = "guacd"
          image             = "guacamole/guacd"
          image_pull_policy = "IfNotPresent"
          port {
            container_port = 4822
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "guacamole_deployment" {
  metadata {
    labels = {
      app     = "guacamole"
      service = "guacamole"
    }
    name = "guacamole-deployment"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "guacamole"
      }
    }
    template {
      metadata {
        labels = {
          app     = "guacamole"
          service = "guacamole"
        }
        name = "guacamole"
      }
      spec {
        container {
          name              = "guacamole"
          image             = "guacamole/guacamole"
          image_pull_policy = "IfNotPresent"
          port {
            container_port = 8080
          }
          env_from {
            config_map_ref {
              name = kubernetes_config_map.guacamole_configmap.metadata[0].name
            }
          }
          env {
            name = "POSTGRES_PASSWORD"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.postgresql_secret.metadata[0].name
                key  = "password"
              }
            }
          }
        }
      }
    }
  }
}
