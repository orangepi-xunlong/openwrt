#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/orangepi-xunlong/u-boot-orangepi
PKG_SOURCE_DATE:=2017-09
PKG_SOURCE_VERSION:=752ac3f2fdcfe9427ca8868d95025aacd48fc00b
PKG_MIRROR_HASH:=efc43f84644deb10d6654d094871df6f5cb97a4a4508e4dbf75c4a71fa409bf7

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk

define U-Boot/Default
  BUILD_TARGET:=rockchip
  UENV:=default
  HIDDEN:=1
endef

# RK3588 boards

define U-Boot/rk3588/Default
  BUILD_SUBTARGET:=armv8
  DEPENDS:=+PACKAGE_u-boot-$(1):arm-trusted-firmware-rk3566
  ATF:=rk3588_bl31_v1.44.elf
  TPL:=rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.15.bin
endef

define U-Boot/orangepi-5-pro-rk3588s
  $(U-Boot/rk3588/Default)
  NAME:=Orange Pi 5 Pro
  BUILD_DEVICES:= \
    xunlong_orangepi-5-pro
endef

define U-Boot/orangepi-5-pro-rk3588s-spi
  $(U-Boot/rk3588/Default)
  NAME:=Orange Pi 5 Pro for Spi Boot
  BUILD_DEVICES:= \
    xunlong_orangepi-5-pro-spi
endef

UBOOT_TARGETS := \
  orangepi-5-pro-rk3588s \
  orangepi-5-pro-rk3588s-spi

UBOOT_CONFIGURE_VARS += USE_PRIVATE_LIBGCC=yes

UBOOT_MAKE_FLAGS += \
  BL31=$(STAGING_DIR_IMAGE)/$(ATF) \
  spl/u-boot-spl.bin u-boot.dtb u-boot.itb

RKBIN_URL:=https://github.com/orangepi-xunlong/rk-rootfs-build/raw/rkbin

define Download/rk3588-ddr
  FILE:=rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.15.bin
  URL:=$(RKBIN_URL)/rk35/
  HASH:=a8385c213d7d24a51ad07ae7702845467c7c66c675354729fe42d8194deec49d
endef
$(eval $(call Download,rk3588-ddr))

define Download/rk3588-atf
  FILE:=rk3588_bl31_v1.44.elf
  URL:=$(RKBIN_URL)/rk35/
  HASH:=483b4219260495c4aeea616f33b61657db8e0978aae4cdf1f3c934873f68ef0e
endef
$(eval $(call Download,rk3588-atf))

define Build/Prepare
	$(call Build/Prepare/Default)
	$(CP) $(DL_DIR)/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.15.bin $(STAGING_DIR_IMAGE)/
	$(CP) $(DL_DIR)/rk3588_bl31_v1.44.elf $(STAGING_DIR_IMAGE)/
endef

define Build/Configure
	$(call Build/Configure/U-Boot)

	$(SED) 's#CONFIG_MKIMAGE_DTC_PATH=.*#CONFIG_MKIMAGE_DTC_PATH="$(PKG_BUILD_DIR)/scripts/dtc/dtc"#g' $(PKG_BUILD_DIR)/.config
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
