#!/bin/bash

# Configuration variables
PROXMOX_SERVER="192.168.0.230"
PROXMOX_USER="root"
VMID="900"  # Set your desired VM ID
STORAGE="datastore1"  # e.g., 'local-lvm', 'local'
CLOUDIMG_PATH="/var/lib/vz/template/iso/noble-server-cloudimg-amd64.img"  # Path to the Ubuntu cloud image (e.g., local:iso/ubuntu-noble-cloudimg-amd64.img)
VM_NAME="ubuntu-noble-template"
MEMORY=2048  # Memory size in MB
DISK_SIZE=16G  # Disk size for the VM
CPUS=2  # Number of CPUs
NET_BRIDGE="vmbr0"  # Network bridge for Proxmox

# Login via SSH and create the VM using the cloud image
ssh "${PROXMOX_USER}@${PROXMOX_SERVER}" <<EOF
  echo "Creating VM on Proxmox using Cloud Image..."
  qm create ${VMID} \
    --name ${VM_NAME} \
    --memory ${MEMORY} \
    --cores ${CPUS} \
    --net0 virtio,bridge=${NET_BRIDGE} \
    --scsihw virtio-scsi-pci \
    --ostype l26

  qm importdisk ${VMID} ${CLOUDIMG_PATH} ${STORAGE} --format raw
  qm set ${VMID} --scsi0 ${STORAGE}:vm-${VMID}-disk-0,cache=writeback
  qm set ${VMID} --boot c --bootdisk scsi0
  qm resize ${VMID} scsi0 ${DISK_SIZE}
  qm set ${VMID} --serial0 socket --vga serial0
  qm template ${VMID}
  echo "VM ${VMID} has been converted into a template."
EOF
