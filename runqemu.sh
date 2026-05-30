#!/bin/bash
#Script to run QEMU for buildroot as the default configuration qemu_aarch64_virt_defconfig
#Host forwarding: Host Port 10022 ->> QEMU Port 22 
#Author: Siddhant Jajoo.


qemu-system-x86_64 \
    -M q35 \
    -nographic \
    -kernel images/bzImage \
    -append "root=/dev/sda console=ttyS0" \
    -drive file=images/rootfs.ext2,format=raw,if=virtio \
    -netdev user,id=net0,hostfwd=tcp::9000-:9000,hostfwd=tcp::10022-:22 \
    -device virtio-net-pci,netdev=net0

