resource "kubernetes_job" "configure_postgresql_job" {
  metadata {
    labels = {
      service = "guacamole"
      app     = "postgres"
    }
    name = "postgresql-config-job"
  }
  spec {
    template {
      metadata {
        labels = {
          service = "guacamole"
          app     = "postgres"
        }
      }
      spec {
        volume {
          name = "guacamole-sql"
          config_map {
            name = "guacamole-sql"
          }
        }
        init_container {
          name    = "sleep"
          image   = "busybox"
          command = ["/bin/sh", "-ec", "sleep 10"]
        }
        init_container {
          name    = "createdb"
          image   = "postgres:11"
          command = ["/usr/bin/createdb", "guacamole_db"]
          env {
            name  = "PGHOST"
            value = "postgres"
          }
          env {
            name  = "PGUSER"
            value = "postgres"
          }
          env {
            name = "PGPASSWORD"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.postgresql_secret.metadata[0].name
                key  = "password"
              }
            }
          }
        }
        container {
          name    = "psql"
          image   = "postgres:11"
          command = ["/usr/bin/psql", "-d", "guacamole_db", "-f", "/tmp/guacamole-sql/001-create-schema.sql", "-f", "/tmp/guacamole-sql/002-create-admin-user.sql"]
          volume_mount {
            name       = "guacamole-sql"
            mount_path = "/tmp/guacamole-sql"
          }
          env {
            name  = "PGHOST"
            value = "postgres"
          }
          env {
            name  = "PGUSER"
            value = "postgres"
          }
          env {
            name = "PGPASSWORD"
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