# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2020 Tobias Maedel


define Device/xunlong_orangepi-r1-plus
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := OrangePi R1 Plus
  SOC := rk3328
  BOOT_SIZE = 1216k
  UBOOT_DEVICE_NAME := orangepi-r1-plus-rk3328-spi
  IMAGE/sysupgrade.bin := pine64-spi-bin | pad-to $$$$(BOOT_SIZE) | append-kernel | append-rootfs | pad-rootfs | append-metadata
  DEVICE_PACKAGES := kmod-usb-net-rtl8152
endef

TARGET_DEVICES += xunlong_orangepi-r1-plus

define Device/xunlong_orangepi-r1-plus-lts
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := OrangePi R1 Plus LTS
  SOC := rk3328
  BOOT_SIZE = 1216k
  UBOOT_DEVICE_NAME := orangepi-r1-plus-lts-rk3328-spi
  IMAGE/sysupgrade.bin := pine64-spi-bin | pad-to $$$$(BOOT_SIZE) | append-kernel | append-rootfs | pad-rootfs | append-metadata
  DEVICE_PACKAGES := kmod-usb-net-rtl8152
endef

TARGET_DEVICES += xunlong_orangepi-r1-plus-lts

### Devices ###
define Device/Default
  PROFILES := Default
  KERNEL_LOADADDR = 0x02080000
  KERNEL := kernel-bin | lzma | uImage lzma
  IMAGES := sysupgrade.bin
  DEVICE_DTS = rockchip/$$(SOC)-$(lastword $(subst _, ,$(1)))
endef
