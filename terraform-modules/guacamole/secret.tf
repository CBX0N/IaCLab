resource "kubernetes_secret" "postgresql_secret" {
  metadata {
    labels = {
      app     = "postgres"
      service = "guacamole"
    }
    name = "postgresql-secret"
  }
  type = "Opaque"
  data = {
    password = var.postgresql_password
  }
}