#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=vmware-uag
PKG_VERSION:=2.9.0
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL:=

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

define Package/vmware-uag
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Web Servers/Proxies
	TITLE:=VMware Unified Access Gateway
	DEPENDS:=+jamvm +libopenssl +libstdcpp +node +python
endef

define Package/vmware-uag/description
  VMware Unified Access Gateway
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/vmware-uag/install
	$(INSTALL_DIR) $(1)/opt/vmware/gateway/bin
	$(INSTALL_DIR) $(1)/usr/lib
	$(LN) /usr/bin/node $(1)/opt/vmware/gateway/bin/node
	$(LN) /usr/lib/libssl.so.1.0.0 $(1)/usr/lib/libssl.so.1.0.2
	$(LN) /usr/lib/libcrypto.so.1.0.0 $(1)/usr/lib/libcrypto.so.1.0.2
endef

$(eval $(call BuildPackage,vmware-uag))
    
