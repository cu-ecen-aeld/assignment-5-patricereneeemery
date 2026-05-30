################################################################################
#
# aesd-assignments
#
################################################################################

AESD_ASSIGNMENTS_VERSION = 1.0
AESD_ASSIGNMENTS_SITE = $(TOPDIR)/../assignments-3-and-later-patricereneeemery
AESD_ASSIGNMENTS_SITE_METHOD = local

define AESD_ASSIGNMENTS_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" -C $(@D)/server
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
    $(INSTALL) -D $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
    $(INSTALL) -D $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))
