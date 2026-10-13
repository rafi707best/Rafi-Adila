LOCAL_PATH := $(call my-dir)

# twrp-9.0+ memakai vendor/twrp, twrp-7.1/8.1 memakai vendor/omni
ifneq ($(wildcard vendor/twrp/config/common.mk),)
PRODUCT_MAKEFILES := $(LOCAL_PATH)/twrp_PD1612DF.mk
COMMON_LUNCH_CHOICES := twrp_PD1612DF-eng
else
PRODUCT_MAKEFILES := $(LOCAL_PATH)/omni_PD1612DF.mk
COMMON_LUNCH_CHOICES := omni_PD1612DF-eng
endif
