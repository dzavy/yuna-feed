#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yunapbx
PKG_VERSION:=0.2-alpha
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/dzavy/$(PKG_NAME)/archive/
PKG_INSTALL:=

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

define Package/yunapbx
	SECTION:=utils
	CATEGORY:=Utilities
	SUBMENU:=Telephony
	TITLE:=YunaPBX WebUI
	DEPENDS:=+php5-mod-mysqli +php5-mod-json +php5-mod-session +php5-mod-curl +php5-mod-fileinfo +php5-mod-openssl +php5-fastcgi +php5-cli +usbutils +uci +mysql-connector-odbc +lighttpd +lighttpd-mod-fastcgi +lighttpd-mod-proxy +prosody +luadbi-mysql +mysql-server +openssl-util +curl +zoneinfo-core +madplay +lame +@OPENSSL_WITH_SSL3 +@OPENSSL_ENGINE_CRYPTO +@OPENSSL_ENGINE_DIGEST +@LIBCURL_OPENSSL +@LIGHTTPD_SSL +@GNUTLS_CRYPTODEV +@BUSYBOX_CONFIG_LOGIN +@BUSYBOX_CONFIG_WHO
endef

define Package/yunapbx/description
  Asterisk Web Management Interface
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/yunapbx/install
	$(INSTALL_DIR) $(1)/www
	$(INSTALL_DIR) $(1)/usr/share/yunapbx
	cp -pR $(PKG_BUILD_DIR)/admin $(1)/www/
	cp -pR $(PKG_BUILD_DIR)/favicon.ico $(1)/www/
	cp -pR $(PKG_BUILD_DIR)/generator $(1)/www/
	cp -pR $(PKG_BUILD_DIR)/include $(1)/www/
	cp -pR $(PKG_BUILD_DIR)/index.php $(1)/www/
	cp -pR $(PKG_BUILD_DIR)/lib $(1)/www/
	cp -pR $(PKG_BUILD_DIR)/static $(1)/www/
	cp -pR $(PKG_BUILD_DIR)/user $(1)/www/
	cp -pR $(PKG_BUILD_DIR)/sql $(1)/usr/share/yunapbx
endef

$(eval $(call BuildPackage,yunapbx))
