nodes = {
  "k3sdev01" = {
    type = "primary"
    vmid = 221
  }
  "k3sdev02" = {
    type = "secondary"
    vmid = 222
  }
  "k3sdev03" = {
    type = "secondary"
    vmid = 223
  }
}

proxmox_vm_config = {
  clone         = "ubuntu-noble-template"
  ip_gateway    = "192.168.0.1"
  ip_prefix     = "192.168.0"
  disk_location = "datastore1"
}

cluster_config = {
  primary_service_run_command     = "--cluster-init --write-kubeconfig-mode=0644"
  secondaries_service_run_command = "--server https:\\/\\/192.168.0.221:6443"
}

onepassword_vault = "CBXON-NET"
onepassword_secrets = {
  proxmox_api = "proxmox-api"
  proxmox_ssh = "proxmox-ssh"
}