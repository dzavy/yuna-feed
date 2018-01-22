#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=certmonger
PKG_VERSION:=0.79.5
PKG_RELEASE:=4
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://releases.pagure.org/$(PKG_NAME)/
PKG_MD5SUM:=1c3106c88f282aa0cae026a20df1a00b
PKG_INSTALL:=1

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

CONFIGURE_ARGS+= --with-file-store-dir=/etc/certmonger

define Package/certmonger
	SECTION:=utils
	CATEGORY:=Utilities
	SUBMENU:=SSL
	TITLE:=Certificate enrollment deamon
	DEPENDS:=+libopenssl +libtevent +libtalloc +dbus +libopenldap +libnss +krb5-libs +xmlrpc-c-client +libxml2 +libidn +libpopt +libuuid
endef

define Package/certmonger/description
  certmonger is a service which attempts to simplify interaction with certifying authorities (CAs) on networks which use public-key infrastructure (PKI).
endef

define Package/certmonger/conffiles
/etc/certmonger/certmonger.conf
/etc/certmonger/cas/
/etc/certmonger/local/
/etc/certmonger/requests/
endef

define Package/certmonger/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/usr/share
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(CP) $(PKG_INSTALL_DIR)/etc/* $(1)/etc/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/* $(1)/usr/sbin/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/* $(1)/usr/share/
	$(INSTALL_BIN) ./files/certmonger.init $(1)/etc/init.d/certmonger
endef

$(eval $(call BuildPackage,certmonger))
