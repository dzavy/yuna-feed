#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>
	
include $(INCLUDE_DIR)/package.mk

define Package/yunapbx-appliance-fx130
	SECTION:=utils
	CATEGORY:=Utilities
	SUBMENU:=Telephony
	TITLE:=YunaPBX for Dell FX130
	KCONFIG:=CONFIG_MVIAC7=y CONFIG_HIGHMEM64G=y CONFIG_X86_32_SMP=y CONFIG_SMP=y 
	VERSION:=1.0
	DEPENDS:=+yunapbx-appliance +kmod-cpufreq-powersaver +kmod-hwmon-via-cputemp +kmod-crypto-hw-padlock +kmod-r8169 +kmod-button-hotplug +kmod-acpi-button
endef

define Package/yunapbx-appliance-fx130/description
  YunaPBX Appliance for Dell FX130
endef

define Build/Prepare
	ln -s -n -f `pwd`/package-files/yunapbx-appliance-fx130.mk $(TOPDIR)/package/kernel/linux/modules/yunapbx-appliance-fx130.mk
	touch $(TOPDIR)/package/kernel/linux/Makefile
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/yunapbx-appliance-fx130/install
endef


$(eval $(call BuildPackage,yunapbx-appliance-fx130))
