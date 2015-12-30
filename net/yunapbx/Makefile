include $(TOPDIR)/rules.mk

PKG_NAME:=yunapbx
PKG_VERSION:=0.1-alpha
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/dzavy/$(PKG_NAME)/archive/
PKG_INSTALL:=

include $(INCLUDE_DIR)/package.mk

define Package/yunapbx
	SECTION:=utils
	CATEGORY:=Utilities
	SUBMENU:=Telephony
	TITLE:=YunaPBX WebUI
	DEPENDS:=+php5-mod-mysqli +php5-mod-json +php5-mod-session +php5-fastcgi +usbutils +uci
endef

define Package/yunapbx/description
  ODBC Connector for MySQL
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/yunapbx/install
	$(INSTALL_DIR) $(1)/www
	cp -pR $(PKG_BUILD_DIR)/* $(1)/www/
endef

$(eval $(call BuildPackage,yunapbx))
