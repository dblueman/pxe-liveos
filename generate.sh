#!/bin/bash

set -exo pipefail

[ -x /usr/sbin/debootstrap ] || sudo apt install debootstrap

# mkdir -p liveos/root/lib/modules
rm -f liveos/vmlinuz-* liveos/*.cpio.zst
sudo rm -rf liveos/root && mkdir -p liveos/root && echo "force-unsafe-io" >liveos/root/.dpkg.cfg && sudo DEBIRF_COMMON=debirf/common DEBIRF_DEFAULT_PACKAGES=debirf/packages debirf/debirf make -o -r liveos
sudo chmod a+r liveos/vmlinuz-* liveos/*.cpio.zst
