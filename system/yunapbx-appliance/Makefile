#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yunapbx-appliance
PKG_VERSION:=0.5
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL:=

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

define Package/yunapbx-appliance
	SECTION:=base
	CATEGORY:=Base system
	TITLE:=YunaPBX Appliance
	DEPENDS:=+certmonger +haproxy +libiksemel +lighttpd +lighttpd-mod-cgi +lighttpd-mod-extforward +openvpn-openssl +php7 +php7-cgi +php7-cli +prosody +yunapbx +zabbix-agentd +zabbix-sender
	DEPENDS+=+asterisk +asterisk-app-confbridge +asterisk-app-mixmonitor +asterisk-app-queue +asterisk-cdr +asterisk-chan-dongle +asterisk-chan-motif +asterisk-codec-a-mu +asterisk-codec-adpcm +asterisk-codec-alaw +asterisk-codec-g722 +asterisk-codec-g726 +asterisk-codec-gsm +asterisk-codec-ilbc +asterisk-codec-lpc10 +TARGET_x86_generic:asterisk-codec-opus +asterisk-codec-resample +TARGET_x86_generic:asterisk-codec-silk +asterisk-codec-speex +asterisk-codec-ulaw +asterisk-format-gsm +asterisk-format-wav +asterisk-format-wav-gsm +asterisk-func-base64 +asterisk-func-db +asterisk-func-devstate +asterisk-func-extstate +asterisk-func-periodic-hook +asterisk-func-presencestate +asterisk-odbc +asterisk-pjsip +asterisk-res-agi +asterisk-res-format-attr-h263 +asterisk-res-format-attr-h264 +asterisk-res-format-attr-vp8 +asterisk-res-http-websocket +asterisk-res-musiconhold +asterisk-res-rtp-asterisk +asterisk-res-srtp +asterisk-res-timing-timerfd +asterisk-sounds +asterisk-voicemail
	DEPENDS+=+base-files +block-mount +busybox +ca-certificates +curl +dropbear +fdisk +fstools +lame +logd +odhcp6c +openssl-util +partx-utils +rng-tools +strace +sudo +tcpdump +tune2fs +uci +usbutils +wget +zoneinfo-core
	DEPENDS+=+kmod-8139too +kmod-button-hotplug +TARGET_x86_generic:kmod-cpufreq-acpi +TARGET_x86_generic:kmod-cpufreq-powersaver +TARGET_x86_geode:kmod-crypto-hw-geode +TARGET_x86_generic:kmod-crypto-hw-padlock +kmod-cryptodev +kmod-crypto-sha1 +kmod-e1000 +kmod-fs-cifs +kmod-fs-msdos +kmod-fuse +kmod-hwmon-core +TARGET_x86_generic:kmod-hwmon-coretemp +TARGET_x86_generic:kmod-hwmon-k10temp +TARGET_x86_generic:kmod-hwmon-via-cputemp +kmod-r8169 +kmod-tg3 +kmod-usb-hid +kmod-usb2 +kmod-usb2-pci +kmod-usb3
	DEPENDS+=+@USE_GLIBC +@LAME-LIB_OPTIMIZE_SPEED +@OPENSSL_OPTIMIZE_SPEED +@OPENSSL_WITH_EC +@OPENSSL_WITH_EC2M +@OPENSSL_ENGINE_CRYPTO +@OPENSSL_ENGINE_DIGEST +@LIBCURL_OPENSSL +@BUSYBOX_CUSTOM +@BUSYBOX_CONFIG_LOGIN
endef

define Package/yunapbx-appliance/description
  YunaPBX Appliance
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/yunapbx-appliance/install
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/rc.d
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./package_files/etc/hotplug.d/iface/* $(1)/etc/hotplug.d/iface/
	$(INSTALL_BIN) ./package_files/etc/init.d/* $(1)/etc/init.d/
	$(INSTALL_BIN) ./package_files/etc/rc.d/* $(1)/etc/rc.d/
	$(INSTALL_BIN) ./package_files/usr/bin/* $(1)/usr/bin/
	$(INSTALL_BIN) ./package_files/usr/sbin/* $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,yunapbx-appliance))
