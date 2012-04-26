$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

PRODUCT_COPY_FILES += \
    device/lge/victor-common/init.victor.rc:root/init.victor.rc \
    device/lge/victor-common/ueventd.rc:root/ueventd.rc

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
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.camera=victor \
    ro.com.google.clientidbase=android-lge \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r6 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.bt.bdaddr_path=/data/misc/bd_addr

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/lge/victor-common/overlay

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/lge/victor-common/configs/spn-conf.xml:system/etc/spn-conf.xml \
    device/lge/victor-common/configs/voicemail-conf.xml:system/etc/voicemail-conf.xml

PRODUCT_PACKAGES += \
    hwaddrs \
    hcitool

PRODUCT_PACKAGES += \
    lights.victor \
    sensors.default \
    gps.victor \
    librs_jni \
    gralloc.msm7x30 \
    overlay.default \
    libOmxCore \
    libOmxVenc \
    libOmxVdec \
    com.android.future.usb.accessory

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
    device/lge/victor-common/keylayout/victor-keypad.kl:system/usr/keylayout/victor-keypad.kl

# BT/WIfi
PRODUCT_COPY_FILES += \
    device/lge/victor-common/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/lge/victor-common/firmware/wl/nvram.txt:system/etc/wl/nvram.txt \
    device/lge/victor-common/firmware/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
    device/lge/victor-common/firmware/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
    device/lge/victor-common/firmware/BCM4330B1_002.001.003.0243.0305.hcd:system/etc/firmware/BCM4330B1_002.001.003.0243.0305.hcd \
    device/lge/victor-common/prebuilt/init.qcom.bt.sh:system/bin/init.qcom.bt.sh

# Firmware
PRODUCT_COPY_FILES += \
    device/lge/victor-common/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/lge/victor-common/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/lge/victor-common/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/lge/victor-common/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/lge/victor-common/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/lge/victor-common/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/lge/victor-common/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/lge/victor-common/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/lge/victor-common/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw

# Offmode charging
PRODUCT_COPY_FILES += \
    device/lge/victor-common/misc/chargerlogo:root/sbin/chargerlogo \
    device/lge/victor-common/misc/wallpaper:root/sbin/wallpaper \
    device/lge/victor-common/misc/initlogo.rle:root/initlogo.rle \
    device/lge/victor-common/misc/chargerimages/battery_bg.rle:root/chargerimages/battery_bg.rle \
    device/lge/victor-common/misc/chargerimages/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
    device/lge/victor-common/misc/chargerimages/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
    device/lge/victor-common/misc/chargerimages/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
    device/lge/victor-common/misc/chargerimages/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
    device/lge/victor-common/misc/chargerimages/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
    device/lge/victor-common/misc/chargerimages/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
    device/lge/victor-common/misc/chargerimages/battery_charging_warning.rle:root/chargerimages/battery_charging_warning.rle \
    device/lge/victor-common/misc/chargerimages/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_01.rle \
    device/lge/victor-common/misc/chargerimages/battery_wait_ani_02.rle:root/chargerimages/battery_wait_ani_02.rle \
    device/lge/victor-common/misc/chargerimages/black_bg.rle:root/chargerimages/black_bg.rle

PRODUCT_COPY_FILES += \
    device/lge/victor-common/recovery/rmt_storage/rmt_storage:root/sbin/rmt_storage \
    device/lge/victor-common/configs/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    device/lge/victor-common/recovery/rmt_storage/rmt_storage:root/sbin/rmt_storage \
    device/lge/victor-common/configs/vold.fstab:system/etc/vold.fstab

# media config xml file
PRODUCT_COPY_FILES += \
    device/lge/victor-common/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_LOCALES += hdpi

$(call inherit-product, build/target/product/full_base.mk)
