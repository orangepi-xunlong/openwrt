PWD := $(shell pwd)
all_dependencies := driver

ifneq ($(UNISOC_BSP_INCLUDE),)
EXTRA_CFLAGS += -I$(UNISOC_BSP_INCLUDE)
endif

ifneq ($(UNISOC_WIFI_CUS_CONFIG),)
EXTRA_CFLAGS += -DCUSTOMIZE_WIFI_CFG_PATH=\"$(UNISOC_WIFI_CUS_CONFIG)\"
endif

ifneq ($(UNISOC_WIFI_MAC_FILE),)
EXTRA_CFLAGS += -DCUSTOMIZE_WIFI_MAC_FILE=\"$(UNISOC_WIFI_MAC_FILE)\"
endif

ifneq ($(UNISOC_MODULE_NAME),)
MODULE_NAME := $(UNISOC_MODULE_NAME)
else
MODULE_NAME := sprdwl_ng
endif

####add cflag######
EXTRA_CFLAGS += -DUWE5621_FTR
EXTRA_CFLAGS += -DIBSS_SUPPORT -DIBSS_RSN_SUPPORT
EXTRA_CFLAGS += -DNAN_SUPPORT
EXTRA_CFLAGS += -DRTT_SUPPORT
EXTRA_CFLAGS += -DACS_SUPPORT -DRX_HW_CSUM
EXTRA_CFLAGS += -DWMMAC_WFA_CERTIFICATION
EXTRA_CFLAGS += -DCOMPAT_SAMPILE_CODE
EXTRA_CFLAGS += -DRND_MAC_SUPPORT
EXTRA_CFLAGS += -DATCMD_ASSERT
EXTRA_CFLAGS += -DTCPACK_DELAY_SUPPORT
ifneq ($(TARGET_BUILD_VARIANT),user)
EXTRA_CFLAGS += -DWL_CONFIG_DEBUG
endif
EXTRA_CFLAGS += -DSPLIT_STACK
EXTRA_CFLAGS += -DOTT_UWE
ifeq ($(UNISOC_STA_SOFTAP_SCC_MODE),y)
EXTRA_CFLAGS += -DSTA_SOFTAP_SCC_MODE
endif

ccflags-$(CONFIG_UNISOC_WIFI_PS) += -DUNISOC_WIFI_PS
EXTRA_CFLAGS += -DPPPOE_LLC_SUPPORT
EXTRA_CFLAGS += -DSYNC_DISCONNECT

#####module name ###
obj-m += $(MODULE_NAME).o

#######add .o file#####
$(MODULE_NAME)-objs += main.o cfg80211.o txrx.o cmdevt.o npi.o msg.o work.o vendor.o \
				  tcp_ack.o mm.o reorder.o wl_core.o tx_msg.o rx_msg.o \
				  wl_intf.o qos.o dbg_ini_util.o reg_domain.o
$(MODULE_NAME)-objs += defrag.o
$(MODULE_NAME)-objs += ibss.o
$(MODULE_NAME)-objs += nan.o
$(MODULE_NAME)-objs += tracer.o
$(MODULE_NAME)-objs += rf_marlin3.o
$(MODULE_NAME)-objs += rtt.o
$(MODULE_NAME)-objs += api_version.o
$(MODULE_NAME)-objs += rnd_mac_addr.o
$(MODULE_NAME)-objs += debug.o
#$(MODULE_NAME)-objs += 11h.o

#all: $(all_dependencies)
#driver: $(driver_dependencies)
#	@echo build driver
#	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KDIR) M=$(PWD) modules
#
#clean:
#	$(MAKE) -C $(KDIR) M=$(PWD) clean
#	$(RM) Module.markers
#	$(RM) modules.order
