nodes = {
  "k3s01" = {
    type = "primary"
    vmid = 211
  }
  "k3s02" = {
    type = "secondary"
    vmid = 212
  }
  "k3s03" = {
    type = "secondary"
    vmid = 213
  }
}

proxmox_vm_config = {
  clone         = "ubuntu-noble-template"
  ip_gateway    = "192.168.0.1"
  ip_prefix     = "192.168.0"
  disk_location = "datastore1"
}

cluster_config = {
  primary_service_run_command     = "--cluster-init"
  secondaries_service_run_command = "--server https:\\/\\/192.168.0.211:6443"
}