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


$(eval $(call KernelPackage,cpufreq-acpi))
