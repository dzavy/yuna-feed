#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk16-codec-opus
PKG_VERSION:=1.3.0
PKG_RELEASE:=1

PKG_SOURCE:=codec_opus-16.0_$(PKG_VERSION)-x86_32.tar.gz
PKG_SOURCE_URL:=http://downloads.digium.com/pub/telephony/codec_opus/asterisk-16.0/x86-32/
PKG_MD5SUM:=9f5a67ed24b613589b7cef6c34e1e518

PKG_BUILD_DIR=$(BUILD_DIR)/codec_opus-16.0_$(PKG_VERSION)-x86_32
PKG_INSTALL:=

include $(INCLUDE_DIR)/package.mk

define Package/asterisk16-codec-opus
  SUBMENU:=Telephony
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Opus codec for Asterisk open source PBX
  URL:=http://www.digium.com
  DEPENDS:= @TARGET_x86_generic @USE_GLIBC asterisk16 +asterisk16-curl +asterisk16-res-sorcery +asterisk16-res-format-attr-opus +libopus
endef

define Package/asterisk16-format-ogg-opus
  SUBMENU:=Telephony
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Ogg/Opus format for Asterisk open source PBX
  URL:=http://www.digium.com
  DEPENDS:= @TARGET_x86_generic @USE_GLIBC asterisk16 +asterisk16-curl +asterisk16-res-sorcery +asterisk16-res-format-attr-opus +libopus
endef

define Package/asterisk16-codec-opus/description
 Codec opus module for Asterisk.
endef

define Package/asterisk16-format-ogg-opus/description
 Format Ogg/Opus module for Asterisk.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/asterisk16-codec-opus/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules/
	$(CP) $(PKG_BUILD_DIR)/codec_opus.so $(1)/usr/lib/asterisk/modules/
endef

define Package/asterisk16-format-ogg-opus/install
	$(INSTALL_DIR) $(1)/usr/lib/asterisk/modules/
	$(CP) $(PKG_BUILD_DIR)/format_ogg_opus.so $(1)/usr/lib/asterisk/modules/
endef

$(eval $(call BuildPackage,asterisk16-codec-opus))
$(eval $(call BuildPackage,asterisk16-format-ogg-opus))
