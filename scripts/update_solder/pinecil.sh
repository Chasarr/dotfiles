#!/bin/bash
# Hold the minus button as you insert the USB-C cable. Download the Pinecil_EN.bin to ~/scripts/update_solder/files.
# Then execute the scripts
dfu-util -d 28e9:0189 -a 0 -D /home/chasar/scripts/update_solder/files//home/chasar/scripts/update_solder/files/Pinecil_EN.bin -s 0x08000000
