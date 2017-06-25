#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk-phonenumber
PKG_VERSION:=0.1.0
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/certnanny/$(PKG_NAME)/archive/
PKG_INSTALL:=

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

define Package/sscep
	SECTION:=utils
	CATEGORY:=Utilities
	SUBMENU:=SSL
	TITLE:=Simple SCEP client
	DEPENDS:=+libopenssl
endef

define Package/sscep/description
  SSCEP is a client-only implementation of the SCEP (Cisco System's Simple Certificate Enrollment Protocol).
endef

define Build/Configure
endef

define Build/Compile
	(cd $(PKG_BUILD_DIR); \
		$(TARGET_CC) $(TARGET_CFLAGS) -DASTERISK_VERSION_NUM=110000 -D_XOPEN_SOURCE=600 $(TARGET_CPPFLAGS) -I$(STAGING_DIR)/usr/include/asterisk-11/include -DHAVE_CONFIG_H -I. -fPIC" \      -lcrypto -Wall $(TARGET_LDFLAGS) -I$(STAGING_DIR)/usr/include/openssl -o sscep sscep.c init.c net.c sceputils.c pkcs7.c ias.c fileutils.c configuration.c engine.c \
	)
endef

define Package/sscep/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/sscep $(1)/usr/bin/
	$(CP) ./files/sscep.conf $(1)/etc/
endef

$(eval $(call BuildPackage,sscep))

