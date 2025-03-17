#!/bin/bash -e

function xfer() {
   rsync -P --inplace -e "ssh -o pubkeyauthentication=no -p 64122" "$1" "pi@localhost:/srv/tftp/liveos/$2"
}

ssh -Nf -L64122:10.0.0.3:22 dmzsdd

xfer liveos/vmlinuz-*-generic vmlinuz
xfer liveos/*.cpio.zst initrd.img
rm -f liveos/vmlinuz-*-generic liveos/*.cpio.zst
sudo rm -rf liveos/root
