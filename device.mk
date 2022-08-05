#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/jackpotveltedcm

PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# device tree for boot image
PRODUCT_HOST_PACKAGES += \
    dtbhtoolExynos

# Recovery
PRODUCT_PACKAGES += \
    loggy

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/atrace.rc:$(TARGET_COPY_OUT_RECOVERY)/root/atrace.rc \
    $(DEVICE_PATH)/recovery/ueventd.rc:$(TARGET_COPY_OUT_RECOVERY)/root/ueventd.rc \
    $(DEVICE_PATH)/recovery/ueventd.samsungexynos7885.rc:$(TARGET_COPY_OUT_RECOVERY)/root/ueventd.samsungexynos7885.rc \
    $(DEVICE_PATH)/recovery/init.recovery.samsungexynos7885.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.samsungexynos7885.rc

# Graphics
TARGET_SCREEN_HEIGHT := 2220
TARGET_SCREEN_WIDTH := 1080
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# Properties
include $(DEVICE_PATH)/system_prop.mk

