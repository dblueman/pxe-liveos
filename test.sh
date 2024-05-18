#!/bin/bash -x

exec qemu-system-x86_64 -kernel rescue/vmlinuz-6.8.0-31-generic -initrd rescue/debirf-rescue_noble_6.8.0-31-generic.cpio.zst -nographic -m 2G -append 'console=ttyS0'
