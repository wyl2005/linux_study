#!/bin/bash

mode="666"
#device="watchdog"
device="globalmem"


insmod globalmem.ko || exit 1
major=`cat /proc/devices | grep $device | awk '{print $1}'`

rm /dev/$device
mknod /dev/${device} c $major 0

chmod $mode /dev/${device}
echo load_ok

