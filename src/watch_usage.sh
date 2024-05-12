#!/bin/bash

MEM_QUOTA=80
function watchMemory()
{
    memTotal="$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')"
    memFree="$(cat /proc/meminfo | grep MemFree | awk '{print $2}')"
    memUsage=$((100 - memFree * 100 / memTotal))

    echo ">> MemTotal: $memTotal"
    echo ">> MemFree: $memFree"
    echo ">> MemUsage: $memUsage%"

    if [ $memUsage -gt $MEM_QUOTA ]; then
        echo "Alarm: memory usage is $memUsage%"
        return 1
    else
        return 0
    fi
}

HD_QUOTA=80
function watchDisk()
{
    hdUsage=$(df | grep /mnt/c | awk '{print $5}' | sed 's/%//g')
    echo ">> Hard disk usage: $hdUsage%"
    if [ "$hdUsage" -gt $HD_QUOTA ]; then
        echo "Alarm: Hard disk usage is $hdUsage%"
        return 1
    else
        return 0
    fi
}

echo "Watch memory usage: "
watchMemory
echo ""

echo "Watch disk usage: "
watchDisk
echo ""