dns_a_records = {
  "proxmox" = {
    addresses = ["192.168.0.214"]
    zone      = "internal.cbxon.co.uk."
  }
  "k3s00" = {
    addresses = ["192.168.0.210"]
    zone      = "internal.cbxon.co.uk."
  }
  "k3s01" = {
    addresses = ["192.168.0.211"]
    zone      = "internal.cbxon.co.uk."
  }
  "k3s02" = {
    addresses = ["192.168.0.212"]
    zone      = "internal.cbxon.co.uk."
  }
  # "k3s03" = {
  #   addresses = ["192.168.0.213"]
  #   zone      = "internal.cbxon.co.uk."
  # }
  "kubernetes" = {
    addresses = ["192.168.0.210", "192.168.0.211", "192.168.0.212"]
    zone      = "internal.cbxon.co.uk."
  }
  "haproxy1" = {
    addresses = ["192.168.0.214"]
    zone      = "internal.cbxon.co.uk."
  }
}

bind9_ip = "192.168.0.234"