#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=acme-php
PKG_VERSION:=0.2.11
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=acme-client.phar
PKG_SOURCE_URL:=https://github.com/kelunik/$(PKG_NAME)/releases/download/v$(PKG_VERSION)
PKG_INSTALL:=

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

define Package/acme-php
	SECTION:=utils
	CATEGORY:=Utilities
	SUBMENU:=SSL
	TITLE:=ACME Client written in PHP
	DEPENDS:=+php7 +php7-cli +php7-mod-dom +php7-mod-phar +php7-mod-openssl
endef

define Package/acme-php/description
  ACME/letsencrypt CLI Interface written in PHP
endef

define Build/Prepare
	$(CP) $(DL_DIR)/$(PKG_SOURCE) $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/acme-php/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/acme-client.phar $(1)/usr/bin/acme-client
	$(LN) /usr/bin/php-cli $(1)/usr/bin/php
endef

$(eval $(call BuildPackage,acme-php))
