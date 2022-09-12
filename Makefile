#
# Copyright (C) 2022-2023 q741451 <q741451@gmail.com>
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=intraportmap
PKG_VERSION:=0.1.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/q741451/intraportmap.git
PKG_SOURCE_VERSION:=eafbc0d2db15b70d3a9cd89a4d29fe63591664ea
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.xz

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=
PKG_MAINTAINER:=q741451 <q741451@gmail.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION)

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
PKG_USE_MIPS16:=0
PKG_BUILD_PARALLEL:=1
PKG_BUILD_DEPENDS:=libevent2

include $(INCLUDE_DIR)/package.mk

define Package/intraportmap/Default
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Intranet port mapping
  DEPENDS:=+libevent2 +libstdcpp
endef

define Package/intraportmap
$(call Package/intraportmap/Default)
endef

define Package/intraportmap/description
 Intranet port mapping.
endef

define Package/intraportmap/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/intraportmap $(1)/usr/sbin
endef

$(eval $(call BuildPackage,intraportmap))
