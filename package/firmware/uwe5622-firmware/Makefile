include $(TOPDIR)/rules.mk

PKG_NAME:=uwe5622-firmware
PKG_VERSION:=2023-04-19
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

BCMDHD_FIRMWARE_URL:=https://raw.githubusercontent.com/orangepi-xunlong/firmware/b2809d6c7a79ab874a91b84b9b0d9169cb41a749

define Download/wcnmodem
  URL:=$(BCMDHD_FIRMWARE_URL)/
  FILE:=wcnmodem.bin
  HASH:=119b87ce30875734a67462f7293fb8fe85acf3270fe8b78c978ae24be7715a80
endef
$(eval $(call Download,wcnmodem))

define Download/wifi_2355b001_1ant
  URL:=$(BCMDHD_FIRMWARE_URL)/
  FILE:=wifi_2355b001_1ant.ini
  HASH:=1f3c40ec245a8d0b99ad1c23706597d6dd5008ab80cefb7bcc1956efc4e938f7
endef
$(eval $(call Download,wifi_2355b001_1ant))

define Package/uwe5622-firmware
  TITLE:=uwe5622 firmware
  SECTION:=firmware
  CATEGORY:=Firmware
  PROVIDES:=\
	wcnmodem \
	wifi_2355b001_1ant
endef

define Build/Compile

endef

define Package/uwe5622-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA)  \
		$(DL_DIR)/wcnmodem.bin \
		$(1)/lib/firmware
	$(INSTALL_DATA) \
		$(DL_DIR)/wifi_2355b001_1ant.ini \
		$(1)/lib/firmware
endef

$(eval $(call BuildPackage,uwe5622-firmware))
