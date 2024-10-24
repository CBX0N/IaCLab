vm_config = {
  "k3s01" = {
    name             = "k3s01"
    vmid             = 211
    memory           = 4096
    balloon          = 4096
    cores            = 2
    use_cloud_config = true
    clone            = "ubuntu-noble-template"
    disk_gb          = 40
    ipconfig         = "ip=192.168.0.211/24,gw=192.168.0.1"
  },
  "k3s02" = {
    name             = "k3s02"
    vmid             = 212
    memory           = 4096
    balloon          = 4096
    cores            = 2
    use_cloud_config = true
    clone            = "ubuntu-noble-template"
    disk_gb          = 40
    ipconfig         = "ip=192.168.0.212/24,gw=192.168.0.1"
  },
  "k3s03" = {
    name             = "k3s03"
    vmid             = 213
    memory           = 4096
    balloon          = 4096
    cores            = 2
    use_cloud_config = true
    clone            = "ubuntu-noble-template"
    disk_gb          = 40
    ipconfig         = "ip=192.168.0.213/24,gw=192.168.0.1"
  },
}