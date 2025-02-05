#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/infinix/Infinix_X6532
# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_PACKAGES:= \
    bootctrl.mt6768 \
    libgptutils \
    libz \
    libcutils

# Google Deprecated this, as per statement from Google, this is not needed anymore
# PRODUCT_STATIC_BOOT_CONTROL_HAL was the workaround to allow sideloading with statically 
# linked boot control HAL, before shared library HALs were supported under recovery. 
# Android Q has added such support (HALs will be loaded in passthrough mode), 
# and the workarounds are being removed. Targets should build and install 
# the recovery variant of boot control HAL modules into recovery image, similar to the ones 
# installed for normal boot. 
# PRODUCT_STATIC_BOOT_CONTROL_HAL := \
#     bootctrl.mt6768 \
#     libgptutils \
#     libz \
#     libcutils

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

PRODUCT_USE_DYNAMIC_PARTITIONS := true
