#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk16-codec-silk
PKG_VERSION:=1.0.3
PKG_RELEASE:=1

PKG_SOURCE:=codec_silk-16.0_$(PKG_VERSION)-x86_32.tar.gz
PKG_SOURCE_URL:=http://downloads.digium.com/pub/telephony/codec_silk/asterisk-16.0/x86-32/
PKG_MD5SUM:=b6e894287dbd0e3ede53c2f1682c15a5

PKG_BUILD_DIR=$(BUILD_DIR)/codec_silk-16.0_$(PKG_VERSION)-x86_32
PKG_INSTALL:=

include $(INCLUDE_DIR)/package.mk

define Package/asterisk16-codec-silk
  SUBMENU:=Telephony
  SECTION:=net
  CATEGORY:=Network
  TITLE:=SILK codec for Asterisk open source PBX
  URL:=http://www.digium.com
  DEPENDS:= @TARGET_x86_generic @USE_GLIBC asterisk16 +asterisk16-res-format-attr-silk
endef

define Package/asterisk16-codec-silk/description
 Codec SILK module for Asterisk
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/asterisk16-codec-silk/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules/
	$(CP) $(PKG_BUILD_DIR)/codec_silk.so $(1)/usr/lib/asterisk/modules/
endef

$(eval $(call BuildPackage,asterisk16-codec-silk))
