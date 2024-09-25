resource "kubernetes_config_map" "guacamole_configmap" {
  metadata {
    name = "guacamole-configmap"
    labels = {
      app     = "guacamole"
      service = "guacamole"
    }
  }
  data = {
    GUACD_HOSTNAME      = "guacd"
    GUACD_PORT          = "4822"
    POSTGRESQL_HOSTNAME = "postgres"
    POSTGRES_PORT       = "5432"
    POSTGRESQL_DATABASE = "guacamole_db"
    POSTGRESQL_USER     = "postgres"
  }
}


resource "kubernetes_config_map" "guacamole_sql" {
  metadata {
    name = "guacamole-sql"
    labels = {
      app     = "guacamole"
      service = "postgresql"
    }
  }
  data = {
    "001-create-schema.sql"     = file("${path.module}/files/001-create-schema.sql")
    "002-create-admin-user.sql" = file("${path.module}/files/002-create-admin-user.sql")
  }
}