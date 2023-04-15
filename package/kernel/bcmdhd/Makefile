include $(TOPDIR)/rules.mk

PKG_NAME:=bcmdhd
PKG_RELEASE:=1

#PKG_SOURCE_PROTO:=git
#PKG_SOURCE_DATE:=2023-04-19
#PKG_SOURCE_URL:=https://github.com/baiywt/bcmdhd.git
#PKG_SOURCE_VERSION:=57d4d3c61539b12dbc75f4cbab98779de27abeb6#82d2d3343fef219203a4c576766d6d00966b2e1a
#PKG_MIRROR_HASH:=482d02437f464c77ee18ea531fd6a414e29fec2b2286c2cbfa20ca004f8a80ae

PKG_BUILD_PARALLEL:=1

STAMP_CONFIGURED_DEPENDS := $(STAGING_DIR)/usr/include/mac80211-backport/backport/autoconf.h

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/bcmdhd
  SUBMENU:=Wireless Drivers
  TITLE:=Broadcom FullMAC wireless driver
  DEPENDS:=+kmod-mac80211 \
	+@DRIVER_11N_SUPPORT +@DRIVER_11AC_SUPPORT \
	+bcmdhd-firmware
  FILES:= \
	$(PKG_BUILD_DIR)/bcmdhd.ko \
	$(PKG_BUILD_DIR)/dhd_static_buf.ko
  AUTOLOAD:=$(call AutoProbe,bcmdhd)
endef

NOSTDINC_FLAGS := \
	$(KERNEL_NOSTDINC_FLAGS) \
	-I$(PKG_BUILD_DIR) \
	-I$(STAGING_DIR)/usr/include/mac80211-backport/uapi \
	-I$(STAGING_DIR)/usr/include/mac80211-backport \
	-I$(STAGING_DIR)/usr/include/mac80211 \
	-I$(STAGING_DIR)/usr/include/mac80211/uapi \
	-include backport/autoconf.h \
	-include backport/backport.h

NOSTDINC_FLAGS+=-DBUILD_OPENWRT

define Build/Compile
	+$(MAKE) $(PKG_JOBS) -C "$(LINUX_DIR)" \
		$(KERNEL_MAKE_FLAGS) \
		M="$(PKG_BUILD_DIR)" \
		NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)" \
		modules
endef

$(eval $(call KernelPackage,bcmdhd))
