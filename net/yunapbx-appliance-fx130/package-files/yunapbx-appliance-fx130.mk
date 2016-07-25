#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

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
