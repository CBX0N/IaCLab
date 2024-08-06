output "dk_vm_ips" {
  value = module.dk_vms.vm_ips
}

# output "k3s_vm_ips" {
#     value = module.k3s_vms[*].ssh_host
# }

# output "lb_vm_ips" {
#     value = module.lb_vms[*].ssh_host
# }