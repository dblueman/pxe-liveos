#!/bin/bash

trap 'echo -e "\ntest successfully stopped\n"' EXIT

echo -e "\nIP interfaces:"
ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v '127.0.0.1'

echo -e "\nStarting coherency stress workload (status every 10s)\n"

SECONDS=0 n=$(($(getconf _NPROCESSORS_ONLN)/12)); while stress-ng --verify --timeout 1m --mmap $n --sparsematrix $n --sparsematrix-size 10000 --sparsematrix-items 10000 --msync $n --msync-bytes 1M --memthrash $n --memthrash-method random --vmstat 10 --temp-path /dev/shm --timestamp | tee -a stress.log; do echo -e "\nSTABLE FOR $((SECONDS/60)) MINS\n"; done
