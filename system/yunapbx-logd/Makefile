#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yunapbx-logd
PKG_VERSION:=2016-07-19
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
CMAKE_INSTALL:=1

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>
	
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

TARGET_LDFLAGS += $(if $(CONFIG_USE_GLIBC),-lrt)

define Package/yunapbx-logd
  SECTION:=base
  CATEGORY:=Base system
  DEPENDS:=+libubox +libubus +libblobmsg-json +USE_GLIBC:librt
  TITLE:=OpenWrt system log implementation
endef

define Build/Download
endef

define Build/Prepare
	$(CP) ./src/* $(PKG_BUILD_DIR)
endef

define Package/yunapbx-logd/install
	$(INSTALL_DIR) $(1)/sbin $(1)/etc/init.d/

	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/{logd,logread} $(1)/sbin/
	$(INSTALL_BIN) ./files/log.init $(1)/etc/init.d/log
endef

$(eval $(call BuildPackage,yunapbx-logd))
