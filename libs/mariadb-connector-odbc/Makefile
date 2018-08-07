#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mariadb-connector-odbc
PKG_VERSION:=3.0.6-ga-src
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://downloads.mariadb.org/f/connector-odbc-3.0.6/
PKG_HASH:=1b45b801774ea356f56ca7eb5dc5d58df8c0e61893c9f9901c4d716e34d5d71d
PKG_INSTALL:=1

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

EXTRA_CFLAGS:=-I$(STAGING_DIR)/usr/include/mysql
EXTRA_LDFLAGS:=-lpthread -L$(STAGING_DIR)/usr/lib/mysql
CMAKE_OPTIONS:=-DMARIADB_LINK_DYNAMIC=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/mariadb-connector-odbc
	SECTION:=libs
	CATEGORY:=Libraries
	SUBMENU:=database
	TITLE:=ODBC Connector for MariaDB/MySQL
	DEPENDS:=+libpthread +unixodbc +libmysqlclient-r +librt
	PROVIDES:=mysql-connector-odbc
endef

define Package/mariadb-connector-odbc/description
  ODBC Connector for MariaDB/MySQL
endef

define Package/mariadb-connector-odbc/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/etc/odbcinst.ini.d/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmaodbc.so $(1)/usr/lib/
	$(CP) ./files/mysql.ini $(1)/etc/odbcinst.ini.d/
endef

$(eval $(call BuildPackage,mariadb-connector-odbc))
