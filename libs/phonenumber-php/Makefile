#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libphonenumber-for-php
PKG_VERSION:=7.3.1
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/giggsey/$(PKG_NAME)/archive/
PKG_INSTALL:=

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

define Package/phonenumber-php
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=PhoneNumber library for PHP
	DEPENDS:=+php5-mod-mbstring
endef

define Package/phonenumber-php/description
  Google's common PHP library for parsing, formatting, and validating international phone numbers.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/phonenumber-php/install
	cp -pR $(PKG_BUILD_DIR)/src/libphonenumber $(1)/usr/share/
endef

$(eval $(call BuildPackage,phonenumber-php))
