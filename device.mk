#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
PRODUCT_PREBUILT_PATH := longan/out/h618/p2/android
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default

USE_XML_AUDIO_POLICY_CONF := 1

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Recovery & regular fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/etc/recovery.fstab:root/system/etc/recovery.fstab
#    $(LOCAL_PATH)/rootdir/etc/fstab.apollo:root/system/etc/fstab.apollo \
#    $(LOCAL_PATH)/rootdir/etc/fstab.apollo:root/fstab.apollo \
#    $(LOCAL_PATH)/rootdir/etc/fstab.apollo:ramdisk/fstab.apollo


# Force vendor/dsp creation
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/vendor/dummy_create_vendor_dir.txt:root/vendor/dsp/dummy_create_vendor_dir.txt


# wifi and bt configuration
# 1. Wifi Configuration
BOARD_WIFI_VENDOR := common
BOARD_USR_WIFI    :=
WIFI_DRIVER_MODULE_PATH :=
WIFI_DRIVER_MODULE_NAME :=
WIFI_DRIVER_MODULE_ARG  :=

# 2. Bluetooth Configuration
BOARD_BLUETOOTH_VENDOR    := common
BOARD_HAVE_BLUETOOTH_NAME :=
BOARD_BLUETOOTH_CONFIG_DIR :=  device/orangepi/apollo/common/wireless/bluetooth
BOARD_BLUETOOTH_TTY := /dev/ttyAS1
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/orangepi/apollo/common/wireless/bluetooth
# Must include after wifi/bt configuration
include device/orangepi/common/config/wireless/wireless_config.mk

# Desabilita cache
PRODUCT_BUILD_CACHE_IMAGE := false


# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.3.vendor \
    android.hardware.drm@1.3-service.clearkey

PRODUCT_PACKAGES += \
    gpu-package \

# Gralloc
PRODUCT_PACKAGES += \
        android.hardware.graphics.allocator@2.0-impl \
        android.hardware.graphics.allocator@2.0-service \
        android.hardware.graphics.mapper@2.0-impl-2.1 \

# HW Composer
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.2-impl \
    android.hardware.graphics.composer@2.2-service \
    hwcomposer.apollo \
    gralloc.apollo \
    libde201 \
    pqd

# ION
PRODUCT_PACKAGES += \
    libion

# Light Hal
PRODUCT_PACKAGES += \
    android.hardware.lights-service

#display - hdmi-hdcp2.2
PRODUCT_COPY_FILES += \
    device/orangepi/apollo/common/display/esm.fex:$(TARGET_COPY_OUT_VENDOR)/etc/hdcp/esm.fex \
    device/orangepi/apollo/common/display/hdcptool.sh:$(TARGET_COPY_OUT_VENDOR)/bin/hdcptool.sh


# display - hdmi-cec
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml
PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.device_type=4
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.sys.hdmi.keep_awake=false

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.hdmi.set_menu_language=1 \

PRODUCT_PACKAGES += \
    android.hardware.tv.cec@1.0-service \
    android.hardware.tv.cec@1.0-impl \
    hdmi_cec.apollo

# Include dtbo creation
PRODUCT_PACKAGES += dtbo.img

# new gatekeeper HAL
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl-aw \
    android.hardware.gatekeeper@1.0-service-aw \
    libgatekeeper \
    gatekeeper.apollo \

PRODUCT_PACKAGES += \
        android.hardware.power-service-aw \
    android.hardware.health@2.1-service \
    android.hardware.health@2.1-impl \
    android.hardware.usb@1.0-service.aw \

$(call inherit-product, $(LOCAL_PATH)/common/*/config.mk)

PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_USE_DYNAMIC_PARTITION_SIZE := true

