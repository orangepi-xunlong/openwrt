#
# Copyright (C) 2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rtw88-usb
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2023-02-11
PKG_SOURCE_URL:=https://github.com/lwfinger/rtw88.git
PKG_SOURCE_VERSION:=e0a167edc28ccfecfa4711f56a114e1f2a2cc60e
PKG_MIRROR_HASH:=623edb9dbb09bee3b7b8d2ce9a025138c3642dfa7234eea1e62ee5c275fe9d29
PKG_BUILD_PARALLEL:=1

STAMP_CONFIGURED_DEPENDS := $(STAGING_DIR)/usr/include/mac80211-backport/backport/autoconf.h

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk