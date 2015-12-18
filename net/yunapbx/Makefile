include $(TOPDIR)/rules.mk

PKG_NAME:=yunapbx
PKG_VERSION:=2015-12-18
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/dzavy/yunapbx.git
PKG_SOURCE:=$(PKG_NAME).tar.gz
PKG_SOURCE_VERSION:=HEAD
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)


include $(INCLUDE_DIR)/package.mk

define Package/yunapbx-webui
	SECTION:=utils
	CATEGORY:=Utilities
	SUBMENU:=Telephony
	TITLE:=YunaPBX WebUI
	DEPENDS:=+php5-mod-mysqli +php5-mod-json +php5-mod-session +php5-fastcgi +usbutils +uci
endef

define Package/yunapbx-webui/description
  ODBC Connector for MySQL
endef

define Package/yunapbx-webui/install
	$(INSTALL_DIR) $(1)/www
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/admin $(1)/www/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/include $(1)/www/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lib $(1)/www/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/static $(1)/www/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/user $(1)/www/
endef

$(eval $(call BuildPackage,mysql-connector-yunapbx-webui