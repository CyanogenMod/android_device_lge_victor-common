#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_COPY_FILES += \
    device/lge/victor-common/init.victor.rc:root/init.victor.rc \
    device/lge/victor-common/init.victor.usb.rc:root/init.victor.usb.rc \
    device/lge/victor-common/ueventd.victor.rc:root/ueventd.victor.rc

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.camera=msm7630 \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r6 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# Configure the qcom surface compositor
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=dyn \
    debug.enabletr=true

# Set default USB interface for first boot
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh

DEVICE_PACKAGE_OVERLAYS += device/lge/victor-common/overlay

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/lge/victor-common/configs/spn-conf.xml:system/etc/spn-conf.xml \
    device/lge/victor-common/configs/voicemail-conf.xml:system/etc/voicemail-conf.xml

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.msm7x30 \
    audio.primary.msm7x30 \
    libaudioutils

# Display
PRODUCT_PACKAGES += \
    copybit.msm7x30 \
    gralloc.msm7x30 \
    hwcomposer.msm7x30 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libQcomUI \
    libtilerenderer

# Media
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libOmxCore \
    libOmxVdec \
    libOmxVenc

# Sensors, GPS, Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    gps.victor \
    lights.victor \
    sensors.default

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# for bugmailer
ifneq ($(TARGET_BUILD_VARIANT),user)
    PRODUCT_PACKAGES += send_bug
    PRODUCT_COPY_FILES += \
        system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
        system/extras/bugmailer/send_bug:system/bin/send_bug
endif

# Input device calibration files
PRODUCT_COPY_FILES += \
    device/lge/victor-common/idc/qt602240_ts.idc:system/usr/idc/qt602240_ts.idc

# Keychars
PRODUCT_COPY_FILES += \
    device/lge/victor-common/keychars/ats_input.kcm.bin:system/usr/keychars/ats_input.kcm.bin \
    device/lge/victor-common/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/lge/victor-common/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/lge/victor-common/keychars/touch_keypad.kcm.bin:system/usr/keychars/touch_keypad.kcm.bin

# Keylayouts
PRODUCT_COPY_FILES += \
    device/lge/victor-common/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/lge/victor-common/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/lge/victor-common/keylayout/ats_input.kl:system/usr/keylayout/ats_input.kl \
    device/lge/victor-common/keylayout/hs_detect.kl:system/usr/keylayout/hs_detect.kl \
    device/lge/victor-common/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/lge/victor-common/keylayout/touch_keypad.kl:system/usr/keylayout/touch_keypad.kl \
    device/lge/victor-common/keylayout/victor-keypad.kl:system/usr/keylayout/victor-keypad.kl \
    device/lge/victor-common/keylayout/testmode_input.kl:system/usr/keylayout/testmode_input.kl

# BT/Wifi
PRODUCT_COPY_FILES += \
    device/lge/victor-common/prebuilt/init.qcom.bt.sh:system/bin/init.qcom.bt.sh

PRODUCT_PACKAGES += \
    hcitool

# The splashscreen and Offmode charging
PRODUCT_COPY_FILES += \
    device/lge/victor-common/recovery/rmt_storage/rmt_storage:/root/sbin/rmt_storage \
    device/lge/victor-common/misc/chargerlogo:/root/sbin/chargerlogo \
    device/lge/victor-common/misc/wallpaper:/root/sbin/wallpaper \
    device/lge/victor-common/misc/initlogo.rle:root/initlogo.rle \
    device/lge/victor-common/misc/chargerimages/battery_bg.rle:/root/chargerimages/battery_bg.rle \
    device/lge/victor-common/misc/chargerimages/battery_charging_01.rle:/root/chargerimages/battery_charging_01.rle \
    device/lge/victor-common/misc/chargerimages/battery_charging_02.rle:/root/chargerimages/battery_charging_02.rle \
    device/lge/victor-common/misc/chargerimages/battery_charging_03.rle:/root/chargerimages/battery_charging_03.rle \
    device/lge/victor-common/misc/chargerimages/battery_charging_04.rle:/root/chargerimages/battery_charging_04.rle \
    device/lge/victor-common/misc/chargerimages/battery_charging_05.rle:/root/chargerimages/battery_charging_05.rle \
    device/lge/victor-common/misc/chargerimages/battery_charging_06.rle:/root/chargerimages/battery_charging_06.rle \
    device/lge/victor-common/misc/chargerimages/battery_charging_warning.rle:/root/chargerimages/battery_charging_warning.rle \
    device/lge/victor-common/misc/chargerimages/battery_wait_ani_01.rle:/root/chargerimages/battery_wait_ani_01.rle \
    device/lge/victor-common/misc/chargerimages/battery_wait_ani_02.rle:/root/chargerimages/battery_wait_ani_02.rle \
    device/lge/victor-common/misc/chargerimages/black_bg.rle:/root/chargerimages/black_bg.rle

# config files
PRODUCT_COPY_FILES += \
    device/lge/victor-common/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/lge/victor-common/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    device/lge/victor-common/configs/vold.fstab:system/etc/vold.fstab

$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

#BOARD_WLAN_DEVICE_REV := bcm4330_b1
#WIFI_BAND             := 802_11_ABG
#$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
