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

# Copy mali and dma buf kernel modules from longan
PRODUCT_COPY_FILES += \
    $(PRODUCT_PREBUILT_PATH)/dist/aic8800_bsp.ko:vendor/lib/modules_longan/aic8800_bsp.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/aic8800_btlpm.ko:vendor/lib/modules_longan/aic8800_btlpm.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/aic8800_fdrv.ko:vendor/lib/modules_longan/aic8800_fdrv.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/arc4.ko:vendor/lib/modules_longan/arc4.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/auth_rpcgss.ko:vendor/lib/modules_longan/auth_rpcgss.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/bcm_btlpm.ko:vendor/lib/modules_longan/bcm_btlpm.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/bcmdhd.ko:vendor/lib/modules_longan/bcmdhd.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/dma-buf-test-exporter.ko:vendor/lib/modules_longan/dma-buf-test-exporter.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/ehci-sunxi.ko:vendor/lib/modules_longan/ehci-sunxi.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/gspca_main.ko:vendor/lib/modules_longan/gspca_main.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/init-input.ko:vendor/lib/modules_longan/init-input.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/mali_kbase.ko:vendor/lib/modules_longan/mali_kbase.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/modules.alias:vendor/lib/modules_longan/modules.alias \
    $(PRODUCT_PREBUILT_PATH)/dist/modules.alias.bin:vendor/lib/modules_longan/modules.alias.bin \
    $(PRODUCT_PREBUILT_PATH)/dist/modules.builtin:vendor/lib/modules_longan/modules.builtin \
    $(PRODUCT_PREBUILT_PATH)/dist/modules.builtin.alias.bin:vendor/lib/modules_longan/modules.builtin.alias.bin \
    $(PRODUCT_PREBUILT_PATH)/dist/modules.builtin.bin:vendor/lib/modules_longan/modules.builtin.bin \
    $(PRODUCT_PREBUILT_PATH)/dist/modules.dep:vendor/lib/modules_longan/modules.dep \
    $(PRODUCT_PREBUILT_PATH)/dist/modules.dep.bin:vendor/lib/modules_longan/modules.dep.bin \
    $(PRODUCT_PREBUILT_PATH)/dist/modules.devname:vendor/lib/modules_longan/modules.devname \
    $(PRODUCT_PREBUILT_PATH)/dist/modules.order:vendor/lib/modules_longan/modules.order \
    $(PRODUCT_PREBUILT_PATH)/dist/modules.softdep:vendor/lib/modules_longan/modules.softdep \
    $(PRODUCT_PREBUILT_PATH)/dist/modules.symbols:vendor/lib/modules_longan/modules.symbols \
    $(PRODUCT_PREBUILT_PATH)/dist/modules.symbols.bin:vendor/lib/modules_longan/modules.symbols.bin \
    $(PRODUCT_PREBUILT_PATH)/dist/modules.weakdep:vendor/lib/modules_longan/modules.weakdep \
    $(PRODUCT_PREBUILT_PATH)/dist/Module.symvers:vendor/lib/modules_longan/Module.symvers \
    $(PRODUCT_PREBUILT_PATH)/dist/ohci-sunxi.ko:vendor/lib/modules_longan/ohci-sunxi.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/rpcsec_gss_krb5.ko:vendor/lib/modules_longan/rpcsec_gss_krb5.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/sprdbt_tty.ko:vendor/lib/modules_longan/sprdbt_tty.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/sprdwl_ng.ko:vendor/lib/modules_longan/sprdwl_ng.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/sunxi-hci.ko:vendor/lib/modules_longan/sunxi-hci.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/sunxi_rfkill.ko:vendor/lib/modules_longan/sunxi_rfkill.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/sunxi_usbc.ko:vendor/lib/modules_longan/sunxi_usbc.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/uwe5622_bsp_sdio.ko:vendor/lib/modules_longan/uwe5622_bsp_sdio.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/wireless_switch.ko:vendor/lib/modules_longan/wireless_switch.ko \
    $(PRODUCT_PREBUILT_PATH)/dist/xr819.ko:vendor/lib/modules_longan/xr819.ko

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

