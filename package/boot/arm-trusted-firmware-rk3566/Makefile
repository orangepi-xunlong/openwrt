include $(TOPDIR)/rules.mk

PKG_NAME:=arm-trusted-firmware-rk3566
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/rockchip-linux/rkbin
PKG_SOURCE_DATE:=2022-08-01
PKG_SOURCE_VERSION:=b4558da0860ca48bf1a571dd33ccba580b9abe23
PKG_MIRROR_HASH:=186cebccbd060078ec07f28918eb703f717f480136a2f351bb1ca59da17eb23b

MAKE_PATH:=$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/arm-trusted-firmware-rk3566
    SECTION:=boot
    CATEGORY:=Boot Loaders
    TITLE:=ARM Trusted Firmware for Rockchip
    DEPENDS:=@TARGET_rockchip_armv8
endef

define Build/Configure
	$(call Build/Configure/Default)
endef

define Build/Compile
endef

define Build/InstallDev
	$(INSTALL_DIR) -p $(STAGING_DIR_IMAGE)
	$(CP) $(PKG_BUILD_DIR)/bin/rk35/rk3568_bl31_v1.43.elf $(STAGING_DIR_IMAGE)/
	$(CP) $(PKG_BUILD_DIR)/bin/rk35/rk3566_ddr_1056MHz_v1.18.bin $(STAGING_DIR_IMAGE)/
endef

define Package/arm-trusted-firmware-rk3566/install
endef

$(eval $(call BuildPackage,arm-trusted-firmware-rk3566))
