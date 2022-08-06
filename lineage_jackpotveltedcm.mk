#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
 
# Release name
PRODUCT_RELEASE_NAME := jackpotveltedcm

# Inherit full device configuration.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from jackpotveltedcm device.
$(call inherit-product, device/samsung/jackpotveltedcm/device.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_DEVICE := jackpotveltedcm
PRODUCT_NAME := lineage_jackpotveltedcm
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A530D
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone
