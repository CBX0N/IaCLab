nodes = {
  "k3sdev01" = {
    type = "primary"
    vmid = 211
  }
  "k3sdev02" = {
    type = "secondary"
    vmid = 212
  }
  "k3sdev03" = {
    type = "secondary"
    vmid = 213
  }
}

proxmox_vm_config = {
  clone         = "ubuntu-noble-template"
  ip_gateway    = "192.168.0.1"
  ip_prefix     = "192.168.0"
  disk_location = "datastore1"
  memory        = 8192
  balloon       = 1024
}

cluster_config = {
  primary_service_run_command     = "--cluster-init --write-kubeconfig-mode=0644 --disable=servicelb --disable=traefik"
  secondaries_service_run_command = "--server https:\\/\\/192.168.0.211:6443 --disable=servicelb --disable=traefik"
  admin_user                      = "ansible"
  ssh_keys                        = ["lab", "gitlab", "homelab"]
  packages                        = ["qemu-guest-agent", "containerd", "unzip", "nfs-common"]
  k3s_images_url                  = "https://github.com/k3s-io/k3s/releases/download/v1.29.1-rc2%2Bk3s1/k3s-airgap-images-amd64.tar.zst"
  k3s_bin_url                     = "https://github.com/k3s-io/k3s/releases/download/v1.30.0%2Bk3s1/k3s"
  k3s_service_url                 = "https://raw.githubusercontent.com/k3s-io/k3s/refs/heads/master/k3s.service"
}

github_org                   = "cbx0n"
github_repository            = "homelab-fluxcd"

onepassword_vault = "uadqgdescn34aubde6zusrehui"
onepassword_secrets = {
  proxmox_api  = "proxmox-api"
  proxmox_ssh  = "proxmox-ssh"
  github_token = "github_fluxcd_token"
}