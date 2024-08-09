default_vm_config = {
  cores                    = 2
  memory                   = 2048
  target_node              = "pve"
  network_adapter_firewall = false
  network_adapter_model    = "virtio"
  network_bridge           = "vmbr0"
}

k3s_vm_config = {
  count            = 3
  qemu_agent       = 1
  vm_template_name = "ubuntu-noble-base-image"
  name             = "k3s"
  desc             = "K3s cluster deployed by Terraform & Configured with Ansible"
  boot_order       = "order=ide0"
  vm_state         = "running"
  memory = 4096
  balloon_min      = 512
}