#!/sbin/sh

# charge_flag is 1 for charge mode and 0 for recovery.
cat /proc/app_info | grep -A1 "charge_flag:" | grep -q "1"
recovery=$?

if [ $recovery == 0 ] ; then
 exit 0
fi

echo 0 > /sys/module/msm_fb/parameters/align_buffer
