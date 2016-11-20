#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yunapbx
PKG_VERSION:=2016-11-20
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

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

define Build/Download
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/yunapbx/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DIR) $(1)/www
	$(INSTALL_DIR) $(1)/usr/share/yunapbx
	$(LN) /www/config/yunapbx.php $(1)/etc/yunapbx.php
	$(CP) ./src/admin $(1)/www/
	$(CP) ./src/config $(1)/www/
	$(CP) ./src/favicon.ico $(1)/www/
	$(CP) ./src/generator $(1)/www/
	$(CP) ./src/include $(1)/www/
	$(CP) ./src/index.php $(1)/www/
	$(CP) ./src/lib $(1)/www/
	$(CP) ./src/static $(1)/www/
	$(CP) ./src/user $(1)/www/
	$(CP) ./src/db $(1)/usr/share/yunapbx/
endef

$(eval $(call BuildPackage,yunapbx))
