# 
# Copyright (C) 2020 Tobias Maedel
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Device/xunlong_orangepi-r1plus
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := OrangePi R1Plus
  SOC := rk3328
  UBOOT_DEVICE_NAME := orangepi-r1plus-rk3328
  IMAGE/sysupgrade.img.gz := boot-common | boot-script orangepi-r1plus | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-usb-net-rtl8152
endef
TARGET_DEVICES += xunlong_orangepi-r1plus

define Device/pine64_rockpro64
  DEVICE_VENDOR := Pine64
  DEVICE_MODEL := RockPro64
  SOC := rk3399
  UBOOT_DEVICE_NAME := rockpro64-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
endef
TARGET_DEVICES += pine64_rockpro64

define Device/radxa_rock-pi-4
  DEVICE_VENDOR := Radxa
  DEVICE_MODEL := Rock Pi 4
  SOC := rk3399
  UBOOT_DEVICE_NAME := rock-pi-4-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
endef
TARGET_DEVICES += radxa_rock-pi-4
