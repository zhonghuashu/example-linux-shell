#!/bin/bash

function getRandHex()
{
    len=$(($1))
    randVal=""
    while [ $len -gt 0 ]; do
        hexVal="$(openssl rand -hex 1)"
        randVal+=":$hexVal"
        ((len--))
    done

    echo "$randVal"
}

#
# L2 filter test
#

payload=$(getRandHex 100)

# User defined: 
# 0x0800 	IPv4
# 0x86DD	IPv6
# 0x88B9	GSE
# 0x88B8	GOOSE
# 0x88BA	SV
# 0x8100	IEEE 802.1Q
# 0x8863	PPPoE Discovery Stage
# 0x8864	PPPoE Session Stage
# 0x0806	ARP
# 0x8035	RARP
# 0x88FB	PRP
# 0x892F	HSR
# 0x88F7	PTP

sudo mausezahn enp0s31f6 -t ip -A rand -B 192.168.20.149 -p 1000
sudo mausezahn enp0s31f6 -t ip -A rand -B 192.168.20.149 -p 1000 -Q 7:5

sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "88:B9$payload" -p 1514
sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "81:00 e0 0a 88:B9$payload" -p 1514

sudo mausezahn enp0s31f6 "33 33 00 01 00 02 e4 3a 6e 74 fe 7e 86 dd 60 02 c6 68 00 66 11 01 fe 80 00 00 00 00 00 00 ed a7 65 b6 1a 58 77 76 ff 02 00 00 00 00 00 00 00 00 00 00 00 01 00 02 02 22 02 23 00 66 e2 31 01 6d dd 2e 00 08 00 02 02 bf 00 01 00 0e 00 01 00 01 2f ac 2e 82 e4 3a 6e 7c ef c7 00 03 00 0c 04 e4 3a 6e 00 00 00 00 00 00 00 00 00 27 00 10 00 0e 6d 69 6e 69 6e 74 2d 31 6d 74 35 32 76 30 00 10 00 0e 00 00 01 37 00 08 4d 53 46 54 20 35 2e 30 00 06 00 08 00 11 00 17 00 18 00 27"

sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "88:B8$payload" -p 1514
sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "81:00 e0 0a 88:B8$payload" -p 1514

sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "88:BA$payload" -p 1514
sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "81:00 e0 0a 88:BA$payload" -p 1514

sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "81:00$payload" -p 1514

sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "88:63$payload" -p 1514
sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "81:00 e0 0a 88:63$payload" -p 1514

sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "88:64$payload" -p 1514
sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "81:00 e0 0a 88:64$payload" -p 1514

sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "08:06$payload" -p 1514
sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "81:00 e0 0a 08:06$payload" -p 1514

sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "80:35$payload" -p 1514
sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "81:00 e0 0a 80:35$payload" -p 1514

sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "88:FB$payload" -p 1514
sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "81:00 e0 0a 88:FB$payload" -p 1514

sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "89:2F$payload" -p 1514
sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "81:00 e0 0a 89:2F$payload" -p 1514

sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "88:F7$payload" -p 1514
sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "81:00 e0 0a 88:F7$payload" -p 1514

# Customer defined:
# 0x0842	Wake-on-LAN
# 0x22EA	Stream Reservation Protocol
# 0x22F0	AVTP
# 0x22F3	IETF TRILL Protocol	
sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "08:42$payload" -p 1514
sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "81:00 e0 0a 08:42$payload" -p 1514

sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "22:EA$payload" -p 1514
sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "81:00 e0 0a 22:EA$payload" -p 1514

sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "22:F0$payload" -p 1514
sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "81:00 e0 0a 22:F0$payload" -p 1514

sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "22:F3$payload" -p 1514
sudo mausezahn enp0s31f6 -a e8:d8:d1:a5:2f:31 -b rand "81:00 e0 0a 22:F3$payload" -p 1514
