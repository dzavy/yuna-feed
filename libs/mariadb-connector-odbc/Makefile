#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=mariadb-connector-odbc
PKG_VERSION:=3.1.2-ga-src
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://downloads.mariadb.org/f/connector-odbc-3.1.2/

PKG_HASH:=a581a627b5832f52ed44d23e98f1869832406033ebfe4bb0c732e25585a72b46
PKG_INSTALL:=1

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

EXTRA_CFLAGS:=-I$(STAGING_DIR)/usr/include/mysql
EXTRA_LDFLAGS:=-L$(STAGING_DIR)/usr/lib/mysql
CMAKE_OPTIONS:=-DMARIADB_LINK_DYNAMIC=1 -DODBC_INCLUDE_DIR=$(STAGING_DIR)/usr/include -DODBC_LIB_DIR=$(STAGING_DIR)/usr/lib

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/mariadb-connector-odbc
	SECTION:=libs
	CATEGORY:=Libraries
	SUBMENU:=database
	TITLE:=ODBC Connector for MariaDB/MySQL
	DEPENDS:=+libpthread +unixodbc +libmariadb +librt
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
