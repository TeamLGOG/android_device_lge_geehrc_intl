#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file includes all definitions that apply to ALL geehrc devices, and
# are also specific to geehrc devices
#
# Everything in this directory will become public

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/lge/gee/gee-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/lge/geehrc_intl/overlay

## common overlays
DEVICE_PACKAGE_OVERLAYS += device/lge/gee-common/overlay

PRODUCT_PACKAGES := \
	lights.geehrc_intl

# Inherit from gee-common
$(call inherit-product, device/lge/gee-common/gee-common.mk)

# Enable for debugging
PRODUCT_PROPERTY_OVERRIDES += \
    ro.debuggable=1 \
    persist.service.adb.enable=1

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1

# Telephony Properties
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnCdmaDevice=0 \
    telephony.lteOnGsmDevice=1 \
    ro.telephony.default_network=9 \
    ro.ril.def.preferred.network=9

# Vold configuration
PRODUCT_COPY_FILES += \
    device/lge/geehrc_intl/vold.fstab:system/etc/vold.fstab

# GPS configuration
PRODUCT_COPY_FILES += \
        device/lge/geehrc_intl/configs/gps.conf:system/etc/gps.conf

# Ramdisk
PRODUCT_COPY_FILES += \
    device/lge/geehrc_intl/ramdisk/init.geehrc_intl.rc:root/init.geehrc_intl.rc \
    device/lge/geehrc_intl/ramdisk/ueventd.geehrc_intl.rc:root/ueventd.geehrc_intl.rc \
    device/lge/geehrc_intl/ramdisk/fstab.gee:root/fstab.gee

# NFC Firmware
PRODUCT_COPY_FILES += \
    device/lge/geehrc_intl/prebuilt/libpn544_fw.so:system/vendor/firmware/libpn544_fw.so \


# These are the hardware-specific features
PRODUCT_COPY_FILES += \
   frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# CameraHAL
PRODUCT_PACKAGES += camera.geehrc_intl
