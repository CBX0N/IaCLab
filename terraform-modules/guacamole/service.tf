resource "kubernetes_service" "postgresql_service" {
  metadata {
    name = "postgres"
    labels = {
      app     = "postgres"
      service = "guacamole"
    }
  }
  spec {
    type = "LoadBalancer"
    port {
      port = 5432
      target_port = 5432
    }
    selector = {
      app = "postgres"
    }
  }
}

resource "kubernetes_service" "guacamole_service" {
  metadata {
    name = "guacamole"
    labels = {
      app     = "guacamole"
      service = "guacamole"
    }
  }
  spec {
    type = "LoadBalancer"
    port {
      port = 8080
      target_port = 8080
    }
    selector = {
      app = "guacamole"
    }
  }
}

resource "kubernetes_service" "guacd_service" {
  metadata {
    name = "guacd"
    labels = {
      app     = "guacd"
      service = "guacamole"
    }
  }
  spec {
    type = "LoadBalancer"
    port {
      port = 4822
      target_port = 4822
    }
    selector = {
      app = "guacd"
    }
  }
}