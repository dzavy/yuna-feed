define KernelPackage/hwmon-via-cputemp
    TITLE:=VIA CPU temp
    DESCRIPTION:=Kernel modules for VIA CPU temperature 
    SUBMENU:=Hardware Monitoring Support 
    KCONFIG:=CONFIG_SENSORS_VIA_CPUTEMP 
    FILES:=$(LINUX_DIR)/drivers/hwmon/via-cputemp.ko 
    AUTOLOAD:=$(call AutoLoad,42,hwmon-via-cputemp) 
endef 

$(eval $(call KernelPackage,hwmon-via-cputemp))

define KernelPackage/cpufreq-powersaver
    TITLE:=VIA E-Powersaver
    DESCRIPTION:=Kernel module for VIA E-Powersaver 
    SUBMENU:=Other modules 
    KCONFIG:=CONFIG_X86_E_POWERSAVER
    FILES:=$(LINUX_DIR)/drivers/cpufreq/e_powersaver.ko 
    AUTOLOAD:=$(call AutoLoad,01,cpufreq-powersaver) 
endef 

$(eval $(call KernelPackage,cpufreq-powersaver))
