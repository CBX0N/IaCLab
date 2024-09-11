output "vm_ip" {
  value = "${var.vm_config.name}: ${proxmox_vm_qemu.vm.ssh_host}"
}