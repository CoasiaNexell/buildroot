################################################################################
#
# libdrm_nexell
#
################################################################################

LIBDRM_NEXELL_VERSION = 0.0.0
LIBDRM_NEXELL_SITE = /home/tifler/repo/release/nexell_yocto_r2/library/libdrm
LIBDRM_NEXELL_SITE_METHOD = local
LIBDRM_NEXELL_INSTALL_STAGING = YES
LIBDRM_NEXELL_INSTALL_TARGET = NO
LIBDRM_NEXELL_DEPENDENCIES = libpciaccess

define LIBDRM_NEXELL_RUN_AUTOGEN
	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef

LIBDRM_NEXELL_PRE_CONFIGURE_HOOKS += LIBDRM_NEXELL_RUN_AUTOGEN

define __PRE_PATCH_HOOK
	echo PRE_PATCH_HOOK
endef
LIBDRM_NEXELL_PRE_PATCH_HOOKS += __PRE_PATCH_HOOKS

define __POST_PATCH_HOOK
	echo POST_PATCH_HOOK
endef
LIBDRM_NEXELL_POST_PATCH_HOOKS += __POST_PATCH_HOOKS

LIBDRM_NEXELL_CONF_OPTS += --includedir=$(STAGING_DIR)/usr/include

define LIBDRM_NEXELL_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0755 $(@D)/.libs/libdrm.so* $(STAGING_DIR)/usr/lib
	ln -sf $(STAGING_DIR)/usr/lib/libdrm.so $(STAGING_DIR)/usr/lib/libdrm_nexell.so
endef

define LIBDRM_NEXELL_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/.libs/libdrm.so* $(TARGET_DIR)/usr/lib
	ln -sf $(TARGET_DIR)/usr/lib/libdrm.so $(TARGET_DIR)/usr/lib/libdrm_nexell.so
endef

$(eval $(autotools-package))
