output "K3s_vm_ips" {
    value = proxmox_vm_qemu.K3s-VMs[*].ssh_host
}

output "HAProxy_vm_ips" {
    value = proxmox_vm_qemu.HAProxy-VMs[*].ssh_host
}