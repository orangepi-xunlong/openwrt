########################## unisocwcn ###############################
ccflags-y+=-fno-pic
CONFIG_RK_WIFI_DEVICE_UWE5622=y
LD_CFLAGS += -D__linux__

#### Global configs for each item ######
ifeq ($(CONFIG_RK_WIFI_DEVICE_UWE5622),y)
export CONFIG_WCN_SDIO = y
ccflags-y += -DCONFIG_CHECK_DRIVER_BY_CHIPID
BSP_CHIP_ID := uwe5622
WCN_HW_TYPE := sdio
endif

ifneq ($(UNISOC_FW_PATH_CONFIG),)
ccflags-y += -DCONFIG_CUSTOMIZE_UNISOC_FW_PATH=\"$(UNISOC_FW_PATH_CONFIG)\"
endif
ifneq ($(UNISOC_DBG_FILESIZE_CONFIG),)
ccflags-y += -DCONFIG_CUSTOMIZE_UNISOC_DBG_FILESIZE=$(UNISOC_DBG_FILESIZE_CONFIG)
endif
ifneq ($(UNISOC_DBG_FILENUM_CONFIG),)
ccflags-y += -DCONFIG_CUSTOMIZE_UNISOC_DBG_FILENUM=$(UNISOC_DBG_FILENUM_CONFIG)
endif
ifneq ($(UNISOC_DBG_PATH_CONFIG),)
ccflags-y += -DCONFIG_CUSTOMIZE_UNISOC_DBG_PATH=\"$(UNISOC_DBG_PATH_CONFIG)\"
endif
ifneq ($(UNISOC_SDIO_IRQ_TYPE_CONFIG),)
ccflags-y += -DCONFIG_CUSTOMIZE_SDIO_IRQ_TYPE=$(UNISOC_SDIO_IRQ_TYPE_CONFIG)
endif

#### add cflag ######
ifeq ($(CONFIG_WCN_SDIO),y)
ccflags-y += -DCONFIG_WCN_SDIO
ccflags-y += -DCONFIG_WCN_SLP
ccflags-y += -DCONFIG_WCN_SWD
export CONFIG_WCN_SWD = y
endif
ccflags-y += -DCONFIG_WCN_BOOT
ccflags-y += -DCONFIG_WCN_UTILS

#### include path ######
ccflags-y += -I$(src)/unisocwcn/include/
ccflags-y += -I$(src)/unisocwcn/platform/
ccflags-y += -I$(src)/unisocwcn/platform/rf/
$(info =====================================================================)
$(info =====================================================================)
$(info =====================================================================)
$(info src=$(src))

ifeq ($(CONFIG_RK_WIFI_DEVICE_UWE5622),y)
#### add cflag ######
ccflags-y += -DCONFIG_RK_BOARD
ccflags-y += -DCONFIG_WCN_PARSE_DTS
ifneq ($(TARGET_BUILD_VARIANT),user)
ccflags-y += -DCONFIG_WCN_LOOPCHECK
endif
endif
######################### unisocwcn end###############################

##################################### unisocwifi ########################
ifneq ($(UNISOC_BSP_INCLUDE),)
ccflags-y += -I$(UNISOC_BSP_INCLUDE)
endif

ifneq ($(UNISOC_WIFI_CUS_CONFIG),)
ccflags-y += -DCUSTOMIZE_WIFI_CFG_PATH=\"$(UNISOC_WIFI_CUS_CONFIG)\"
endif

ifneq ($(UNISOC_WIFI_MAC_FILE),)
ccflags-y += -DCUSTOMIZE_WIFI_MAC_FILE=\"$(UNISOC_WIFI_MAC_FILE)\"
endif

ifneq ($(UNISOC_MODULE_NAME),)
MODULE_NAME := $(UNISOC_MODULE_NAME)
else
MODULE_NAME := sprdwl_ng
endif

####add cflag######
ccflags-y += -DUWE5621_FTR
ccflags-y += -DIBSS_SUPPORT -DIBSS_RSN_SUPPORT
ccflags-y += -DNAN_SUPPORT
ccflags-y += -DRTT_SUPPORT
ccflags-y += -DACS_SUPPORT -DRX_HW_CSUM
ccflags-y += -DWMMAC_WFA_CERTIFICATION
ccflags-y += -DCOMPAT_SAMPILE_CODE
ccflags-y += -DRND_MAC_SUPPORT
ccflags-y += -DATCMD_ASSERT
ccflags-y += -DTCPACK_DELAY_SUPPORT
ifneq ($(TARGET_BUILD_VARIANT),user)
ccflags-y += -DWL_CONFIG_DEBUG
endif
ccflags-y += -DSPLIT_STACK
ccflags-y += -DOTT_UWE
ifeq ($(UNISOC_STA_SOFTAP_SCC_MODE),y)
ccflags-y += -DSTA_SOFTAP_SCC_MODE
endif

ccflags-$(CONFIG_UNISOC_WIFI_PS) += -DUNISOC_WIFI_PS
ccflags-y += -DPPPOE_LLC_SUPPORT
ccflags-y += -DSYNC_DISCONNECT

#####module name ###

MODULE_NAME1=uwe5622_bsp_sdio
obj-m += $(MODULE_NAME1).o
obj-m += $(MODULE_NAME).o
#

$(MODULE_NAME1)-y += unisocwcn/wcn_bus.o \
			unisocwcn/platform/wcn_boot.o \
			unisocwcn/platform/wcn_dump.o \
			unisocwcn/platform/bufring.o \
			unisocwcn/platform/wcn_txrx.o \
			unisocwcn/platform/wcn_op.o \
			unisocwcn/platform/wcn_parn_parser.o \
			unisocwcn/platform/rdc_debug.o \
			unisocwcn/platform/wcn_log.o \
			unisocwcn/platform/wcn_misc.o \
			unisocwcn/platform/wcn_procfs.o \
			unisocwcn/platform/loopcheck.o

$(MODULE_NAME1)-$(CONFIG_WCN_SWD) += unisocwcn/platform/wcn_swd_dp.o

$(MODULE_NAME1)-$(CONFIG_WCN_SDIO) += \
			unisocwcn/sdio/sdiohal_main.o \
			unisocwcn/sdio/sdiohal_common.o \
			unisocwcn/sdio/sdiohal_tx.o \
			unisocwcn/sdio/sdiohal_rx.o \
			unisocwcn/sdio/sdio_v3.o \
			unisocwcn/sdio/sdiohal_ctl.o \
			unisocwcn/sleep/sdio_int.o \
			unisocwcn/sleep/slp_mgr.o \
			unisocwcn/sleep/slp_sdio.o \
			unisocwcn/sleep/slp_test.o \
			unisocwcn/platform/mem_pd_mgr.o

#######add .o file#####
$(MODULE_NAME)-y += unisocwifi/main.o 
$(MODULE_NAME)-y += unisocwifi/cfg80211.o 
$(MODULE_NAME)-y += unisocwifi/txrx.o 
$(MODULE_NAME)-y += unisocwifi/cmdevt.o 
$(MODULE_NAME)-y += unisocwifi/npi.o 
$(MODULE_NAME)-y += unisocwifi/msg.o 
$(MODULE_NAME)-y += unisocwifi/work.o 
$(MODULE_NAME)-y += unisocwifi/vendor.o
$(MODULE_NAME)-y += unisocwifi/tcp_ack.o 
$(MODULE_NAME)-y += unisocwifi/mm.o 
$(MODULE_NAME)-y += unisocwifi/reorder.o 
$(MODULE_NAME)-y += unisocwifi/wl_core.o 
$(MODULE_NAME)-y += unisocwifi/tx_msg.o 
$(MODULE_NAME)-y += unisocwifi/rx_msg.o
$(MODULE_NAME)-y += unisocwifi/wl_intf.o 
$(MODULE_NAME)-y += unisocwifi/qos.o 
$(MODULE_NAME)-y += unisocwifi/dbg_ini_util.o 
$(MODULE_NAME)-y += unisocwifi/reg_domain.o
$(MODULE_NAME)-y += unisocwifi/defrag.o
$(MODULE_NAME)-y += unisocwifi/ibss.o
$(MODULE_NAME)-y += unisocwifi/nan.o
$(MODULE_NAME)-y += unisocwifi/tracer.o
$(MODULE_NAME)-y += unisocwifi/rf_marlin3.o
$(MODULE_NAME)-y += unisocwifi/rtt.o
$(MODULE_NAME)-y += unisocwifi/api_version.o
$(MODULE_NAME)-y += unisocwifi/rnd_mac_addr.o
$(MODULE_NAME)-y += unisocwifi/debug.o
