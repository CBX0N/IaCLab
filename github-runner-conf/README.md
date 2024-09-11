wget https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
qemu-img resize qcow2 noble-server-cloudimg-amd64.img 20g
qm importdisk <vmid> noble-server-cloudimg-amd64.img noble-server-cloudimg-amd64.img <storage>
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-2.319.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.319.1/actions-runner-linux-x64-2.319.1.tar.gz
echo "3f6efb7488a183e291fc2c62876e14c9ee732864173734facc85a1bfb1744464  actions-runner-linux-x64-2.319.1.tar.gz" | shasum -a 256 -c
tar xzf ./actions-runner-linux-x64-2.319.1.tar.gz

qm set 100 --cicustom "vendor=local:snippets/vendor.yaml"
qm cloudinit update 100