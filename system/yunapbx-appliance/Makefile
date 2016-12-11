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
	DEPENDS:=+haproxy +lighttpd +lighttpd-mod-cgi +lighttpd-mod-extforward +luadbi-mysql +mysql-connector-odbc +mysql-server +openvpn-openssl +php5 +php5-cgi +php5-cli +prosody +sscep +yunapbx +zabbix-agent-tls
	DEPENDS+=+asterisk13 +asterisk13-app-confbridge +asterisk13-app-mixmonitor +asterisk13-app-queue +asterisk13-cdr +asterisk13-chan-dongle +asterisk13-codec-a-mu +asterisk13-codec-adpcm +asterisk13-codec-alaw +asterisk13-codec-g722 +asterisk13-codec-g726 +asterisk13-codec-g729 +asterisk13-codec-gsm +asterisk13-codec-ilbc +asterisk13-codec-lpc10 +asterisk13-codec-resample +asterisk13-format-gsm +asterisk13-format-wav +asterisk13-format-wav-gsm +asterisk13-func-db +asterisk13-func-extstate +asterisk13-func-presencestate +asterisk13-odbc +asterisk13-res-agi +asterisk13-res-http-websocket +asterisk13-res-monitor +asterisk13-res-musiconhold +asterisk13-res-srtp +asterisk13-res-timing-timerfd +asterisk13-res-xmpp +asterisk13-sounds +asterisk13-voicemail
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
    