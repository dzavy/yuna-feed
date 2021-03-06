#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luadbi
PKG_VERSION:=0.5plus
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_PROTO:=git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/dzavy/luadbi.git
PKG_SOURCE_VERSION:=8a736b9d3a0f544aeb2605ffdcf4d140ac5ea3bc

PKG_LICENSE_FILES:=COPYING

include $(INCLUDE_DIR)/package.mk

define Package/luadbi/Default
  SUBMENU:=Lua
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Lua SQL binding
  DEPENDS:=
endef

define Package/luadbi-common
$(call Package/luadbi/Default)
  TITLE+= common files
  DEPENDS+= +lua
  # For reasons unknown, if this line is made common, the generated
  # config file ends up wrong.  Put it here as that's basically right?
  PKG_MAINTAINER=Nathaniel Wesley Filardo <nwf@cs.jhu.edu>
endef

define Package/luadbi-mysql
$(call Package/luadbi/Default)
  TITLE+= for MySQL
  DEPENDS+= +luadbi-common +libmysqlclient
  VARIANT:=mysql
endef

define Package/luadbi-mysql/description
 This package contains the MySQL binding.
endef


define Package/luadbi-pgsql
$(call Package/luadbi/Default)
  TITLE+= for PostgreSQL
  DEPENDS+= +luadbi-common +libpq
  VARIANT:=postgres
endef

define Package/luadbi-pgsql/description
 This package contains the PostgreSQL binding.
endef


define Package/luadbi-sqlite3
$(call Package/luadbi/Default)
  TITLE+= for SQLite 3
  DEPENDS+= +luadbi-common +libsqlite3
  VARIANT:=sqlite3
endef

define Package/luadbi-sqlite3/description
 This package contains the SQLite 3 binding.
endef


TARGET_CFLAGS += $(FPIC) -std=gnu99
TARGET_CPPFLAGS += -DLUA_USE_LINUX
TARGET_LDFLAGS += -llua -lm

ifeq ($(BUILD_VARIANT),mysql)
  TARGET_CPPFLAGS += -I$(STAGING_DIR)/usr/include/mysql
  TARGET_LDFLAGS += -L$(STAGING_DIR)/usr/lib/mysql -lmysqlclient -lz
endif

ifeq ($(BUILD_VARIANT),postgres)
  TARGET_LDFLAGS += -lpq
endif

ifeq ($(BUILD_VARIANT),sqlite3)
  TARGET_LDFLAGS += -lsqlite3 -lpthread
endif

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS) -I. -shared" \
	COMMON_LDFLAGS="$(TARGET_LDFLAGS)" \
	$(BUILD_VARIANT)

define Package/Install/Default
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(CP) $(PKG_BUILD_DIR)/dbd$(BUILD_VARIANT).so $(1)/usr/lib/lua/
endef

Package/luadbi-mysql/install = $(Package/Install/Default)
Package/luadbi-pgsql/install = $(Package/Install/Default)
Package/luadbi-sqlite3/install = $(Package/Install/Default)

define Package/luadbi-common/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(CP) $(PKG_BUILD_DIR)/DBI.lua $(1)/usr/lib/lua/
endef

$(eval $(call BuildPackage,luadbi-common))
$(eval $(call BuildPackage,luadbi-mysql))
$(eval $(call BuildPackage,luadbi-pgsql))
$(eval $(call BuildPackage,luadbi-sqlite3))
