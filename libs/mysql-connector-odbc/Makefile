include $(TOPDIR)/rules.mk

PKG_NAME:=mysql-connector-odbc
PKG_VERSION:=5.1.13-src
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://dev.mysql.com/get/Downloads/Connector-ODBC/5.1/
PKG_INSTALL:=1

EXTRA_CFLAGS:=-lpthread
CMAKE_OPTIONS:=-DWITH_UNIXODBC=1 -DMYSQL_INCLUDE_DIR=$(STAGING_DIR)/usr/include/mysql -DODBC_INCLUDES=$(STAGING_DIR)/usr/include -DMYSQLCLIENT_LIB_NAME=libmysqlclient_r.so.16 -DMYSQL_LIB_DIR=$(STAGING_DIR)/usr/lib -DODBC_LIB_DIR=$(STAGING_DIR)/usr/lib

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/mysql-connector-odbc
        SECTION:=libs
        CATEGORY:=Libraries
        SUBMENU:=database
        TITLE:=ODBC Connector for MySQL
        DEPENDS:=+libpthread +unixodbc +libmysqlclient-r +librt
endef

define Package/mysql-connector-odbc/description
  ODBC Connector for MySQL
endef

define Package/mysql-connector-odbc/install
        $(INSTALL_DIR) $(1)/usr/lib
        $(INSTALL_BIN) $(PKG_BUILD_DIR)/lib/libmyodbc5.so $(1)/usr/lib/
endef

$(eval $(call BuildPackage,mysql-connector-odbc))
