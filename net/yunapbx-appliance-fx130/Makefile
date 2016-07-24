#
# Copyright (C) 2010-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>
	
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

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
	KCONFIG:=CONFIG_CPU_FREQ=y CONFIG_CPU_FREQ_GOV_COMMON=y CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y CONFIG_CPU_FREQ_GOV_PERFORMANCE=y CONFIG_CPU_FREQ_GOV_POWERSAVE=y CONFIG_CPU_FREQ_GOV_USERSPACE=y CONFIG_CPU_FREQ_GOV_ONDEMAND=y CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y CONFIG_X86_E_POWERSAVER=m
	FILES:=$(LINUX_DIR)/drivers/cpufreq/e_powersaver.ko
	AUTOLOAD:=$(call AutoLoad,01,e_powersaver)
endef

define KernelPackage/cpufreq-powersaver/description
  Kernel module for VIA E-Powersaver
endef


define KernelPackage/hwmon-via-cputemp
	TITLE:=VIA CPU temp
	SUBMENU:=Hardware Monitoring Support
	KCONFIG:=CONFIG_SENSORS_VIA_CPUTEMP=m
	FILES:=$(LINUX_DIR)/drivers/hwmon/via-cputemp.ko
	AUTOLOAD:=$(call AutoLoad,42,via-cputemp)
	DEPENDS:=kmod-hwmon-core +kmod-hwmon-vid
endef

define KernelPackage/hwmon-via-cputemp/description
  Kernel modules for VIA CPU temperature
endef


$(eval $(call KernelPackage,cpufreq-powersaver))
$(eval $(call KernelPackage,hwmon-via-cputemp))
$(eval $(call BuildPackage,yunapbx-appliance-fx130))
