#
# Copyright (C) 2008-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=vorbis-tools
PKG_VERSION:=1.4.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.xiph.org/releases/vorbis/
PKG_MD5SUM:=567e0fb8d321b2cd7124f8208b8b90e6
PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=COPYING

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/vorbis-tools
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=vorbis-tools
  URL:=http://xiph.org/vorbis/
  DEPENDS:=+libvorbis +libogg +libao
endef

define Package/vorbis-tools/description
Vorbis is a general purpose audio and music encoding format
contemporary to MPEG-4's AAC and TwinVQ, the next generation beyond
MPEG audio layer 3. Unlike the MPEG sponsored formats (and other
proprietary formats such as RealAudio G2 and Windows' flavor of the
month), the Vorbis CODEC specification belongs to the public domain.
All the technical details are published and documented, and any
software entity may make full use of the format without license
fee, royalty or patent concerns.
endef

CONFIGURE_ARGS+= \
	--disable-oggtest --disable-vorbistest --disable-curltest --without-flac --disable-nls \

TARGET_CFLAGS += $(FPIC)

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/ogg123 \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
	$(MAKE) -C $(PKG_BUILD_DIR)/oggdec \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
	$(MAKE) -C $(PKG_BUILD_DIR)/oggenc \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
	$(MAKE) -C $(PKG_BUILD_DIR)/ogginfo \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
	$(MAKE) -C $(PKG_BUILD_DIR)/vcut \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
	$(MAKE) -C $(PKG_BUILD_DIR)/vorbiscomment \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		all install
endef

define Package/vorbis-tools/install
	$(INSTALL_DIR) $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,vorbis-tools))
