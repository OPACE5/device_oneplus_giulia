#
# Copyright (C) 2021-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include the common OEM chipset BoardConfig.
include device/oneplus/sm8650-common/BoardConfigCommon.mk

DEVICE_PATH := device/oneplus/giulia

# Assert
TARGET_OTA_ASSERT_DEVICE := OP5D2BL1

# Audio
BOARD_USES_ALSA_AUDIO := true

# Charging
TARGET_CHARGE_RATE_MULTIPLIER := 2000

# Display
TARGET_SCREEN_DENSITY := 640

# Kernel
BOARD_KERNEL_BINARIES := kernel
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)-kernel/dtbo.img
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)-kernel/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)-kernel/dtb.img

INLINE_KERNEL_BUILDING := true
TARGET_KERNEL_SOURCE := $(DEVICE_PATH)-kernel/kernel-headers

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)-kernel/dtb.img:$(TARGET_COPY_OUT)/dtb.img \
    $(DEVICE_PATH)-kernel/kernel:kernel \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)-kernel/system_dlkm/,$(TARGET_COPY_OUT_SYSTEM_DLKM)/lib/modules/6.1.75-android14-11-o-g239209decfd3) \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)-kernel/vendor_dlkm/,$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules) \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)-kernel/vendor_ramdisk/,$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/modules)

BOARD_BOOTCONFIG += \
    androidboot.selinux=permissive

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 103

# Vibrator
SOONG_CONFIG_NAMESPACES += OPLUS_LINEAGE_VIBRATOR_HAL
SOONG_CONFIG_OPLUS_LINEAGE_VIBRATOR_HAL := \
    USE_EFFECT_STREAM \
    LIGHT_MAG \
    MED_MAG \
    STRONG_MAG

SOONG_CONFIG_OPLUS_LINEAGE_VIBRATOR_HAL_USE_EFFECT_STREAM := true
SOONG_CONFIG_OPLUS_LINEAGE_VIBRATOR_HAL_LIGHT_MAG := 0x4ffd
SOONG_CONFIG_OPLUS_LINEAGE_VIBRATOR_HAL_MED_MAG := 0x7ffe
SOONG_CONFIG_OPLUS_LINEAGE_VIBRATOR_HAL_STRONG_MAG := 0xaffe

# Include the proprietary files BoardConfig.
include vendor/oneplus/giulia/BoardConfigVendor.mk
