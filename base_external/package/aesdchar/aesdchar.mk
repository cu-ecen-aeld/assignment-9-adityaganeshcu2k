##############################################################
#
# AESD-ASSIGNMENTS
# References :- https://chatgpt.com/share/69ae5102-e114-8008-b014-85ccf9a607a4
##############################################################
$(info AESD-CHAR .mk file is being  by Buildroot!)

AESDCHAR_VERSION = 0d260dca47f60a35e8d10b8781b4892fbb4d541f
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

