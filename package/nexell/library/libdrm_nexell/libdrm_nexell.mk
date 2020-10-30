################################################################################
#
# libdrm_nexell
#
################################################################################

LIBDRM_NEXELL_VERSION = v1.0.0b
LIBDRM_NEXELL_SITE = https://nx_customer:nx_customer@gitlab.com/nexell_library/libdrm
LIBDRM_NEXELL_SITE_METHOD = git
LIBDRM_NEXELL_INSTALL_STAGING = YES
LIBDRM_NEXELL_INSTALL_TARGET = YES
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
	cp -a $(@D)/.libs/libdrm.so* $(STAGING_DIR)/usr/lib
	ln -sf $(STAGING_DIR)/usr/lib/libdrm.so $(STAGING_DIR)/usr/lib/libdrm_nexell.so
endef

define LIBDRM_NEXELL_INSTALL_TARGET_CMDS
	cp -a $(@D)/.libs/libdrm.so* $(TARGET_DIR)/usr/lib
	ln -sf $(TARGET_DIR)/usr/lib/libdrm.so $(TARGET_DIR)/usr/lib/libdrm_nexell.so
endef

$(eval $(autotools-package))
