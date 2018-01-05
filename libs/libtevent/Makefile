#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tevent
PKG_VERSION:=0.9.34
MAJOR_VERSION:=0
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL:=https://www.samba.org/ftp/$(PKG_NAME)/
PKG_MD5SUM:=8df1ae19fd991b82abe66889da0651b0
PKG_INSTALL:=1
	
PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

define Package/libtevent
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=Samba libtevent
	DEPENDS:=+libopenssl
endef

define Package/libtevent/description
  Tevent is an event system based on the talloc memory management library. It is the core event system used in Samba.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/bin/default/libtevent.so $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/*.h $(1)/usr/include/
endef

define Package/libtevent/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/bin/default/libtevent.so $(1)/usr/lib/libtevent.so.$(PKG_VERSION)
	(cd $(1)/usr/lib; ln -sf libtevent.so.$(PKG_VERSION) libtalloc.so)
	(cd $(1)/usr/lib; ln -sf libtevent.so.$(PKG_VERSION) libtalloc.so.$(MAJOR_VERSION))
endef

$(eval $(call BuildPackage,libtevent))
