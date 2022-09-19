#!/bin/bash

if [ ! -d /mnt/usb-1 ]; then
    exit 1
fi

cryptsetup luksOpen /dev/sdc hdd-2 --key-file /mnt/usb-1/main.lek
vgchange -ay vault-drive-2
mount /dev/vault-drive-2/lvol0 /mnt/hdd-2

rsync -a --delete /mnt/hdd-1 /mnt/hdd-2

umount /mnt/hdd-2
cryptsetup luksClose hdd-2
vgchange -a n vault-drive-2
hdparm -Y /dev/sdc