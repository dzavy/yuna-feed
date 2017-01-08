#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yunapbx
PKG_VERSION:=2017-01-08
PKG_RELEASE:=1
PKG_REV:=7f8e2f0c1a83341ef540543ea786e43c545d6781

PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/dzavy/yunapbx.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DIR=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

define Package/yunapbx
	SECTION:=utils
	CATEGORY:=Utilities
	SUBMENU:=Telephony
	TITLE:=YunaPBX WebUI
	DEPENDS:=+php5 +php5-mod-mysqli +php5-mod-json +php5-mod-session +php5-mod-curl +php5-mod-fileinfo +madplay
endef

define Package/yunapbx/description
  Asterisk Web Management Interface
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/yunapbx/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DIR) $(1)/www
	$(INSTALL_DIR) $(1)/usr/share/yunapbx
	$(CP) $(PKG_BUILD_DIR)/admin $(1)/www/
	$(CP) $(PKG_BUILD_DIR)/config $(1)/www/
	$(CP) $(PKG_BUILD_DIR)/favicon.ico $(1)/www/
	$(CP) $(PKG_BUILD_DIR)/generator $(1)/www/
	$(CP) $(PKG_BUILD_DIR)/include $(1)/www/
	$(CP) $(PKG_BUILD_DIR)/index.php $(1)/www/
	$(CP) $(PKG_BUILD_DIR)/lib $(1)/www/
	$(CP) $(PKG_BUILD_DIR)/static $(1)/www/
	$(CP) $(PKG_BUILD_DIR)/user $(1)/www/
	$(CP) $(PKG_BUILD_DIR)/db $(1)/usr/share/yunapbx/
	$(LN) /www/config/yunapbx.php $(1)/etc/yunapbx.php
endef

$(eval $(call BuildPackage,yunapbx))
