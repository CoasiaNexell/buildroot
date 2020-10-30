################################################################################
#
# libnx_renderer
#
################################################################################

LIBNX_RENDERER_VERSION = 619c5b41c5e0035d35f15c736b4757065a103c30
LIBNX_RENDERER_SITE = https://nx_customer:nx_customer@gitlab.com/nexell_library/nx-renderer
LIBNX_RENDERER_SITE_METHOD = git
LIBNX_RENDERER_INSTALL_STAGING = YES
LIBNX_RENDERER_INSTALL_TARGET = YES
LIBNX_RENDERER_DEPENDENCIES = libdrm_nexell

define LIBNX_RENDERER_RUN_AUTOGEN
	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef

LIBNX_RENDERER_PRE_CONFIGURE_HOOKS += LIBNX_RENDERER_RUN_AUTOGEN

define __PRE_PATCH_HOOK
	echo PRE_PATCH_HOOK
endef
LIBNX_RENDERER_PRE_PATCH_HOOKS += __PRE_PATCH_HOOKS

define __POST_PATCH_HOOK
	echo POST_PATCH_HOOK
endef
LIBNX_RENDERER_POST_PATCH_HOOKS += __POST_PATCH_HOOKS

LIBNX_RENDERER_CONF_OPTS += --includedir=$(STAGING_DIR)/usr/include

define LIBNX_RENDERER_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0644 $(@D)/include/dp.h $(STAGING_DIR)/usr/include/dp.h
	$(INSTALL) -D -m 0644 $(@D)/include/dp_common.h $(STAGING_DIR)/usr/include/dp_common.h
	cp -a $(@D)/.libs/libnx_renderer.so* $(STAGING_DIR)/usr/lib
endef

define LIBNX_RENDERER_INSTALL_TARGET_CMDS
	cp -a $(@D)/.libs/libnx_renderer.so* $(TARGET_DIR)/usr/lib
endef

$(eval $(autotools-package))
