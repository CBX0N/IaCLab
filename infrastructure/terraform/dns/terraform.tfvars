k3s_master_host = "192.168.0.109"

dns_a_records = {
  "proxmox" = {
    addresses = ["192.168.0.230"]
    zone      = "internal.cbxon.co.uk."
  }
  "ns1" = {
    addresses = ["192.168.0.109"]
    zone      = "internal.cbxon.co.uk."
  }
  "k3s00" = {
    addresses = ["192.168.0.109"]
    zone      = "internal.cbxon.co.uk."
  }
  "k3s01" = {
    addresses = ["192.168.0.15"]
    zone      = "internal.cbxon.co.uk."
  }
}