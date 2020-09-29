#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common msm8937-common
include device/xiaomi/msm8937-common/BoardConfigCommon.mk

COMMON_PATH := device/xiaomi/sdm439-common

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# HIDL
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest.xml

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200,n8 androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += earlycon=msm_serial_dm,0x78B0000 loop.max_part=7
TARGET_KERNEL_SOURCE := kernel/xiaomi/sdm439
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
TARGET_KERNEL_ARCH := arm64

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
TARGET_COPY_OUT_VENDOR := vendor
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1966587904 # 1966604288 - 16384
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824

# Enable real time lockscreen charging current values
BOARD_GLOBAL_CFLAGS += -DBATTERY_REAL_INFO

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/sys/dev/dt2w"

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/fstab.recovery.qcom

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy

# Inherit from the proprietary version
include vendor/xiaomi/sdm439-common/BoardConfigVendor.mk
