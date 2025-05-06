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

# Customer defined:
# 0x0842	Wake-on-LAN
# 0x22EA	Stream Reservation Protocol
# 0x22F0	AVTP
# 0x22F3	IETF TRILL Protocol	
sudo mausezahn lo -a e8:d8:d1:a5:2f:31 -b rand "08:00$payload" -p 1514
sudo mausezahn lo -a e8:d8:d1:a5:2f:31 -b rand "81:00 e0 0a 08:00$payload" -p 1514
