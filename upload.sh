#!/bin/bash -e

function xfer() {
   rsync -P --inplace -e "ssh -o pubkeyauthentication=no -p $1" "$2" "pi@localhost:/srv/tftp/liveos/$3"
}

ssh -Nf -L64122:10.0.0.3:22 dmzsdd
ssh -Nf -L64123:10.22.83.2:22 dmzsdd

for port in 64122 64123; do
   xfer $port liveos/vmlinuz-*-generic vmlinuz
   xfer $port liveos/*.cpio.zst initrd.img
done

rm -f liveos/vmlinuz-*-generic liveos/*.cpio.zst
sudo rm -rf liveos/root
