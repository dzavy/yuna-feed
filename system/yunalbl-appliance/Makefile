#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yunalbl-appliance
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL:=

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

define Package/yunalbl-appliance
	SECTION:=base
	CATEGORY:=Base system
	TITLE:=YunaLBL Appliance
	DEPENDS:=+apache +haproxy +keepalived +zabbix-agentd +@ZABBIX_SSL
	DEPENDS+=+base-files +block-mount +busybox +ca-certificates +dropbear +fdisk +fstools +logd +odhcp6c +partx-utils +rng-tools +tcpdump +tune2fs +uci +zoneinfo-core
	DEPENDS+=+kmod-8139too +kmod-button-hotplug +kmod-e1000 +kmod-r8169 +kmod-tg3 +kmod-usb-hid +kmod-usb2 +kmod-usb2-pci +kmod-usb3
	DEPENDS+=+@USE_GLIBC +@OPENSSL_WITH_EC +@OPENSSL_WITH_EC2M +@BUSYBOX_CUSTOM +@BUSYBOX_CONFIG_LOGIN
endef

define Package/yunalbl-appliance/description
  YunaLBL Appliance
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/yunalbl-appliance/install
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface
	$(INSTALL_DIR) $(1)/etc/rc.d
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./package_files/etc/hotplug.d/iface/* $(1)/etc/hotplug.d/iface/
	$(INSTALL_BIN) ./package_files/etc/rc.d/* $(1)/etc/rc.d/
	$(INSTALL_BIN) ./package_files/usr/sbin/* $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,yunalbl-appliance))
    