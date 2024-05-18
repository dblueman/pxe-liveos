#!/bin/bash -x
# mkdir -p rescue/root/lib/modules
sudo rm -rf rescue/root && mkdir -p rescue/root && echo "force-unsafe-io" >rescue/root/.dpkg.cfg && sudo ./debirf make -o -r rescue
sudo chmod a+r rescue/vmlinuz-* rescue/debirf-*
