# RALINK_3352 platform definitions file
#
# Defines the following variables:
#    LINUX_SRC
#    LINUX_SRC_MODULE
#    CROSS_COMPILE
#    PLATFORM_SUPPORTED (only if known to be supported)

LINUX_SRC ?= /home/sample/3352/RT288x_SDK/source/linux-2.6.21.x
LINUX_SRC_MODULE ?=
CROSS_COMPILE ?= /opt/buildroot-gcc342/bin/mipsel-linux-
