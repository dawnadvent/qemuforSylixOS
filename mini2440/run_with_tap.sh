#!/bin/bash

base=$(dirname $0)

sudo ifconfig tap0 down
sudo tunctl -d tap0
sudo tunctl -b -u $USER -t tap0
sudo ifconfig tap0 192.168.7.1 promisc up

$base/../arm-softmmu/qemu-system-arm -M mini2440 -serial stdio -kernel ./bspmini2440.bin -show-cursor -net nic,vlan=0 -net tap,vlan=0,ifname=tap0,script=no,downscript=no

# -net nic,vlan=0 -net tap,vlan=0,ifname=tap0,script=no,downscript=no

#apt-get install bridge-utils        # 虚拟网桥工具
#apt-get install uml-utilities       # UML（User-mode linux）工具
