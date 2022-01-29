#!/bin/bash

# Get Partitions and Mountpoints
mount -v | grep "^/" | awk '{print "Partition identifier: " $1  "\nMountpoint: "  $3 "\n"}'

# Mount NTFS partition with read/write
sudo mount -t ntfs /dev/sda4 '/run/media/robogod/New Volume'

# Remount partition as read/write
sudo mount -o remount,rw /dev/sda4 '/run/media/robogod/New Volume'
