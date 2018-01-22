#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tevent
PKG_VERSION:=0.9.34
PKG_RELEASE:=2
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://www.samba.org/ftp/$(PKG_NAME)/
PKG_MD5SUM:=8df1ae19fd991b82abe66889da0651b0
PKG_INSTALL:=1
	
PKG_MAINTAINER:=Jan Havelka <dzavy@dzavy.net>

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

define Package/libtevent
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=Samba libtevent
	DEPENDS:=+libtalloc
endef

define Package/libtevent/description
  Tevent is an event system based on the talloc memory management library. It is the core event system used in Samba.
endef

TARGET_LDFLAGS += -L$(STAGING_DIR)/lib

CROSS = " \
	\nChecking simple C program: OK \
	\nrpath library support: OK \
	\n-Wl,--version-script support: OK \
	\nChecking getconf LFS_CFLAGS: NO \
	\nChecking for large file support without additional flags: OK \
	\nChecking for -D_LARGE_FILES: OK \
	\nChecking correct behavior of strtoll: NO \
	\nChecking for working strptime: OK \
	\nChecking for C99 vsnprintf: OK \
	\nChecking for HAVE_SHARED_MMAP: OK \
	\nChecking for HAVE_MREMAP: OK \
	\nChecking for HAVE_INCOHERENT_MMAP: NO \
	\nChecking for HAVE_SECURE_MKSTEMP: OK \
	\nChecking for HAVE_IFACE_GETIFADDRS: OK \
	\nChecking for kernel change notify support: OK \
	\nChecking for Linux kernel oplocks: OK \
	\nChecking for kernel share modes: OK \
	\nChecking if can we convert from CP850 to UCS-2LE: OK \
	\nChecking if can we convert from UTF-8 to UCS-2LE: OK \
	\nChecking whether we can use Linux thread-specific credentials with 32-bit system calls: OK \
	\nChecking whether we can use Linux thread-specific credentials: OK \
	\nChecking whether setreuid is available: OK \
	\nChecking whether setresuid is available: OK \
	\nChecking whether seteuid is available: OK \
	\nChecking whether fcntl locking is available: OK \
	\nChecking for the maximum value of the 'time_t' type: OK \
	\nChecking whether the realpath function allows a NULL argument: OK \
	\nChecking whether POSIX capabilities are available: OK \
	\nChecking for ftruncate extend: OK \
	\nvfs_fileid checking for statfs() and struct statfs.f_fsid: OK \
	\ngetcwd takes a NULL argument: OK \
	\nChecking value of NSIG: \"65\" \
	\nChecking value of _NSIG: \"65\" \
	\nChecking value of SIGRTMAX: \"64\" \
	\nChecking value of SIGRTMIN: \"34\" \
	\nChecking if toolchain accepts -fstack-protector: OK \
	\n"

define Build/Configure
	(cd $(PKG_BUILD_DIR); \
		echo -e >cache.txt $(CROSS) " \
			\nChecking uname machine type: \"$(ARCH)\" \
			\nChecking uname release type: \"$(LINUX_VERSION)\" \
			\nChecking uname sysname type: \"Linux\" \
			\nChecking uname version type: \"$(LINUX_UNAME_VERSION)\" \
		\n" ; \
		$(CONFIGURE_VARS) \
		./buildtools/bin/waf configure \
			--prefix=/usr \
			--sysconfdir=/etc \
			--localstatedir=/var \
			--with-libiconv="$(ICONV_PREFIX)" \
			--cross-compile \
			--cross-answers=$(PKG_BUILD_DIR)/cache.txt \
			--disable-rpath \
			--disable-rpath-install \
	)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtevent.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/*.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/tevent.pc $(1)/usr/lib/pkgconfig/
endef

define Package/libtevent/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtevent.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libtevent))
