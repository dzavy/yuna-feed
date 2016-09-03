#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define KernelPackage/cpufreq-acpi
	TITLE:=ACPI P-States Driver
	SUBMENU:=Other modules
	KCONFIG:=CONFIG_CPU_FREQ=y CONFIG_CPU_FREQ_GOV_COMMON=y CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y CONFIG_CPU_FREQ_GOV_PERFORMANCE=y CONFIG_CPU_FREQ_GOV_POWERSAVE=y CONFIG_CPU_FREQ_GOV_USERSPACE=y CONFIG_CPU_FREQ_GOV_ONDEMAND=y CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y CONFIG_X86_ACPI_CPUFREQ=m
	FILES:=$(LINUX_DIR)/drivers/cpufreq/acpi-cpufreq.ko
	AUTOLOAD:=$(call AutoLoad,01,acpi-cpufreq)
endef

define KernelPackage/cpufreq-acpi/description
  Kernel module for VIA E-Powersaver
endef

define KernelPackage/hwmon-k10-cputemp
	TITLE:=AMD K10 CPU temp
	SUBMENU:=Hardware Monitoring Support
	KCONFIG:=CONFIG_SENSORS_K10TEMP=m
	FILES:=$(LINUX_DIR)/drivers/hwmon/k10temp.ko
	AUTOLOAD:=$(call AutoLoad,42,k10temp)
	DEPENDS:=kmod-hwmon-core +kmod-hwmon-vid
endef

define KernelPackage/hwmon-k10-cputemp/description
  Kernel modules for AMD K10 CPU temperature
endef


$(eval $(call KernelPackage,cpufreq-acpi))
$(eval $(call KernelPackage,hwmon-k10-cputemp))
