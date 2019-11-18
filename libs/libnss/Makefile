#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nss
PKG_VERSION:=3.47
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://releases.mozilla.org/pub/security/$(PKG_NAME)/releases/NSS_3_47_RTM/src/
PKG_MD5SUM:=81e47f3c70c2c53f801ab39434c887fb
PKG_INSTALL:=1
	
PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

MAKE_PATH:=$(PKG_NAME)
MAKE_VARS+=OS_TARGET=Linux BUILD_OPT=1 NSS_USE_SYSTEM_SQLITE=1 CROSS_COMPILE=1 SQLITE_LIB_DIR=$(STAGING_DIR)/usr/lib NSPR_LIB_DIR=$(STAGING_DIR)/usr/lib NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr

define Package/libnss
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=Mozilla NSS
	DEPENDS:=+libnspr +libsqlite3 +zlib
endef

define Package/libnss/description
  Mozilla NSS
endef

define Build/Configure
endef

define Build/Compile
	$(call Build/Compile/Default, CCC="$(TARGET_CXX)" all)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/include/nss
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	cp -L $(PKG_BUILD_DIR)/dist/*.OBJ/lib/libfreebl3.so $(1)/usr/lib/
	cp -L $(PKG_BUILD_DIR)/dist/*.OBJ/lib/libfreeblpriv3.so $(1)/usr/lib/	
	cp -L $(PKG_BUILD_DIR)/dist/*.OBJ/lib/libnss3.so $(1)/usr/lib/
	cp -L $(PKG_BUILD_DIR)/dist/*.OBJ/lib/libnssdbm3.so $(1)/usr/lib/
	cp -L $(PKG_BUILD_DIR)/dist/*.OBJ/lib/libnssutil3.so $(1)/usr/lib/
	cp -L $(PKG_BUILD_DIR)/dist/*.OBJ/lib/libsmime3.so $(1)/usr/lib/
	cp -L $(PKG_BUILD_DIR)/dist/*.OBJ/lib/libsoftokn3.so $(1)/usr/lib/
	cp -L $(PKG_BUILD_DIR)/dist/*.OBJ/lib/libssl3.so $(1)/usr/lib/
	cp -L $(PKG_BUILD_DIR)/dist/public/nss/*.h $(1)/usr/include/nss/
	$(CP) ./files/nss.pc $(1)/usr/lib/pkgconfig
endef

define Package/libnss/install
	$(INSTALL_DIR) $(1)/usr/lib
	cp -L $(PKG_BUILD_DIR)/dist/*.OBJ/lib/libfreebl3.so $(1)/usr/lib/
	cp -L $(PKG_BUILD_DIR)/dist/*.OBJ/lib/libfreeblpriv3.so $(1)/usr/lib/
	cp -L $(PKG_BUILD_DIR)/dist/*.OBJ/lib/libnss3.so $(1)/usr/lib/
	cp -L $(PKG_BUILD_DIR)/dist/*.OBJ/lib/libnssdbm3.so $(1)/usr/lib/
	cp -L $(PKG_BUILD_DIR)/dist/*.OBJ/lib/libnssutil3.so $(1)/usr/lib/
	cp -L $(PKG_BUILD_DIR)/dist/*.OBJ/lib/libsmime3.so $(1)/usr/lib/
	cp -L $(PKG_BUILD_DIR)/dist/*.OBJ/lib/libsoftokn3.so $(1)/usr/lib/
	cp -L $(PKG_BUILD_DIR)/dist/*.OBJ/lib/libssl3.so $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libnss))
