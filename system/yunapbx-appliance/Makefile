#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yunapbx-appliance
PKG_VERSION:=0.3
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL:=

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk

define Package/yunapbx-appliance
	SECTION:=base
	CATEGORY:=Base system
	TITLE:=YunaPBX Appliance
	DEPENDS:=+haproxy +lighttpd +lighttpd-mod-cgi +lighttpd-mod-extforward +luadbi-mysql +mysql-connector-odbc +mysql-server +openvpn-openssl +php7 +php7-cgi +php7-cli +prosody +sscep +yunapbx +zabbix-agent-tls
	DEPENDS+=+asterisk13 +asterisk13-app-confbridge +asterisk13-app-mixmonitor +asterisk13-app-queue +asterisk13-cdr-odbc +asterisk13-cel-odbc +asterisk13-chan-dongle +asterisk13-chan-motif +asterisk13-chan-pjsip +asterisk13-codec-a-mu +asterisk13-codec-adpcm +asterisk13-codec-alaw +asterisk13-codec-g722 +asterisk13-codec-g726 +asterisk13-codec-gsm +asterisk13-codec-ilbc +asterisk13-codec-lpc10 +TARGET_x86_generic:asterisk13-codec-opus +asterisk13-codec-resample +TARGET_x86_generic:asterisk13-codec-silk +asterisk13-codec-speex +asterisk13-codec-ulaw +asterisk13-format-gsm +asterisk13-format-wav +asterisk13-format-wav-gsm +asterisk13-func-base64 +asterisk13-func-db +asterisk13-func-devstate +asterisk13-func-extstate +asterisk13-func-presencestate +asterisk13-res-agi +asterisk13-res-format-attr-h263 +asterisk13-res-format-attr-h264 +asterisk13-res-format-attr-vp8 +asterisk13-res-http-websocket +asterisk13-res-musiconhold +asterisk13-res-rtp-asterisk +asterisk13-res-srtp +asterisk13-res-timing-timerfd +asterisk13-sounds +asterisk13-voicemail
	DEPENDS+=+base-files +block-mount +busybox +ca-certificates +curl +dropbear +fdisk +fstools +lame +logd +odhcp6c +openssl-util +partx-utils +rng-tools +strace +sudo +tcpdump +tune2fs +uci +usbutils +zoneinfo-core
	DEPENDS+=+kmod-8139too +kmod-button-hotplug +TARGET_x86_generic:kmod-cpufreq-acpi +TARGET_x86_generic:kmod-cpufreq-powersaver +TARGET_x86_geode:kmod-crypto-hw-geode +TARGET_x86_generic:kmod-crypto-hw-padlock +kmod-cryptodev +kmod-crypto-sha1 +kmod-e1000 +kmod-fs-cifs +kmod-fs-msdos +kmod-fuse +kmod-hwmon-core +TARGET_x86_generic:kmod-hwmon-coretemp +TARGET_x86_generic:kmod-hwmon-k10temp +TARGET_x86_generic:kmod-hwmon-via-cputemp +kmod-r8169 +kmod-tg3 +kmod-usb-hid +kmod-usb2 +kmod-usb2-pci +kmod-usb3
	DEPENDS+=+@USE_GLIBC +@OPENSSL_WITH_EC +@OPENSSL_WITH_EC2M +@OPENSSL_ENGINE_CRYPTO +@OPENSSL_ENGINE_DIGEST +@LIBCURL_OPENSSL +@BUSYBOX_CUSTOM +@BUSYBOX_CONFIG_LOGIN
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
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./package_files/etc/hotplug.d/iface/* $(1)/etc/hotplug.d/iface/
	$(INSTALL_BIN) ./package_files/etc/init.d/* $(1)/etc/init.d/
	$(INSTALL_BIN) ./package_files/etc/rc.d/* $(1)/etc/rc.d/
	$(INSTALL_BIN) ./package_files/usr/sbin/* $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,yunapbx-appliance))
    