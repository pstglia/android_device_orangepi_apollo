#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
PRODUCT_PREBUILT_PATH := longan/out/h618/p2/android
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false
PRODUCT_BUILD_VENDOR_BOOT_IMAGE := true
CONFIG_LOW_RAM_DEVICE := false
CONFIG_SUPPORT_GMS := false
CONFIG_OTA_FROM_10 := false
BOARD_HAS_SECURE_OS := true
PRODUCT_HAS_UVC_CAMERA := true
PRODUCT_AAPT_CONFIG := mdpi xlarge hdpi xhdpi large
PRODUCT_AAPT_PREF_CONFIG := mdpi

#set speaker project(true: double speaker, false: single speaker)
#set default eq
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.spk_dul.used=false \
    ro.vendor.audio.eq=false

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.timezone=America/Sao_Paulo \
    persist.sys.country=US \
    persist.sys.language=en

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

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

# Desabilita cache
PRODUCT_BUILD_CACHE_IMAGE := false

# Include dtbo creation
PRODUCT_PACKAGES += dtbo.img

# SU
PRODUCT_PACKAGES += \
    su

$(call inherit-product, $(LOCAL_PATH)/common/*/config.mk)
$(call inherit-product, $(LOCAL_PATH)/camera/config.mk)

PRODUCT_USE_DYNAMIC_PARTITIONS := true
