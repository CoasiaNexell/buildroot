################################################################################
#
# libnx_mali
#
################################################################################

LIBNX_MALI_VERSION = 0.0.0
LIBNX_MALI_SOURCE = mali-release.tar.gz
LIBNX_MALI_SITE = $(TOPDIR)/package/nexell/library/libnx_mali
LIBNX_MALI_SITE_METHOD = file
LIBNX_MALI_INSTALL_STAGING = YES
LIBNX_MALI_INSTALL_TARGET = YES

define LIBNX_MALI_CONFIGURE_CMDS

endef

define LIBNX_MALI_BUILD_CMDS

endef

define LIBNX_MALI_INSTALL_STAGING_CMDS
	cp -a $(@D)/lib* $(STAGING_DIR)/usr/lib
endef

define LIBNX_MALI_INSTALL_TARGET_CMDS
	cp -a $(@D)/lib* $(TARGET_DIR)/usr/lib
endef

$(eval $(generic-package))
