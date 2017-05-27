#
# Copyright (C) 2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define KernelPackage/cpufreq-powersaver
	TITLE:=VIA E-Powersaver
	SUBMENU:=Other modules
	KCONFIG:=CONFIG_X86_E_POWERSAVER=m
	FILES:=$(LINUX_DIR)/drivers/cpufreq/e_powersaver.ko
	AUTOLOAD:=$(call AutoLoad,01,e_powersaver)
endef

define KernelPackage/cpufreq-powersaver/description
  Kernel module for VIA E-Powersaver
endef

define KernelPackage/cpufreq-acpi
	TITLE:=ACPI P-States Driver
	SUBMENU:=Other modules
	KCONFIG:=CONFIG_X86_ACPI_CPUFREQ=m CONFIG_X86_ACPI_CPUFREQ_CPB=n CONFIG_X86_POWERNOW_K8=n CONFIG_X86_AMD_FREQ_SENSITIVITY=n
	FILES:=$(LINUX_DIR)/drivers/cpufreq/acpi-cpufreq.ko
	AUTOLOAD:=$(call AutoLoad,01,acpi-cpufreq)
endef

define KernelPackage/cpufreq-acpi/description
  Kernel module for VIA E-Powersaver
endef

define KernelPackage/hwmon-coretemp
	TITLE:=Intel Core/Core2/Atom thermal monitoring support
	KCONFIG:=CONFIG_SENSORS_CORETEMP
	FILES:=$(LINUX_DIR)/drivers/hwmon/coretemp.ko
	AUTOLOAD:=$(call AutoProbe,coretemp)
	DEPENDS:=kmod-hwmon-core
endef

define KernelPackage/hwmon-coretemp/description
  Kernel module for Intel Core/Core2/Atom thermal monitor chip
endef

define KernelPackage/hwmon-k10temp
	TITLE:=AMD Family 10h+ temperature sensor
	KCONFIG:=CONFIG_SENSORS_K10TEMP
	FILES:=$(LINUX_DIR)/drivers/hwmon/k10temp.ko
	AUTOLOAD:=$(call AutoLoad,60,k10temp)
	DEPENDS:=kmod-hwmon-core
endef

define KernelPackage/hwmon-k10temp/description
  Thermal sensor support for AMD 10h, 11h, 12h (Llano), 14h (Brazos),
  15h (Bulldozer/Trinity/Kaveri) and 16h (Kabini/Mullins) CPUs
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
  Kernel modules for VIA CPU temperature sensor
endef


$(eval $(call KernelPackage,cpufreq-powersaver))
$(eval $(call KernelPackage,cpufreq-acpi))
$(eval $(call KernelPackage,hwmon-coretemp))
$(eval $(call KernelPackage,hwmon-k10temp))
$(eval $(call KernelPackage,hwmon-via-cputemp))
