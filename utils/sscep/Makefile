include $(TOPDIR)/rules.mk

PKG_NAME:=sscep
PKG_VERSION:=0.6.1
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/certnanny/$(PKG_NAME)/archive/
PKG_INSTALL:=

include $(INCLUDE_DIR)/package.mk

define Package/sscep
	SECTION:=utils
	CATEGORY:=Utilities
	SUBMENU:=SSL
	TITLE:=Simple SCEP client
	DEPENDS:=+openssl
endef

define Package/sscep/description
  SSCEP is a client-only implementation of the SCEP (Cisco System's Simple Certificate Enrollment Protocol).
endef

define Build/Configure
endef

define Build/Compile
	(cd $(PKG_BUILD_DIR); \
		$(HOSTCC) -Wall -I$(STAGING_DIR)/usr/include/openssl -lcrypto -o sscep sscep.o init.o net.o sceputils.o pkcs7.o ias.o fileutils.o configuration.o engine.o
	)
endef

define Package/sscep/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/sscep $(1)/usr/bin/
endef

$(eval $(call BuildPackage,sscep))
