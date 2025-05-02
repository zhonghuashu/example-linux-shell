#!/bin/bash

#
# Example script refer to: 
# https://manpages.ubuntu.com/manpages/xenial/man8/mausezahn.8.html
# man mausezahn
# 
#

# Start wireshark on loopback interface for test.
# 

# help
mausezahn -h
mausezahn -t help
mausezahn -t tcp help

# Direct mode > raw layer-2 scheme.
sudo mausezahn lo "00:ab:cd:ef:00 00:00:00:00:00:01 08:00 ca:fe:ba:be"

# Send  BPDU  frames  for VLAN 5 as used with Cisco's PVST+ type of STP. (infinite: 0, delay: 2s)
sudo mausezahn lo -c 0 -d 2s -t bpdu vlan=5

# Perform a CAM table overflow attack. (src mac: random, dest mac: Broadcast, length: 64 bytes)
sudo mausezahn lo -c 0 -a rand -p 64

# Send packet (tcp sync, VLAN pri/tag: 7/5, payload length: 20, src ip: random), dest port: 1...1023)
sudo mausezahn lo -c 0 -d 2s -Q 7:5 -t tcp flags=syn,dp=1-1023 -p 20 -A rand -B 10.100.100.0/24

# Send packet (arp)
sudo mausezahn lo -c 0 -d 2s -t arp

# Send packet (802.1Q VLAN Tag)
sudo mausezahn lo -c 0 -d 2s -t tcp -Q 7:10 "dp=80, flags=rst, p=aa:aa:aa"

# Send packet (IP, dest IP: 127.0.0.1 or domain address from .1 to .255)
sudo mausezahn lo -t ip -A rand -B 127.0.0.1  -P "hello world"
sudo mausezahn lo -t ip -A rand -B 127.0.0.1/24  -P "hello world"
sudo mausezahn lo -t ip -A rand -B 127.0.0.1 -p 1470

# Send min / max TCP packets: -p 0: 54 (ETH 14 + IP 20 + TCP 20） -p 1460: 1514 (ETH 14 + MTU 1500) 
sudo mausezahn eth0 -t tcp -c 0 -A 192.168.20.105 -B 192.168.20.102 -p 0 
sudo mausezahn eth0 -t tcp -c 0 -A 192.168.20.105 -B 192.168.20.102 -p 1460 

sudo mausezahn lo -t tcp -c 0 -A 127.0.0.1 -B 127.0.0.2 -p 0 

# Send min / max UDP packets: -p 0: 42 (ETH 14 + IP 20 + UDP 8） -p 1472: 1514 (ETH 14 + MTU 1500) 
sudo mausezahn eth0 -t udp -c 0 -A 192.168.20.105 -B 192.168.20.102 -p 0 
sudo mausezahn eth0 -t udp -c 0 -A 192.168.20.105 -B 192.168.20.102 -p 1472 

