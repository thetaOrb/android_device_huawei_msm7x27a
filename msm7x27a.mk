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

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# The GPS configuration appropriate for this device.
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Include configs
$(call inherit-product, device/huawei/msm7x27a/configs/configs.mk)

# Include input
$(call inherit-product, device/huawei/msm7x27a/input/input.mk)

# Include ramdisk
$(call inherit-product, device/huawei/msm7x27a/rootdir/rootdir.mk)

# Include recovery
$(call inherit-product, device/huawei/msm7x27a/recovery/recovery.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/huawei/msm7x27a/overlay

# Tags
PRODUCT_TAGS += dalvik.gc.type-precise

# Packages :

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm7x27a \
    audio.usb.default \
    audio_policy.msm7x27a \
    libaudioutils

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    hwcomposer.msm7x27a \
    libtilerenderer

# Video
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libstagefrighthw

# GPS
PRODUCT_PACKAGES += \
    gps.msm7x27a

# Network
PRODUCT_PACKAGES += \
    hwmac \
    libnetcmdiface

# Other
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    make_ext4fs \
    setup_fs

# Files :

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Properties :

# CWM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true

# Headset
PRODUCT_PROPERTY_OVERRIDES += \
    headset.hook.delay=500

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.remote.autoconnect=true \
    ro.bluetooth.request.master=true \
    ro.bt.bdaddr_path=/data/misc/bluedroid/bdaddr \
    ro.qualcomm.bluetooth.dun=true \
    ro.qualcomm.bluetooth.ftp=true

# FM Radio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.fm.analogpath.supported=false \
    ro.fm.transmitter=false \
    ro.fm.mulinst.recording.support=false

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.composition.type=dyn \
    debug.hwc.dynThreshold=1.9 \
    ro.bq.gpu_to_cpu_unsupported=1 \
    ro.max.fling_velocity=4000 \
    ro.opengles.version=131072 \
    ro.sf.lcd_density=240 \
    ro.opengles.surface.rgb565=true \
    persist.sys.strictmode.disable=true \
    windowsmgr.max_events_per_sec=90

# Memory
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.purgeable_assets=1 \
    ro.config.low_ram=true

# Qualcomm
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    dev.pm.dyn_sample_period=700000 \
    dev.pm.dyn_samplingrate=1 \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

# Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    ril.subscription.types=NV,RUIM \
    rild.libargs=-d/dev/smd0 \
    ro.telephony.call_ring.delay=3000 \
    ro.telephony.call_ring.multiple=false

# Storage
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    ro.vold.umsdirtyratio=50

# Web
PRODUCT_PROPERTY_OVERRIDES += \
    persist.webview.provider=classic

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=60

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.checkjni=0 \
    dalvik.vm.debug.alloc=0

# Legacy
PRODUCT_PROPERTY_OVERRIDES += \
    debug.electronbeam.legacy=1

# Debug
#PRODUCT_PROPERTY_OVERRIDES += \
#    persist.service.adb.enable=1

$(call inherit-product, vendor/huawei/msm7x27a/vendor-blobs.mk)
