resource "kubernetes_persistent_volume_claim" "postgresql_pvc" {
  metadata {
    labels = {
      app     = "postgres"
      service = "guacamole"
    }
    name = "postgresql-pvc"
  }
  spec {
    storage_class_name = "longhorn"
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.postgres_pv.metadata[0].name
  }
}