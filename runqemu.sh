#!/bin/sh

KERNEL=buildroot/output/images/bzImage
ROOTFS=buildroot/output/images/rootfs.ext2

# Use virtio-net (this is what worked last night)
NET_OPTS="-netdev user,id=net0,hostfwd=tcp::9000-:9000 -device virtio-net-pci,netdev=net0"

qemu-system-x86_64 \
    -M q35 \
    -m 256M \
    -kernel $KERNEL \
    -drive file=$ROOTFS,format=raw,if=virtio \
    -append "root=/dev/vda console=ttyS0" \
    -nographic \
    $NET_OPTS
