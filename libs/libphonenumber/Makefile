#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libphonenumber
PKG_VERSION:=7.7.4
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/googlei18n/$(PKG_NAME)/archive/
PKG_INSTALL:=1

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_OPTIONS:=-DUSE_BOOST=OFF -DBUILD_GEOCODER=OFF
CMAKE_SOURCE_DIR:=$(PKG_BUILD_DIR)/cpp/

define Package/libphonenumber
	SECTION:=libs
	CATEGORY:=Libraries
	SUBMENU:=Telephony
	TITLE:=PhoneNumber library for C++
	DEPENDS:=+protobuf +icu
#	PKG_BUILD_DEPENDS:=+boost +boost-system +boost-thread
endef

define Package/libphonenumber/description
  Google's common C++ library for parsing, formatting, and validating international phone numbers.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(INSTALL_DIR) $(1)/usr/lib

	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Package/libphonenumber/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libphonenumber))
