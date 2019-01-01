include $(TOPDIR)/rules.mk

PKG_NAME:=redis
PKG_VERSION:=5.0.3
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://download.redis.io/releases/
PKG_HASH:=e290b4ddf817b26254a74d5d564095b11f9cd20d8f165459efa53eb63cd93e02
PKG_INSTALL:=1

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

define Package/redis
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Redis is an in-memory data structure store
  DEPENDS:=+libpthread
  URL:=http://redis.io
endef

define Package/redis/description
Redis is an open source (BSD licensed), in-memory data structure store, used as a database, cache and message broker.
endef

MAKE_VARS = \
        CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS) $(TARGET_CPPFLAGS) $(EXTRA_CPPFLAGS)" \
        CXXFLAGS="$(TARGET_CXXFLAGS) $(EXTRA_CXXFLAGS) $(TARGET_CPPFLAGS) $(EXTRA_CPPFLAGS)" \
        LDFLAGS="$(TARGET_LDFLAGS) $(EXTRA_LDFLAGS)"


MAKE_FLAGS+= \
	MALLOC="libc" \
	USE_JEMALLOC="no" \
	PREFIX="$(PKG_INSTALL_DIR)/usr"

define Build/Configure
endef

define Build/Compile
	$(MAKE) -C "$(PKG_BUILD_DIR)/deps/hiredis" static $(MAKE_FLAGS) CFLAGS="$(TARGET_CPPFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
	$(MAKE) -C "$(PKG_BUILD_DIR)/deps/linenoise" $(MAKE_FLAGS) CFLAGS="$(TARGET_CPPFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
	$(MAKE) -C "$(PKG_BUILD_DIR)/deps/lua" posix $(MAKE_FLAGS) CFLAGS="$(TARGET_CPPFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" AR="${AR} ru"
	$(MAKE) -C "$(PKG_BUILD_DIR)/src/" $(MAKE_FLAGS) CFLAGS="$(TARGET_CPPFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
endef

define Package/redis/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/etc/init.d/

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/redis-cli $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/redis-server $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/redis-check-aof $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/redis-benchmark $(1)/usr/bin/
	$(INSTALL_BIN) ./files/redis.init $(1)/etc/init.d/redis
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/redis.conf $(1)/etc/
endef

define Package/redis/conffiles
/etc/redis.conf
endef

$(eval $(call BuildPackage,redis))
