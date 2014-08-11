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
    libaudioutils \
    libaudio-resampler

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
    libstagefrighthw \
    libdashplayer

# GPS
PRODUCT_PACKAGES += \
    gps.msm7x27a

# Network
PRODUCT_PACKAGES += \
    hwmac \
    libnetcmdiface

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# Webkit
PRODUCT_PACKAGES += \
    libwebcore
 
# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    libxml2

# Files :

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Properties :

# Headset
PRODUCT_PROPERTY_OVERRIDES += \
    headset.hook.delay=500

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bt.bdaddr_path=/data/misc/bluedroid/bdaddr

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    debug.composition.type=dyn \
    debug.hwc.dynThreshold=1.91 \
    ro.bq.gpu_to_cpu_unsupported=1 \
    ro.opengles.version=131072 \
    ro.sf.lcd_density=240 \
    ro.opengles.surface.rgb565=true

# Memory
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true

# Qualcomm
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    dev.pm.dyn_sample_period=700000 \
    dev.pm.dyn_samplingrate=1 \
    ro.vendor.extension_library=/system/lib/libqc-opt.so \
    persist.radio.apm_sim_not_pwdn=1

# Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    ril.subscription.types=NV,RUIM \
    rild.libargs=-d/dev/smd0 \
    ro.telephony.call_ring.delay=0 \
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

# Legacy
PRODUCT_PROPERTY_OVERRIDES += \
    debug.electronbeam.legacy=1

# Time services
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    af.resampler.quality=4

# OTA
PRODUCT_PROPERTY_OVERRIDES += \
    otaupdater.sdcard.os=internal_sd \
    otaupdater.sdcard.recovery=internal_sd

$(call inherit-product, vendor/huawei/msm7x27a/vendor-blobs.mk)
