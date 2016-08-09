#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yunapbx-appliance
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL:=

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

define Package/yunapbx-appliance
	SECTION:=utils
	CATEGORY:=Utilities
	SUBMENU:=Telephony
	TITLE:=YunaPBX Appliance
	DEPENDS:=+yunapbx +lighttpd +lighttpd-mod-cgi +php5-cgi +php5-cli +php5-mod-openssl +mysql-server +haproxy +prosody +luadbi-mysql +openssl-util +curl +lame +zabbix-agentd +tune2fs +fdisk +partx-utils +sudo +kmod-ipv6 +kmod-usb-hid +kmod-fs-cifs +kmod-fs-msdos +kmod-fuse +@OPENSSL_WITH_EC +@OPENSSL_WITH_EC2M +@OPENSSL_ENGINE_CRYPTO +@OPENSSL_ENGINE_DIGEST +@GNUTLS_CRYPTODEV +@LIBCURL_OPENSSL +@BUSYBOX_CONFIG_LOGIN +@BUSYBOX_CONFIG_FEATURE_UTMP +@BUSYBOX_CONFIG_WHO
endef

define Package/yunapbx-appliance/description
  YunaPBX Appliance
endef

define Build/Prepare
	ln -s -n -f `pwd`/image_files $(TOPDIR)/files
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/yunapbx-appliance/install
	$(INSTALL_DIR) $(1)/etc/crontabs
	$(INSTALL_DIR) $(1)/etc/rc.d
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_CONF) ./package_files/etc/crontabs/* $(1)/etc/crontabs/
	$(INSTALL_BIN) ./package_files/etc/rc.d/* $(1)/etc/rc.d/
	$(INSTALL_BIN) ./package_files/usr/sbin/* $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,yunapbx-appliance))
