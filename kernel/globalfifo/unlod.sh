#!/bin/bash

mode="666"
device="globalfifo"


rmmod globalfifo || exit 1

#major=`cat /proc/devices | grep $device | awk '{print $1}'`
#echo major=$major

rm -f /dev/$device
echo unload_OK=$device
