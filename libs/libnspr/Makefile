#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nspr
PKG_VERSION:=4.18
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://releases.mozilla.org/pub/$(PKG_NAME)/releases/v$(PKG_VERSION)/src/
PKG_MD5SUM:=2a558f9aeb109bfb16d78bdc42033a1e
PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
	
PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

PKG_BUILD_DEPENDS:=libnspr/host

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

TAR_OPTIONS+= $(PKG_NAME)-$(PKG_VERSION)/$(PKG_NAME) --strip-components 2
TAR_CMD=$(HOST_TAR) -C $(1) $(TAR_OPTIONS)

CONFIGURE_VARS+=CROSS_COMPILE=1
CONFIGURE_ARGS+= --disable-debug --enable-optimize
HOST_CONFIGURE_ARGS+= --disable-debug --enable-optimize --enable-64bit

define Package/libnspr
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=Mozilla NSPR
	DEPENDS:=+libpthread
endef

define Package/libnspr/description
  Mozilla NSPR
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.a $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/nspr.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libnspr/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libnspr))
$(eval $(call HostBuild))
