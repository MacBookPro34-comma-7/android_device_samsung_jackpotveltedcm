#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)

# Inherit from jackpotveltedcm device
$(call inherit-product, device/samsung/jackpotveltedcm/device.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := jackpotveltedcm
PRODUCT_NAME := omni_jackpotveltedcm
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A530D
PRODUCT_MANUFACTURER := samsung

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="samsung/omni_jackpotveltedcm/jackpotveltedcm:11/QQ3A.200805.001/lineage:eng/test-keys" \
    PRIVATE_BUILD_DESC="omni_jackpotveltedcm-user 11 QQ3A.200805.001 lineage test-keys"
