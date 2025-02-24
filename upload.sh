#!/bin/bash -e

function xfer() {
   rsync -P --inplace -e "ssh -o pubkeyauthentication=no -p 64122" "$1" "pi@localhost:/srv/tftp/rescueos/$2"
}

ssh -Nf -L64122:10.0.0.3:22 dmzsdd

xfer rescue/vmlinuz-*-generic vmlinuz
xfer rescue/*.cpio.zst initrd.img
rm -f rescue/vmlinuz-*-generic rescue/*.cpio.zst
sudo rm -rf rescue/root
