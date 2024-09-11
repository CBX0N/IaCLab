resource "kubernetes_persistent_volume" "postgres_pv" {
  metadata {
    labels = {
      service = "guacamole"
      app     = "postgres"
      type    = "local"
    }
    name = "postgresql-pv"
  }
  spec {
    # persistent_volume_reclaim_policy = "Delete"
    storage_class_name = "longhorn"
    capacity = {
      storage = "5Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      csi {
        driver = "driver.longhorn.io"
        volume_handle = "longhorn"
        fs_type = "ext4"
      }
    }
  }
}