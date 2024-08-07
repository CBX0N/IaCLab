output "ns_vm_ips" {
  value = module.ns_vms.vm_ips
}

output "k3s_vm_ips" {
    value = module.k3s_vms.vm_ips
}

# output "lb_vm_ips" {
#     value = module.lb_vms[*].ssh_host
# }