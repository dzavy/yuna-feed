#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(TOPDIR)/rules.mk

PKG_NAME:=yunapbx-zabbix
PKG_VERSION:=3.0.6
PKG_RELEASE:=1

PKG_SOURCE:=zabbix-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/zabbix
PKG_MD5SUM:=f7ab89d9b7b73f337c2bdd52d2cfab2d

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/yunapbx-zabbix
	SECTION:=admin
	CATEGORY:=Administration
	SUBMENU:=zabbix
	DEPENDS:=+libopenssl
	CONFLICTS:=zabbix-agentd
	USERID:=zabbix=53:zabbix=53
	TITLE:=YunaPBX Zabbix agent
endef

CONFIGURE_ARGS+= \
	--enable-agent \
	--disable-server \
	--disable-proxy \
	$(call autoconf_bool,CONFIG_IPV6,ipv6) \
	--disable-java \
	--with-openssl="$(STAGING_DIR)/usr"

MAKE_FLAGS += ARCH="linux"

define Package/yunapbx-zabbix/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/sbin

	$(INSTALL_CONF) ./files/zabbix_agentd.conf $(1)/etc/
	$(INSTALL_BIN) ./files/zabbix_agentd $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/zabbix_agentd $(1)/usr/sbin/
endef

define Package/yunapbx-zabbix/conffiles
/etc/zabbix_agentd.conf
endef

$(eval $(call BuildPackage,yunapbx-zabbix))
