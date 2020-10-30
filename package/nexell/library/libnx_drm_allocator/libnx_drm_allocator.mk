################################################################################
#
# libnx_drm_allocator
#
################################################################################

LIBNX_DRM_ALLOCATOR_VERSION = v1.0.0b
LIBNX_DRM_ALLOCATOR_SITE = https://nx_customer:nx_customer@gitlab.com/nexell_library/nx-drm-allocator
LIBNX_DRM_ALLOCATOR_SITE_METHOD = git
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
	cp -a $(@D)/.libs/libnx_drm_allocator.so* $(STAGING_DIR)/usr/lib
endef

define LIBNX_DRM_ALLOCATOR_INSTALL_TARGET_CMDS
	cp -a $(@D)/.libs/libnx_drm_allocator.so* $(TARGET_DIR)/usr/lib
endef

$(eval $(autotools-package))
