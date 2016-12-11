#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yunapbx-appliance
PKG_VERSION:=0.2
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL:=

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

define Package/yunapbx-appliance
	SECTION:=base
	CATEGORY:=Base system
	TITLE:=YunaPBX Appliance
	KCONFIG:=CONFIG_DMI=y CONFIG_DMIID=y CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=y CONFIG_DMI_SYSFS=y CONFIG_HIGHMEM64G=y CONFIG_X86_32_SMP=y CONFIG_SMP=y 
	DEPENDS:=+haproxy +lighttpd +lighttpd-mod-cgi +lighttpd-mod-extforward +luadbi-mysql +mysql-connector-odbc +mysql-server +openvpn-openssl +php5 +php5-cgi +php5-cli +prosody +sscep +yunapbx +yunapbx-zabbix
	DEPENDS+=+asterisk11 +asterisk11-app-confbridge +asterisk11-app-mixmonitor +asterisk11-app-queue +asterisk11-cdr +asterisk11-chan-dongle +asterisk11-chan-motif +asterisk11-codec-a-mu +asterisk11-codec-adpcm +asterisk11-codec-alaw +asterisk11-codec-g722 +asterisk11-codec-g726 +asterisk11-codec-gsm +asterisk11-codec-ilbc +asterisk11-codec-lpc10 +asterisk11-codec-resample +asterisk11-format-gsm +asterisk11-format-wav +asterisk11-format-wav-gsm +asterisk11-func-db +asterisk11-func-extstate +asterisk11-func-presencestate +asterisk11-odbc +asterisk11-res-agi +asterisk11-res-monitor +asterisk11-res-musiconhold +asterisk11-res-srtp +asterisk11-res-timing-timerfd +asterisk11-res-xmpp +asterisk11-sounds +asterisk11-voicemail
	DEPENDS+=+base-files +block-mount +busybox +ca-certificates +curl +dropbear +fdisk +fstools +lame +odhcp6c +openssl-util +partx-utils +sudo +tcpdump +tune2fs +uci +usbutils +yunapbx-logd +zoneinfo-core
	DEPENDS+=+kmod-8139too +kmod-button-hotplug +TARGET_x86_generic:kmod-cpufreq-acpi +TARGET_x86_generic:kmod-cpufreq-powersaver +TARGET_x86_geode:kmod-crypto-hw-geode +TARGET_x86_generic:kmod-crypto-hw-padlock +kmod-crypto-sha1 +kmod-e1000 +kmod-fs-cifs +kmod-fs-msdos +kmod-fuse +kmod-hwmon-core +TARGET_x86_generic:kmod-hwmon-coretemp +TARGET_x86_generic:kmod-hwmon-k10temp +TARGET_x86_generic:kmod-hwmon-via-cputemp +kmod-r8169 +kmod-tg3 +kmod-usb-hid +kmod-usb2 +kmod-usb2-pci +kmod-usb3
	DEPENDS+=+@USE_GLIBC +@OPENSSL_WITH_EC +@OPENSSL_WITH_EC2M +@OPENSSL_ENGINE_CRYPTO +@OPENSSL_ENGINE_DIGEST +@GNUTLS_CRYPTODEV +@LIBCURL_OPENSSL +@BUSYBOX_CUSTOM +@BUSYBOX_CONFIG_LOGIN
endef

define Package/yunapbx-appliance/description
  YunaPBX Appliance
endef

define Build/Prepare
	ln -s -n -f `pwd`/image_files $(TOPDIR)/files
	ln -s -n -f `pwd`/package_files/yunapbx-appliance.mk $(TOPDIR)/package/kernel/linux/modules/yunapbx-appliance.mk
	touch $(TOPDIR)/package/kernel/linux/Makefile
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/yunapbx-appliance/install
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/rc.d
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./package_files/etc/hotplug.d/iface/* $(1)/etc/hotplug.d/iface/
	$(INSTALL_BIN) ./package_files/etc/init.d/* $(1)/etc/init.d/
	$(INSTALL_BIN) ./package_files/etc/rc.d/* $(1)/etc/rc.d/
	$(INSTALL_BIN) ./package_files/usr/sbin/* $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,yunapbx-appliance))
    