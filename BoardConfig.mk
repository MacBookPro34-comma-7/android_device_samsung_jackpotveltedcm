# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/jackpotveltedcm

# Inherit from common
include device/samsung/universal7885-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := jackpotveltedcm

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := exynos7885

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/include/bluetooth

# Kernel
BOARD_BOOT_HEADER_NAME := SRPRE09B001RU
TARGET_KERNEL_SOURCE := kernel/samsung/universal7885
TARGET_KERNEL_CONFIG := exynos7885-jackpotltejpn_defconfig

# Partitions - Vendor
BOARD_VENDORIMAGE_PARTITION_SIZE := 520093696
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.exynos7885

