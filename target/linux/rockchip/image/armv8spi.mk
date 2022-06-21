# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2020 Tobias Maedel

define Build/append-dtb
	dd if="$(DTS_DIR)"/$(DEVICE_DTS).dtb >> $@
endef

define Build/pine64-spi-bin

        # Copy the idbloader and the u-boot image to the image at sector 0x40 and 0x200
        dd if="$(STAGING_DIR_IMAGE)"/$(UBOOT_DEVICE_NAME)-idbloader.img of="$@" seek=64 conv=notrunc
        dd if="$(STAGING_DIR_IMAGE)"/$(UBOOT_DEVICE_NAME)-u-boot.itb of="$@" seek=512 conv=notrunc
endef

define Device/xunlong_orangepi-r1-plus
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := OrangePi R1 Plus
  SOC := rk3328
  UBOOT_DEVICE_NAME := orangepi-r1-plus-rk3328-spi
  UBOOT_SIZE := 1152k
  DTB_SIZE := 64k
  FIRMWARE_SIZE := 15168k
  IMAGE_SIZE := 16384k
  BLOCK_SIZE := 4k
  IMAGE/sysupgrade.bin := pine64-spi-bin | pad-to $$$$(UBOOT_SIZE) | append-dtb | pad-to $$$$(DTB_SIZE) | append-kernel | append-rootfs \
	  | pad-rootfs | append-metadata | check-size $$$$(IMAGE_SIZE)
  IMAGE/uboot.bin := pine64-spi-bin | pad-to $$$$(BLOCK_SIZE)
  IMAGE/dtb.bin := append-dtb | pad-to $$$$(BLOCK_SIZE)
  IMAGE/firmware.bin := append-kernel | append-rootfs | pad-rootfs | append-metadata | check-size $$$$(FIRMWARE_SIZE)
  DEVICE_PACKAGES := kmod-usb-net-rtl8152
endef

TARGET_DEVICES += xunlong_orangepi-r1-plus

define Device/xunlong_orangepi-r1-plus-lts
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := OrangePi R1 Plus LTS
  SOC := rk3328
  UBOOT_DEVICE_NAME := orangepi-r1-plus-lts-rk3328-spi
  UBOOT_SIZE := 1152k
  DTB_SIZE := 64k
  FIRMWARE_SIZE := 15168k
  IMAGE_SIZE := 16384k
  BLOCK_SIZE := 4k
  IMAGE/sysupgrade.bin := pine64-spi-bin | pad-to $$$$(UBOOT_SIZE) | append-dtb | pad-to $$$$(DTB_SIZE) | append-kernel | append-rootfs \
	  | pad-rootfs | append-metadata | check-size $$$$(IMAGE_SIZE)
  IMAGE/uboot.bin := pine64-spi-bin | pad-to $$$$(BLOCK_SIZE)
  IMAGE/dtb.bin := append-dtb | pad-to $$$$(BLOCK_SIZE)
  IMAGE/firmware.bin := append-kernel | append-rootfs | pad-rootfs | append-metadata | check-size $$$$(FIRMWARE_SIZE)
  DEVICE_PACKAGES := kmod-usb-net-rtl8152
endef

TARGET_DEVICES += xunlong_orangepi-r1-plus-lts

### Devices ###
define Device/Default
  PROFILES := Default
  KERNEL_LOADADDR = 0x02080000
  KERNEL := kernel-bin | lzma | uImage lzma
  IMAGES := sysupgrade.bin uboot.bin dtb.bin firmware.bin
  DEVICE_DTS = rockchip/$$(SOC)-$(lastword $(subst _, ,$(1)))
endef
