#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yunalbl-appliance
PKG_VERSION:=0.1
PKG_RELEASE:=3
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL:=

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

define Package/yunalbl-appliance
	SECTION:=base
	CATEGORY:=Base system
	TITLE:=YunaLBL Appliance
	DEPENDS:=+apache +haproxy +keepalived +modsecurity +zabbix-agentd
	DEPENDS+=+base-files +block-mount +busybox +ca-certificates +curl +dropbear +fdisk +fstools +logd +odhcp6c +openssl-util +partx-utils +rng-tools +strace +sudo +tcpdump +tune2fs +uci +usbutils +zoneinfo-core
	DEPENDS+=+kmod-8139too +kmod-button-hotplug +TARGET_x86_generic:kmod-cpufreq-acpi +TARGET_x86_generic:kmod-cpufreq-powersaver +TARGET_x86_geode:kmod-crypto-hw-geode +TARGET_x86_generic:kmod-crypto-hw-padlock +kmod-cryptodev +kmod-crypto-sha1 +kmod-e1000 +kmod-fs-cifs +kmod-fs-msdos +kmod-fuse +kmod-hwmon-core +TARGET_x86_generic:kmod-hwmon-coretemp +TARGET_x86_generic:kmod-hwmon-k10temp +TARGET_x86_generic:kmod-hwmon-via-cputemp +kmod-r8169 +kmod-tg3 +kmod-usb-hid +kmod-usb2 +kmod-usb2-pci +kmod-usb3
	DEPENDS+=+@USE_GLIBC +@OPENSSL_WITH_EC +@OPENSSL_WITH_EC2M +@OPENSSL_ENGINE_CRYPTO +@OPENSSL_ENGINE_DIGEST +@LIBCURL_OPENSSL +@BUSYBOX_CUSTOM +@BUSYBOX_CONFIG_LOGIN
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
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./package_files/usr/sbin/* $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,yunalbl-appliance))
    
