################################################################################
#
# asv_gpu_test
#
################################################################################

ASV_GPU_TEST_VERSION = 0.0.0
ASV_GPU_TEST_SOURCE = gpu.tar.gz
ASV_GPU_TEST_SITE = $(TOPDIR)/package/nexell/asv_gpu_test
ASV_GPU_TEST_SITE_METHOD = file
#ASV_GPU_TEST_SITE = /home/tifler/repo/slt/characterization/slt/src/gpu
#ASV_GPU_TEST_SITE_METHOD = local
ASV_GPU_TEST_INSTALL_STAGING = YES
ASV_GPU_TEST_INSTALL_TARGET = YES
#ASV_GPU_TEST_DEPENDENCIES = libdrm libnx_mali libnx_drm_allocator libnx_renderer libdrm_nexell wayland
ASV_GPU_TEST_DEPENDENCIES = libnx_mali libnx_drm_allocator libnx_renderer libdrm_nexell

ASV_GPU_TEST_CFLAGS += -I$(STAGING_DIR)/usr/include -I$(@D)/import/3rdparty/include/khronos -I$(@D)/import/include/EGL/platform_drm
ASV_GPU_TEST_CXXFLAGS += -I$(STAGING_DIR)/usr/include -I$(@D)/import/3rdparty/include/khronos -I$(@D)/import/include/EGL/platform_fbdev -Wno-narrowing

define ASV_GPU_TEST_BUILD_CMDS
    $(TARGET_MAKE_ENV) $(MAKE) SDKTARGETSYSROOT=$(STAGING_DIR) \
		CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" CXXFLAGS="$(TARGET_CFLAGS) $(ASV_GPU_TEST_CXXFLAGS)" \
	-C $(@D)
endef

define ASV_GPU_TEST_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/asv_graphic $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/share/asv_gpu_test
	$(INSTALL) -D -m 0644 $(@D)/data/* $(TARGET_DIR)/usr/share/asv_gpu_test
endef

$(eval $(generic-package))
