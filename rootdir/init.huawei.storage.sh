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

mount -o rw,remount -t rootfs /

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

mount -o ro,remount -t rootfs /

exit 0
