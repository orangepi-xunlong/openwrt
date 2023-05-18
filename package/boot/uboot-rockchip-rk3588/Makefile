#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/orangepi-xunlong/u-boot-orangepi
PKG_SOURCE_DATE:=2017-09
PKG_SOURCE_VERSION:=d7c6b92f9e33283bea56dbaec7743f5ecb5a7f89
PKG_MIRROR_HASH:=9c0d83c1a01a48173e47f63f7cb292347f0cebf4f0396d98616e0bfd5ce6f3fc

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk

define U-Boot/Default
  BUILD_TARGET:=rockchip
  UENV:=default
  HIDDEN:=1
endef

define U-Boot/orangepi-5-rk3588
  #PKG_VERSION:=2023.04
  #PKG_RELEASE:=$(AUTORELEASE)
  #PKG_HASH:=e31cac91545ff41b71cec5d8c22afd695645cd6e2a442ccdacacd60534069341
  BUILD_SUBTARGET:=armv8
  NAME:=OrangePi 5
  BUILD_DEVICES:= \
    xunlong_orangepi-5
  DEPENDS:=+PACKAGE_u-boot-orangepi-5-rk3588:arm-trusted-firmware-rk3588
  PKG_BUILD_DEPENDS:=arm-trusted-firmware-rk3588
  ATF:=rk3588_bl31_v1.27.elf
  TPL=rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.08.bin
  #OF_PLATDATA:=$(1)
endef

define U-Boot/orangepi-5-rk3588-spi
  BUILD_SUBTARGET:=armv8
  NAME:=Orange Pi 5 for Spi Boot
  BUILD_DEVICES:= \
    xunlong_orangepi-5-spi
  DEPENDS:=+PACKAGE_u-boot-orangepi-5-rk3588-spi:arm-trusted-firmware-rk3588
  PKG_BUILD_DEPENDS:=arm-trusted-firmware-rk3588
  ATF:=rk3588_bl31_v1.27.elf
  TPL=rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.08.bin
  #OF_PLATDATA:=$(1)
endef

define U-Boot/orangepi-5-plus-rk3588
  BUILD_SUBTARGET:=armv8
  NAME:=Orange Pi 5 Plus
  BUILD_DEVICES:= \
    xunlong_orangepi-5-plus
  DEPENDS:=+PACKAGE_u-boot-orangepi-5-plus-rk3588:arm-trusted-firmware-rk3588
  PKG_BUILD_DEPENDS:=arm-trusted-firmware-rk3588
  ATF:=rk3588_bl31_v1.27.elf
  TPL=rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.08.bin
  #OF_PLATDATA:=$(1)
endef

define U-Boot/orangepi-5-plus-rk3588-spi
  BUILD_SUBTARGET:=armv8
  NAME:=Orange Pi 5 Plus for Spi Boot
  BUILD_DEVICES:= \
    xunlong_orangepi-5-plus-spi
  DEPENDS:=+PACKAGE_u-boot-orangepi-5-plus-rk3588-spi:arm-trusted-firmware-rk3588
  PKG_BUILD_DEPENDS:=arm-trusted-firmware-rk3588
  ATF:=rk3588_bl31_v1.27.elf
  TPL=rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.08.bin
  #OF_PLATDATA:=$(1)
endef

UBOOT_TARGETS := \
  orangepi-5-rk3588 \
  orangepi-5-rk3588-spi \
  orangepi-5-plus-rk3588 \
  orangepi-5-plus-rk3588-spi \

UBOOT_CONFIGURE_VARS += USE_PRIVATE_LIBGCC=yes

UBOOT_MAKE_FLAGS += \
  BL31=$(STAGING_DIR_IMAGE)/$(ATF) \
  spl/u-boot-spl.bin u-boot.dtb u-boot.itb

define Build/Configure
	$(call Build/Configure/U-Boot)

	$(SED) 's#CONFIG_MKIMAGE_DTC_PATH=.*#CONFIG_MKIMAGE_DTC_PATH="$(PKG_BUILD_DIR)/scripts/dtc/dtc"#g' $(PKG_BUILD_DIR)/.config
	echo 'CONFIG_IDENT_STRING=" OpenWrt"' >> $(PKG_BUILD_DIR)/.config
endef

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR_IMAGE)
	$(PKG_BUILD_DIR)/tools/mkimage -n rk3588 -T rksd -d \
		$(STAGING_DIR_IMAGE)/$(TPL):$(PKG_BUILD_DIR)/spl/u-boot-spl.bin $(PKG_BUILD_DIR)/idbloader.img
	$(CP) $(PKG_BUILD_DIR)/idbloader.img $(STAGING_DIR_IMAGE)/$(BUILD_VARIANT)-idbloader.img
	$(CP) $(PKG_BUILD_DIR)/u-boot.itb $(STAGING_DIR_IMAGE)/$(BUILD_VARIANT)-u-boot.itb
endef

define Package/u-boot/install/default
endef

$(eval $(call BuildPackage/U-Boot))
