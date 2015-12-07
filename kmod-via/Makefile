include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/hwmon-via-cputemp
    TITLE:=VIA CPU temp
    SUBMENU:=Hardware Monitoring Support
    KCONFIG:=CONFIG_SENSORS_VIA_CPUTEMP
    FILES:=$(LINUX_DIR)/drivers/hwmon/via-cputemp.ko
    AUTOLOAD:=$(call AutoLoad,42,hwmon-via-cputemp)
    DEPENDS:=kmod-hwmon-core +kmod-hwmon-vid
endef

define KernelPackage/hwmon-via-cputemp/description
  Kernel modules for VIA CPU temperature
endef

$(eval $(call KernelPackage,hwmon-via-cputemp))


define KernelPackage/cpufreq-powersaver
    TITLE:=VIA E-Powersaver
    SUBMENU:=Other modules
    KCONFIG:=CONFIG_X86_E_POWERSAVER
    FILES:=$(LINUX_DIR)/drivers/cpufreq/e_powersaver.ko
    AUTOLOAD:=$(call AutoLoad,01,cpufreq-powersaver)
endef

define KernelPackage/cpufreq-powersaver/description
  Kernel module for VIA E-Powersaver
endef

$(eval $(call KernelPackage,cpufreq-powersaver))
