#
# Copyright (C) 2013-2016 OpenWrt.org
# Copyright (C) 2017 Yousong Zhou
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/orangepi-xunlong/u-boot-orangepi
PKG_SOURCE_DATE:=2017-09
PKG_SOURCE_VERSION:=6fe17fac388aad17490cf386578b7532975e567f
PKG_MIRROR_HASH:=4345d99b0772eba496f24ede9e973d34b72b8239309a75f28acca4fd428bd59e

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk

define U-Boot/Default
  BUILD_TARGET:=sunxi
  UBOOT_IMAGE:=u-boot-sunxi-with-spl.bin
  UENV:=default
  HIDDEN:=1
endef

define U-Boot/orangepi_zero3
  BUILD_SUBTARGET:=cortexa53
  NAME:=Xunlong Orange Pi Zero3
  BUILD_DEVICES:=xunlong_orangepi-zero3
  DEPENDS:=+PACKAGE_u-boot-orangepi_zero3:trusted-firmware-a-sunxi-h616
  UENV:=h616
  ATF:=h616
endef

UBOOT_TARGETS := \
	orangepi_zero3

UBOOT_CONFIGURE_VARS += USE_PRIVATE_LIBGCC=yes

UBOOT_MAKE_FLAGS += \
	BL31=$(STAGING_DIR_IMAGE)/bl31_sunxi-$(ATF).bin SCP=/dev/null

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR_IMAGE)
	$(CP) $(PKG_BUILD_DIR)/$(UBOOT_IMAGE) $(STAGING_DIR_IMAGE)/$(BUILD_DEVICES)-u-boot-with-spl.bin
	mkimage -C none -A arm -T script -d uEnv-$(UENV).txt \
		$(STAGING_DIR_IMAGE)/$(BUILD_DEVICES)-boot.scr
endef

define Package/u-boot/install/default
endef

$(eval $(call BuildPackage/U-Boot))
