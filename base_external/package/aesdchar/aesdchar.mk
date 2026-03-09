##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################
$(info AESD-CHAR .mk file is being  by Buildroot!)

AESDCHAR_VERSION = 1333a64798b9adf96bfefc63b22e67068b0c0413
AESDCHAR_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-adityaganeshcu2k.git
AESDCHAR_SITE_METHOD = git
AESDCHAR_GIT_SUBMODULES = YES
AESDCHAR_MODULE_SUBDIRS = aesd-char-driver




define AESDCHAR_INSTALL_TARGET_CMDS
	# Install aesdsocket binary
	$(info Installing AESD-CHAR binaries and init script...)

	
	$(INSTALL) -D -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/bin
		
	$(INSTALL) -D -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/bin

	# Install startup script
	$(INSTALL) -D -m 0755 $(@D)/aesd-char-driver/aesdchar-start-stop.sh $(TARGET_DIR)/etc/init.d/S97aesdchar
endef

$(eval $(kernel-module))
$(eval $(generic-package))

