# Untuk manifest twrp-7.1 / twrp-8.1 (prefix omni_)
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, vendor/omni/config/common.mk)

DEVICE_PATH := device/vivo/PD1612DF
LOCAL_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel

PRODUCT_DEVICE := PD1612DF
PRODUCT_NAME := omni_PD1612DF
PRODUCT_BRAND := vivo
PRODUCT_MODEL := Vivo V5s
PRODUCT_MANUFACTURER := vivo
