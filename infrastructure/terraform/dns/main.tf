resource "kubernetes_config_map" "bind9_config" {
  metadata {
    name = "bind-config"
  }
  data = {
    "named.conf"                = file("./config/named.conf")
    "named.conf.key"            = file("./config/named.conf.key")
    "internal-cbxon-co-uk.zone" = file("./config/internal-cbxon-co-uk.zone")
  }
}

resource "kubernetes_service" "bind9_service" {
  metadata {
    name = "bind-service"
    labels = {
      app = "bind9"
    }
  }
  spec {
    selector = {
      app = "bind9"
    }
    type                    = "LoadBalancer"
    external_traffic_policy = "Local"
    port {
      port        = 53
      protocol    = "UDP"
      name        = "bind9-udp"
      target_port = 53
    }
    port {
      port        = 953
      protocol    = "UDP"
      name        = "bind9-secure"
      target_port = 953
    }
  }
}

resource "kubernetes_pod" "bind9-master" {
  metadata {
    labels = {
      app = "bind9"
    }
    name = "bind9-master"
  }
  lifecycle {
    replace_triggered_by = [kubernetes_config_map.bind9_config]
  }
  spec {
    volume {
      name = "bind"
      empty_dir {
        size_limit = "50Mi"
      }
    }
    volume {
      name = "named-conf"
      config_map {
        name = "bind-config"
        items {
          key  = "named.conf"
          path = "named.conf"
        }
      }
    }
    volume {
      name = "named-conf-key"
      config_map {
        name = "bind-config"
        items {
          key  = "named.conf.key"
          path = "named.conf.key"
        }
      }
    }
    volume {
      name = "zone-conf"
      config_map {
        name = "bind-config"
        items {
          key  = "internal-cbxon-co-uk.zone"
          path = "internal-cbxon-co-uk.zone"
        }
      }
    }
    container {
      name  = "bind9"
      image = "ubuntu/bind9:edge"
      volume_mount {
        mount_path = "/etc/bind/"
        name       = "bind"
        sub_path   = "internal-cbxon-co-uk.zone.jnl"
      }

      volume_mount {
        mount_path = "/etc/bind/named.conf"
        name       = "named-conf"
        sub_path   = "named.conf"
      }

      volume_mount {
        mount_path = "/etc/bind/named.conf.key"
        name       = "named-conf-key"
        sub_path   = "named.conf.key"
      }

      volume_mount {
        mount_path = "/etc/bind/internal-cbxon-co-uk.zone"
        name       = "zone-conf"
        sub_path   = "internal-cbxon-co-uk.zone"
      }

      port {
        container_port = 53
        protocol       = "UDP"
      }
      port {
        container_port = 953
        protocol       = "UDP"
      }
    }
  }
}

module "bind9_records" {
  depends_on    = [kubernetes_pod.bind9-master]
  source        = "./modules/dns-records"
  dns_a_records = var.dns_a_records
}