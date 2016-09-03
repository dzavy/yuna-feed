#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>
	
include $(INCLUDE_DIR)/package.mk

define Package/yunapbx-appliance-zclass
	SECTION:=utils
	CATEGORY:=Utilities
	SUBMENU:=Telephony
	TITLE:=YunaPBX for Wyse Z-Class
	KCONFIG:=CONFIG_HIGHMEM64G=y CONFIG_X86_32_SMP=y CONFIG_SMP=y 
	VERSION:=1.0
	DEPENDS:=+yunapbx-appliance +kmod-cpufreq-acpi +kmod-hwmon-k10temp +kmod-r8169 +kmod-button-hotplug +kmod-acpi-button +kmod-usb3
endef

define Package/yunapbx-appliance-zclass/description
  YunaPBX Appliance for Wyse Z-Class
endef

define Build/Prepare
	ln -s -n -f `pwd`/package-files/yunapbx-appliance-zclass.mk $(TOPDIR)/package/kernel/linux/modules/yunapbx-appliance-zclass.mk
	touch $(TOPDIR)/package/kernel/linux/Makefile
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/yunapbx-appliance-zclass/install
endef


$(eval $(call BuildPackage,yunapbx-appliance-zclass))
