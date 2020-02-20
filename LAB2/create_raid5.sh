#!/bin/bash

mdadm --zero-superblock --force /dev/sd{b,c,d,e}
mdadm --create /dev/md0 -l 5 -n 4 /dev/sd{b,c,d,e}
mkdir -p /etc/mdadm
mdadm --detail --scan | awk '/ARRAY/ {print}' > /etc/mdadm/mdadm.conf && \
parted -s /dev/md0 mklabel gpt && \
parted /dev/md0 mkpart primary ext4 0% 40% && \
parted /dev/md0 mkpart primary ext4 40% 60% && \
parted /dev/md0 mkpart primary ext4 60% 70% && \
parted /dev/md0 mkpart primary ext4 70% 90% && \
parted /dev/md0 mkpart primary ext4 90% 100% && \

for i in $(seq 1 5);
do
sudo mkfs.ext4 /dev/md0p$i;
done

mkdir -p /mnt/raid/part{1,2,3,4,5}

for i in $(seq 1 5);
do
sudo mount /dev/md0p$i /mnt/raid/part$i;
done
