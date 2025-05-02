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

sudo mausezahn lo -a e8:d8:d1:a5:2f:31 -b rand "08:00$payload" -p 1514
sudo mausezahn lo -a e8:d8:d1:a5:2f:31 -b rand "81:00 e0 0a 08:00$payload" -p 1514
