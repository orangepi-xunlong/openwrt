include $(TOPDIR)/rules.mk

PKG_NAME:=bcmdhd-firmware
PKG_VERSION:=2023-04-19
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

BCMDHD_FIRMWARE_URL:=https://raw.githubusercontent.com/orangepi-xunlong/firmware/034127aba373d8ae6afd8a4af0ba5d59f99fc011

define Download/fw_bcm43752a2_pcie_ag_bin
  URL:=$(BCMDHD_FIRMWARE_URL)/ap6275p/
  FILE:=fw_bcm43752a2_pcie_ag.bin
  HASH:=6a2dbe01e72221defba91a52e158768d973a3c85ca2d881c924379e35ad36b23
endef
$(eval $(call Download,fw_bcm43752a2_pcie_ag_bin))

define Download/clm_bcm43752a2_pcie_ag_blob
  URL:=$(BCMDHD_FIRMWARE_URL)/ap6275p/
  FILE:=clm_bcm43752a2_pcie_ag.blob
  HASH:=d81ba8adc8b3bc0a5589146b31bc318122693d8a116a5028d3fe826556c5a92a
endef
$(eval $(call Download,clm_bcm43752a2_pcie_ag_blob))

define Download/nvram_AP6275P_txt
  URL:=$(BCMDHD_FIRMWARE_URL)/ap6275p/
  FILE:=nvram_AP6275P.txt
  HASH:=bddad73479135a36aa68370a33eec40f2d5186620609e28ddc382febdf3965e5
endef
$(eval $(call Download,nvram_AP6275P_txt))

define Build/Compile

endef

define Package/bcmdhd-firmware
  TITLE:=bcmdhd firmware
  SECTION:=firmware
  CATEGORY:=Firmware
  PROVIDES:=\
	clm_bcm43752a2_pcie_ag_blob \
	nvram_AP6275P_txt \
	fw_bcm43752a2_pcie_ag_bin
endef

define Package/bcmdhd-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware/ap6275p
	$(INSTALL_DATA)  \
		$(DL_DIR)/clm_bcm43752a2_pcie_ag.blob \
		$(1)/lib/firmware/ap6275p
	$(INSTALL_DATA) \
		$(DL_DIR)/nvram_AP6275P.txt \
		$(1)/lib/firmware/ap6275p
	$(INSTALL_DATA) \
		$(DL_DIR)/fw_bcm43752a2_pcie_ag.bin \
		$(1)/lib/firmware/ap6275p
endef

$(eval $(call BuildPackage,bcmdhd-firmware))
