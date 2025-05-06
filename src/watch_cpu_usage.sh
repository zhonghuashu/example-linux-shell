#!/bin/sh

CPU_QUOTA=30
watchCpuUsage()
{
    cpuTotal="$(./vmstat 1 2|tail -1|awk '{print 100-$15}')"

    if [ "$cpuTotal" -gt $CPU_QUOTA ]; then
        now=$(date +'%Y-%m-%d %H:%M:%S')
        echo "$now: CPU usage is $cpuTotal%"
        return 1
    else
        return 0
    fi
}

echo "Watch if CPU usage > $CPU_QUOTA%"
while true; do
    watchCpuUsage
    sleep 1
done



