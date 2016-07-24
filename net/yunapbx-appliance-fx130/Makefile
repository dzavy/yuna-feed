#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yunapbx-appliance-fx130
PKG_VERSION:=0.1
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_INSTALL:=

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>
	
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

define Package/yunapbx-appliance-fx130
	SECTION:=utils
	CATEGORY:=Utilities
	SUBMENU:=Telephony
	TITLE:=YunaPBX for Dell FX130
	DEPENDS:=+yunapbx-appliance +cpufreq-powersaver +hwmon-via-cputemp
endef

define Package/yunapbx-appliance-fx130/description
  YunaPBX Appliance for Dell FX130
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/yunapbx-appliance-fx130/install
endef

define KernelPackage/cpufreq-powersaver
	TITLE:=VIA E-Powersaver
	SUBMENU:=Other modules
	KCONFIG:=CONFIG_X86_E_POWERSAVER
	FILES:=$(LINUX_DIR)/drivers/cpufreq/e_powersaver.ko
	AUTOLOAD:=$(call AutoLoad,01,e_powersaver)
endef

define KernelPackage/cpufreq-powersaver/description
  Kernel module for VIA E-Powersaver
endef


define KernelPackage/hwmon-via-cputemp
	TITLE:=VIA CPU temp
	SUBMENU:=Hardware Monitoring Support
	KCONFIG:=CONFIG_SENSORS_VIA_CPUTEMP
	FILES:=$(LINUX_DIR)/drivers/hwmon/via-cputemp.ko
	AUTOLOAD:=$(call AutoLoad,42,via-cputemp)
	DEPENDS:=kmod-hwmon-core +kmod-hwmon-vid
endef

define KernelPackage/hwmon-via-cputemp/description
  Kernel modules for VIA CPU temperature
endef


$(eval $(call KernelPackage,cpufreq-powersaver))
$(eval $(call KernelPackage,hwmon-via-cputemp))
$(eval $(call BuildPackage,yunapbx-appliance))
