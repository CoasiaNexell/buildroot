################################################################################
#
# libnx_drm_allocator
#
################################################################################

LIBNX_DRM_ALLOCATOR_VERSION = 0.0.0
LIBNX_DRM_ALLOCATOR_SITE = /home/tifler/repo/release/nexell_yocto_r2/library/nx-drm-allocator
LIBNX_DRM_ALLOCATOR_SITE_METHOD = local
LIBNX_DRM_ALLOCATOR_INSTALL_STAGING = YES
LIBNX_DRM_ALLOCATOR_INSTALL_TARGET = YES

define LIBNX_DRM_ALLOCATOR_RUN_AUTOGEN
	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef

LIBNX_DRM_ALLOCATOR_PRE_CONFIGURE_HOOKS += LIBNX_DRM_ALLOCATOR_RUN_AUTOGEN

define __PRE_PATCH_HOOK
	echo PRE_PATCH_HOOK
endef
LIBNX_DRM_ALLOCATOR_PRE_PATCH_HOOKS += __PRE_PATCH_HOOKS

define __POST_PATCH_HOOK
	echo POST_PATCH_HOOK
endef
LIBNX_DRM_ALLOCATOR_POST_PATCH_HOOKS += __POST_PATCH_HOOKS

LIBNX_DRM_ALLOCATOR_CONF_OPTS += --includedir=$(STAGING_DIR)/usr/include

define LIBNX_DRM_ALLOCATOR_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0644 $(@D)/nx-drm-allocator.h $(STAGING_DIR)/usr/include/nx-drm-allocator.h
	$(INSTALL) -D -m 0755 $(@D)/.libs/libnx_drm_allocator.so* $(STAGING_DIR)/usr/lib
endef

define LIBNX_DRM_ALLOCATOR_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/.libs/libnx_drm_allocator.so* $(TARGET_DIR)/usr/lib
endef

$(eval $(autotools-package))
