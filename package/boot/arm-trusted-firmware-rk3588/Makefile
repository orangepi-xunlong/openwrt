include $(TOPDIR)/rules.mk

PKG_NAME:=arm-trusted-firmware-rk3588
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/rockchip-linux/rkbin
PKG_SOURCE_DATE:=2022-08-01
PKG_SOURCE_VERSION:=b0c100f1a260d807df450019774993c761beb79d
PKG_MIRROR_HASH:=d5a9e4cbd640b74ae5b5046df450a588f39e7fc8741bacbf5b445dcaf6ec1d35

MAKE_PATH:=$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/arm-trusted-firmware-rk3588
    SECTION:=boot
    CATEGORY:=Boot Loaders
    TITLE:=ARM Trusted Firmware for Rockchip
    DEPENDS:=@TARGET_rockchip_armv8
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
	#mkimage -n rk3328 -T rksd -d $(PKG_BUILD_DIR)/bin/rk33/rk3328_ddr_333MHz_v1.17.bin $(PKG_BUILD_DIR)/idbloader.bin
	#cat $(PKG_BUILD_DIR)/bin/rk33/rk322xh_miniloader_v2.50.bin >> $(PKG_BUILD_DIR)/idbloader.bin
	#$(PKG_BUILD_DIR)/tools/trust_merger --replace bl31.elf $(PKG_BUILD_DIR)/bin/rk33/rk322xh_bl31_v1.46.elf $(PKG_BUILD_DIR)/trust.ini
endef

define Build/InstallDev
	$(INSTALL_DIR) -p $(STAGING_DIR_IMAGE)
	$(CP) $(PKG_BUILD_DIR)/bin/rk35/rk3588_bl31_v1.27.elf $(STAGING_DIR_IMAGE)/
	$(CP) $(PKG_BUILD_DIR)/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.08.bin $(STAGING_DIR_IMAGE)/
endef

define Package/arm-trusted-firmware-rk3588/install
endef

$(eval $(call BuildPackage,arm-trusted-firmware-rk3588))
