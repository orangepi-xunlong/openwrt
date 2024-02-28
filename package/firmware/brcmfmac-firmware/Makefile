include $(TOPDIR)/rules.mk

PKG_NAME:=brcmfmac-firmware
PKG_VERSION:=2024-03-22
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

BRCMFMAC_FIRMWARE_URL:=https://github.com/armbian/firmware/raw/master/brcm

define Download/brcmfmac43456_sdio_bin
  URL:=$(BRCMFMAC_FIRMWARE_URL)/
  FILE:=brcmfmac43456-sdio.bin
  HASH:=3167956a7b2cffc4cfcaf6a282b95728c529eebef18a5d9e6d9ff32de32cc67c
endef
$(eval $(call Download,brcmfmac43456_sdio_bin))

define Download/brcmfmac43456_sdio_txt
  URL:=$(BRCMFMAC_FIRMWARE_URL)/
  FILE:=brcmfmac43456-sdio.txt
  HASH:=66c71eb53b47c49d42386b66735134578640b0946f3f46e44f384fef5aacfd9e
endef
$(eval $(call Download,brcmfmac43456_sdio_txt))

define Download/brcmfmac43456_sdio_clm_blob
  URL:=$(BRCMFMAC_FIRMWARE_URL)/
  FILE:=brcmfmac43456-sdio.clm_blob
  HASH:=2dbd7d22fc9af0eb560ceab45b19646d211bc7b34a1dd00c6bfac5dd6ba25e8a
endef
$(eval $(call Download,brcmfmac43456_sdio_clm_blob))

define Build/Compile

endef

define Package/brcmfmac-firmware
  TITLE:=brcmfmac firmware
  SECTION:=firmware
  CATEGORY:=Firmware
  PROVIDES:=\
	brcmfmac43456_sdio_bin \
	brcmfmac43456_sdio_clm_blob \
	brcmfmac43456_sdio_txt
endef

define Package/brcmfmac-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware/brcm
	$(INSTALL_DATA)  \
		$(DL_DIR)/brcmfmac43456-sdio.bin \
		$(1)/lib/firmware/brcm
	$(INSTALL_DATA) \
		$(DL_DIR)/brcmfmac43456-sdio.clm_blob \
		$(1)/lib/firmware/brcm
	$(INSTALL_DATA) \
		$(DL_DIR)/brcmfmac43456-sdio.txt \
		$(1)/lib/firmware/brcm
endef

$(eval $(call BuildPackage,brcmfmac-firmware))
