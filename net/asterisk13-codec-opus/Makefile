#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk13-codec-opus
PKG_VERSION:=1.0.1
PKG_RELEASE:=1

PKG_SOURCE:=codec_opus-13.0_$(PKG_VERSION)-x86_32.tar.bz2
PKG_SOURCE_URL:=http://downloads.digium.com/pub/telephony/codec_opus/asterisk-13.0/x86-32/
PKG_MD5SUM:=b65a9c8ba234e5bf9abf7a70f94589ae

PKG_BUILD_DIR=$(BUILD_DIR)/codec_opus-13.0_$(PKG_VERSION)-x86_32
PKG_INSTALL:=

include $(INCLUDE_DIR)/package.mk

define Package/asterisk13-codec-opus
  SUBMENU:=Telephony
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Opus codec for Asterisk open source PBX
  URL:=http://www.digium.com
  DEPENDS:= @TARGET_x86 asterisk13 +asterisk13-curl +libopus
endef

define Package/asterisk13-codec-opus/description
 Asterisk Opus codec based on bcg729 implementation.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/asterisk13-codec-opus/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules/
	$(CP) $(PKG_BUILD_DIR)/format_ogg_opus.so $(1)/usr/lib/asterisk/modules/
	$(CP) $(PKG_BUILD_DIR)/codec_opus.so $(1)/usr/lib/asterisk/modules/
endef

$(eval $(call BuildPackage,asterisk13-codec-opus))
