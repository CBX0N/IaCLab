resource "kubernetes_persistent_volume_claim" "postgresql_pvc" {
  metadata {
    labels = {
      app     = "postgres"
      service = "guacamole"
    }
    name = "postgresql-pvc"
  }
  spec {
    storage_class_name = "longhorn-retain"
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}