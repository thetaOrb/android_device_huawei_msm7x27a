#!/system/bin/sh
#
# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

mount -o rw,remount,barrier=1 -t rootfs /

switchexternal=`getprop persist.sys.vold.switchexternal`

case $switchexternal in
# switched
     "1")
	ln -s /storage/sdcard1 /mnt/internal_sd
	ln -s /storage/sdcard1 /internal_sd
    	ln -s /storage/sdcard0 /mnt/sdcard
   	ln -s /storage/sdcard0 /sdcard
     ;;
# default
     *)
	ln -s /storage/sdcard0 /mnt/internal_sd
	ln -s /storage/sdcard0 /internal_sd
    	ln -s /storage/sdcard1 /mnt/sdcard
   	ln -s /storage/sdcard1 /sdcard
     ;;
esac

mount -o ro,remount,barrier=1 -t rootfs /

# enable zram or swap

swap_type=`getprop persist.sys.swap_type`
swap_size=`getprop persist.sys.swap_size`
swappiness=`getprop persist.sys.swappiness`
SWAPFILE=/cache/swap/swap.file

rm -rf /cache/swap

case $swap_type in
# none
     "0")
	break
     ;;
# zram
     "1")
	echo 1 > /sys/block/zram0/reset
	echo $swap_size > /sys/block/zram0/disksize
	mkswap /dev/block/zram0
	swapon /dev/block/zram0
	break
     ;;
# swap
     "2")
	mkdir -p /cache/swap
	let "swap_size_mb = swap_size / 1048576"
	dd if=/dev/zero of=$SWAPFILE bs=1048576 count=$swap_size_mb
	mkswap $SWAPFILE
	swapon $SWAPFILE
	break
     ;;
# default
     *)
	# enable zram by default
	echo 1 > /sys/block/zram0/reset
	echo 50331648 > /sys/block/zram0/disksize
	mkswap /dev/block/zram0
	swapon /dev/block/zram0
	# set default properties
	setprop persist.sys.swap_type 1
	setprop persist.sys.swap_size 50331648
     ;;
esac

if [ -z "$swappiness" ]; then
   swappiness_def=`cat /proc/sys/vm/swappiness`
   setprop persist.sys.swappiness $swappiness_def
else
   echo $swappiness > /proc/sys/vm/swappiness
fi

# fstrim

LOG=/data/fstrim.log

if [ -e $LOG ]; then
   rm $LOG
fi

echo "* $(date +"%m-%d-%Y %r") *" >> $LOG
echo "*fstrim /data*" >> $LOG
fstrim -v /data >> $LOG
echo "*fstrim /cache*" >> $LOG
fstrim -v /cache >> $LOG

exit 0
