#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yunapbx-appliance
PKG_VERSION:=0.4
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
	DEPENDS+=+asterisk16 +asterisk16-app-confbridge +asterisk16-app-mixmonitor +asterisk16-app-queue +asterisk16-cdr +asterisk16-chan-dongle +asterisk16-chan-motif +asterisk16-codec-a-mu +asterisk16-codec-adpcm +asterisk16-codec-alaw +asterisk16-codec-g722 +asterisk16-codec-g726 +asterisk16-codec-gsm +asterisk16-codec-ilbc +asterisk16-codec-lpc10 +TARGET_x86_generic:asterisk16-codec-opus +asterisk16-codec-resample +TARGET_x86_generic:asterisk16-codec-silk +asterisk16-codec-speex +asterisk16-codec-ulaw +asterisk16-format-gsm +asterisk16-format-wav +asterisk16-format-wav-gsm +asterisk16-func-base64 +asterisk16-func-db +asterisk16-func-devstate +asterisk16-func-extstate +asterisk16-func-periodic-hook +asterisk16-func-presencestate +asterisk16-odbc +asterisk16-pjsip +asterisk16-res-agi +asterisk16-res-format-attr-h263 +asterisk16-res-format-attr-h264 +asterisk16-res-format-attr-vp8 +asterisk16-res-http-websocket +asterisk16-res-musiconhold +asterisk16-res-rtp-asterisk +asterisk16-res-srtp +asterisk16-res-timing-timerfd +asterisk16-sounds +asterisk16-voicemail
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
