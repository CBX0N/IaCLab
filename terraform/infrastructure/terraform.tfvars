default_vm_config = {
  cores                    = 2
  memory                   = 2048
  target_node              = "pve"
  network_adapter_firewall = false
  network_adapter_model    = "virtio"
  network_bridge           = "vmbr0"
}

dk_vm_config = {
  count            = 1
  qemu_agent       = 1
  vm_template_name = "ubuntu-noble-base-image"
  name             = "dk"
  desc             = "Docker swarm deployed by Terraform & Configured with Ansible"
  boot_order       = "order=ide0"
  vm_state         = "running"
  balloon_min      = 512
}

k3s_vm_config = {
  qemu_agent       = 1
  vm_template_name = "ubuntu-noble-base-image"
  name             = "k3s"
  desc             = "K3s cluster deployed by Terraform & Configured with Ansible"
  # boot_order = "order=ide0"
  # vm_state = "running"
  balloon_min = 512
}

lb_vm_config = {
  qemu_agent       = 1
  vm_template_name = "ubuntu-noble-base-image"
  name             = "lb"
  desc             = "HAProxy lb deployed by Terraform & Configured with Ansible"
  # boot_order = "order=ide0"
  # vm_state = "running"
  balloon_min = 512
}