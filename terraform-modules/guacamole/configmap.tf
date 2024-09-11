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