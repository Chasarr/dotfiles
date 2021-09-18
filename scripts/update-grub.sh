#!/bin/sh

# NAME: update-grub
# PATH: /home/chasar/scripts
# DESC: Run update-grub and then rename menu entries
# DATE: June 20, 2021

grub-mkconfig -o /boot/grub/grub.cfg
/home/chasar/git/matter/matter.py -i arch cog-outline arch arch arch arch microsoft-windows chip power
sed -i "s|Windows Boot Manager (on /dev/sda2)|Windows 10|g" /boot/grub/grub.cfg
sed -i "s|Advanced options for Arch Linux|Advanced options|g" /boot/grub/grub.cfg

sed -i "s|Arch Linux, with Linux linux-zen (fallback initramfs)|Arch Linux-zen (fallback)|g" /boot/grub/grub.cfg
sed -i "s|Arch Linux, with Linux linux-lts (fallback initramfs)|Arch Linux-lts (fallback)|g" /boot/grub/grub.cfg

sed -i "s|Arch Linux, with Linux linux-zen|Arch Linux-zen|g" /boot/grub/grub.cfg
sed -i "s|Arch Linux, with Linux linux-lts|Arch Linux-lts|g" /boot/grub/grub.cfg
exit 0
