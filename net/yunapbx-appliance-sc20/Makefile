#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yunapbx-appliance-sc20
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL:=

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>
	
include $(INCLUDE_DIR)/package.mk

define Package/yunapbx-appliance-sc20
	SECTION:=utils
	CATEGORY:=Utilities
	SUBMENU:=Telephony
	TITLE:=YunaPBX for Cranberry SC20
	DEPENDS:=+yunapbx-appliance +kmod-crypto-hw-geode +kmod-8139too +kmod-button-hotplug +kmod-acpi-button
endef

define Package/yunapbx-appliance-sc20/description
  YunaPBX Appliance for Cranberry SC20
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/yunapbx-appliance-sc20/install
endef


$(eval $(call BuildPackage,yunapbx-appliance-sc20))
