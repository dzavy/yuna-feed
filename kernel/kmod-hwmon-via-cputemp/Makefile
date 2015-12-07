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
