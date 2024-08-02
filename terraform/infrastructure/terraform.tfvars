default-vm-config = {
  cores                    = 2
  memory                   = 2048
  target_node              = "pve"
  network_adapter_firewall = false
  network_adapter_model    = "virtio"
  network_bridge           = "vmbr0"
}

K3s-vm-config = {
  qemu_agent       = 1
  vm_template_name = "ubuntu-noble-base-image"
  name             = "K3s"
  desc = "K3s Cluster deployed by Terraform & Configured with Ansible"
  # boot_order = "order=ide0"
  # vm_state = "running"
  balloon_min = 512
}

HAProxy-vm-config = {
  qemu_agent       = 1
  vm_template_name = "ubuntu-noble-base-image"
  name             = "HAProxy"
  desc = "HAProxy LB deployed by Terraform & Configured with Ansible"
  # boot_order = "order=ide0"
  balloon_min = 512
}