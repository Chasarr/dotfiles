#!/bin/sh
# Hold the button closest to the tip as you insert the USB-C cable. Download the TS80P.hex to ~/scripts/update_solder/files
# Then execute the script as root
FW=/home/chasar/scripts/update_solder/files/TS80P_EN.hex
unset NAME
eval $(lsblk -P -p -d --output NAME,MODEL|grep "DFU[ _]Disk")
[ -z ${NAME+x} ] && exit 1  # Could not find DFU device
umount "$NAME"
echo "bruh"
mkdir /tmp/mntdfu
mount -t msdos "$NAME" /tmp/mntdfu
echo $FW
cp "$FW" "/tmp/mntdfu/$(basename $FW|tr a-z A-Z)"
sync
umount /tmp/mntdfu
rmdir /tmp/mntdfu
