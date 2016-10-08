#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yunapbx-appliance
PKG_VERSION:=0.1
PKG_RELEASE:=2
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL:=

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>
	
include $(INCLUDE_DIR)/package.mk

define Package/yunapbx-appliance-hardware
	SECTION:=utils
	CATEGORY:=Utilities
	SUBMENU:=Telephony
	TITLE:=YunaPBX Appliance Hardware Config
	KCONFIG:=CONFIG_HIGHMEM64G=y CONFIG_X86_32_SMP=y CONFIG_SMP=y 
	VERSION:=1.0
	DEPENDS:=+yunapbx-appliance +kmod-cpufreq-acpi +kmod-hwmon-k10temp +kmod-hwmon-coretemp +kmod-usb2 +kmod-usb2-pci +kmod-usb3 +kmod-cpufreq-powersaver +kmod-hwmon-via-cputemp +kmod-crypto-hw-padlock +kmod-r8169 +kmod-button-hotplug +kmod-acpi-button
endef

define Package/yunapbx-appliance-hardware/description
  YunaPBX Appliance Hardware Config
endef

define Build/Prepare
	ln -s -n -f `pwd`/package-files/yunapbx-appliance-hardware.mk $(TOPDIR)/package/kernel/linux/modules/yunapbx-appliance-hardware.mk
	touch $(TOPDIR)/package/kernel/linux/Makefile
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/yunapbx-appliance-hardware/install
endef


$(eval $(call BuildPackage,yunapbx-appliance-hardware))
