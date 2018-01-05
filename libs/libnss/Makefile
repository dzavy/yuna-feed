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

TAR_OPTIONS+= $(PKG_NAME)-$(PKG_VERSION)/$(PKG_NAME) --strip-components 2
TAR_CMD=$(HOST_TAR) -C $(1) $(TAR_OPTIONS)

MAKE_VARS+=OS_TARGET=Linux CROSS_COMPILE=1 NSPR_LIB_DIR=$(STAGING_DIR)/usr/lib NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr

define Package/libnss
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=Mozilla NSS
	DEPENDS:=+libnspr
endef

define Package/libnss/description
  Mozilla NSS
endef

define Build/Configure
endef

define Build/Compile
	$(call Build/Compile/Default, all latest)
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
