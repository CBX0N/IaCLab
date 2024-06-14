#!/bin/bash
echo "Adding vagrant LibVirt provider"
vagrant plugin install vagrant-libvirt
echo "Adding vagrant box"
vagrant box add cbxon/bootstrap ./packer/ubuntu_bootstrap_libvirt_amd64.box