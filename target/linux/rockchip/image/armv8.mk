# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2020 Tobias Maedel

# FIT will be loaded at 0x02080000. Leave 16M for that, align it to 2M and load the kernel after it.
KERNEL_LOADADDR := 0x03200000

define Device/xunlong_orangepi-5-pro
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := Orange Pi 5 Pro
  SOC := rk3588s
  KERNEL := kernel-bin
  IMAGE/sysupgrade.img.gz := boot-common | boot-script orangepi-5 | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-usb-net-rtl8152
endef
TARGET_DEVICES += xunlong_orangepi-5-pro

define Device/xunlong_orangepi-5-pro-spi
  DEVICE_VENDOR := XunLong
  DEVICE_MODEL := Orange Pi 5 Pro For Spi Boot
  SOC := rk3588s
  UBOOT_DEVICE_NAME := orangepi-5-pro-rk3588s-spi
  DEVICE_PACKAGES := kmod-usb-net-rtl8152 kmod-r8125
  KERNEL_LOADADDR = 0x00400000
  KERNEL := kernel-bin | lzma | uImage lzma
  IMAGES := sysupgrade.bin uboot.bin dtb.bin firmware.bin
  UBOOT_SIZE := 2048k
  DTB_SIZE := 256k
  FIRMWARE_SIZE := 14080k
  IMAGE_SIZE := 16384k
  BLOCK_SIZE := 4k
  IMAGE/sysupgrade.bin := pine64-img-spi | pad-to $$$$(UBOOT_SIZE) | append-dtb | pad-to $$$$(DTB_SIZE) \
	  | append-kernel | pad-to $$$$(BLOCK_SIZE) | append-rootfs | pad-rootfs | append-metadata | check-size $$$$(IMAGE_SIZE)
  IMAGE/uboot.bin := pine64-img-spi | pad-to $$$$(BLOCK_SIZE)
  IMAGE/dtb.bin := append-dtb | pad-to $$$$(BLOCK_SIZE)
  IMAGE/firmware.bin := append-kernel | pad-to $$$$(BLOCK_SIZE) | append-rootfs | pad-rootfs | append-metadata | check-size $$$$(FIRMWARE_SIZE)
endef
TARGET_DEVICES += xunlong_orangepi-5-pro-spi
