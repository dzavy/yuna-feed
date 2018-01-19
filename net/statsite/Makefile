include $(TOPDIR)/rules.mk

PKG_NAME:=statsite
PKG_VERSION:=0.8.1-20170725
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL=https://github.com/statsite/statsite.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=76a368572b51703af36eb97208b262b80321e9d0
PKG_SOURCE_PROTO:=git

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

PKG_FIXUP:=autoreconf
CMAKE_INSTALL:=1

define Package/statsite
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Statsite is a metrics aggregation server
endef

define Package/statsite/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/etc/init.d/

	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/statsite $(1)/usr/bin/
	$(INSTALL_BIN) ./files/statsite.init $(1)/etc/init.d/statsite
	$(INSTALL_CONF) ./files/statsite.conf $(1)/etc/
endef

define Package/statsite/conffiles
/etc/statsite.conf
endef

$(eval $(call BuildPackage,statsite))
