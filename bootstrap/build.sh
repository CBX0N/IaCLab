#!/bin/bash
GREEN='\033[0;32m'
NOCOLOR='\033[0m'
echo -e "${GREEN}Building BootStrap VM${NOCOLOR}"
echo -e "${GREEN}Creating SSH Keys${NOCOLOR}"
ssh-keygen -N '' -f ./bootstrap-sshkey <<<y >/dev/null 2>&1
mv ./bootstrap-sshkey.pub ./packer/authorized_keys
echo -e "${GREEN}Generating CloudInit Drive${NOCOLOR}"
cd ./packer
genisoimage -output cidata.iso --input-charset utf-8 -volid cidata -joliet -r ./cloud-init/user-data ./cloud-init/meta-data
echo -e "${GREEN}Building Packer Image${NOCOLOR}"
packer build -color=false -force ubuntu.pkr.hcl
echo "${GREEN}Adding vagrant LibVirt provider${NOCOLOR}"
vagrant plugin install vagrant-libvirt
echo "${GREEN}Adding vagrant box${NOCOLOR}"
vagrant box add lab/bootstrap ./ubuntu_bootstrap_libvirt_amd64.box --force