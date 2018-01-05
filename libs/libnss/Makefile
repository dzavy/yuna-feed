#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nss
PKG_VERSION:=3.34.1
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://releases.mozilla.org/pub/security/$(PKG_NAME)/releases/NSS_3_34_1_RTM/src/
PKG_MD5SUM:=5922468bb1c54e4c8067f153fcf467e5
PKG_INSTALL:=1
	
PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

define Package/libnssr
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=Mozilla NSS
	DEPENDS:=+libnspr
endef

define Package/libnss/description
  Mozilla NSS
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
endef

define Package/libnss/install
	$(INSTALL_DIR) $(1)/usr/lib
endef

$(eval $(call BuildPackage,libnss))
