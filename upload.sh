#!/bin/bash -e

function xfer() {
   rsync -aP --inplace -e "ssh -o pubkeyauthentication=no -p 64122" "$1" "pi@localhost:/srv/tftp/eviden-rescueos/$2"
}

ssh -Nf -L64122:10.0.0.3:22 dmzsdd

xfer rescue/vmlinuz-*-generic vmlinuz
xfer rescue/*.cpio.zst initrd.img
