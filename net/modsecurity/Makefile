#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=modsecurity
PKG_VERSION:=2.9.1
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://www.modsecurity.org/tarball/$(PKG_VERSION)/
PKG_MD5SUM:=0fa92b852abc857a20b9e24f83f814cf
PKG_INSTALL:=1

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

CONFIGURE_ARGS+= \
	--with-apxs="$(STAGING_DIR)/usr/bin/apxs" \
	--with-apr="$(STAGING_DIR)/usr/bin/apr-1-config" \
	--with-apu="$(STAGING_DIR)/usr/bin/apu-1-config" \
	--with-pcre="$(STAGING_DIR)/usr/bin/pcre-config" \
	--with-libxml="$(STAGING_DIR)/host/bin/xml2-config" \
	--without-curl \
	--without-lua \
	--disable-mlogc

define Package/modsecurity
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=ModSecurity Module for Apache Web Server
  DEPENDS +=+apache +libapr +libaprutil +libpcre +libopenssl +libxml2
  URL:=https://modsecurity.org/
endef

define Package/modsecurity/description
  ModSecurity is an open source, cross-platform web application firewall (WAF) module
endef

define Package/modsecurity/install
	$(INSTALL_DIR) $(1)/usr/lib/apache/modules
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/apache/modules/mod_security2.so $(1)/usr/lib/apache/modules
	$(INSTALL_DIR) $(1)/etc/apache
	$(CP) ./files/mod_security.conf $(1)/etc/apache
	$(INSTALL_DIR) $(1)/etc/apache/modsecurity.d/activated_rules
endef

$(eval $(call BuildPackage,modsecurity))
