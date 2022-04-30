#! /bin/env bash

BackupFile={{ backup_dir }}/{{ inventory_hostname }}-backup.img

rm $BackupFile
dd if=/dev/mmcblk0 of=$BackupFile 
