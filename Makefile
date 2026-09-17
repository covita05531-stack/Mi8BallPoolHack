include $(THEOS)/makefiles/common.mk

TWEAK_NAME = 8BallPoolLines
8BallPoolLines_FILES = Tweak.xm
8BallPoolLines_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
