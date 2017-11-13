#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=chan-dongle
PKG_VERSION:=1.1r47
PKG_REV:=2a5a097b27e49ebf291cdf91e9f60cdf0df3627c
PKG_RELEASE:=1

PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/wdoekes/asterisk-chan-dongle.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DIR=$(BUILD_DIR)/$(PKG_SOURCE_SUBDIR)

PKG_FIXUP:=autoreconf

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=COPYRIGHT.txt LICENSE.txt
PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

define Package/chan-dongle/Default
  SUBMENU:=Telephony
  SECTION:=net
  CATEGORY:=Network
  URL:=https://code.google.com/p/asterisk-chan-dongle/
  DEPENDS:=+libiconv-full +kmod-usb-acm +kmod-usb-serial +kmod-usb-serial-option +libusb-1.0 +usb-modeswitch
  TITLE:=Huawei UMTS 3G dongle support
endef

define Package/asterisk13-chan-dongle
$(call Package/chan-dongle/Default)
  DEPENDS+= asterisk13
  VARIANT:=asterisk13
endef

define Package/description/Default
 Asterisk channel driver for Huawei UMTS 3G dongle.
endef

Package/asterisk13-chan-dongle/description = $(Package/description/Default)

CONFIGURE_VARS += \
	ac_cv_type_size_t=yes \
	ac_cv_type_ssize_t=yes \
	DESTDIR="$(PKG_INSTALL_DIR)/usr/lib/asterisk/modules"

MAKE_ARGS:= \
	CC="$(TARGET_CC)" \
	LD="$(TARGET_CC)" \
	LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib/libiconv-full/lib -liconv"

ifeq ($(BUILD_VARIANT),asterisk13)
  CONFIGURE_ARGS += --with-astversion=130000 --with-asterisk=$(STAGING_DIR)/usr/include/asterisk-13/include
  MAKE_ARGS += CFLAGS="$(TARGET_CFLAGS) -DASTERISK_VERSION_NUM=130000 -DLOW_MEMORY -D_GNU_SOURCE -D_XOPEN_SOURCE=600 $(TARGET_CPPFLAGS) -I$(STAGING_DIR)/usr/lib/libiconv-full/include -I$(STAGING_DIR)/usr/include/asterisk-13/include -DHAVE_CONFIG_H -I. -fPIC"
endif

define Package/conffiles/Default
/etc/asterisk/dongle.conf
endef

Package/asterisk13-chan-dongle/conffiles = $(Package/conffiles/Default)

define Build/Compile
	mkdir -p $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules
	$(MAKE) -C "$(PKG_BUILD_DIR)" $(MAKE_ARGS) all install
endef

define Package/Install/Default
	$(INSTALL_DIR) $(1)/etc/asterisk
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/etc/dongle.conf $(1)/etc/asterisk/
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/asterisk/modules/chan_dongle.so $(1)/usr/lib/asterisk/modules/
endef

Package/asterisk13-chan-dongle/install = $(Package/Install/Default)

$(eval $(call BuildPackage,asterisk13-chan-dongle))
