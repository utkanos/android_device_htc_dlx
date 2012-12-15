$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/htc/dlx/dlx-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/dlx/overlay

LOCAL_PATH := device/htc/dlx
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/sbin/choice_fn:recovery/root/sbin/choice_fn \
    $(LOCAL_PATH)/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    $(LOCAL_PATH)/sbin/detect_key:recovery/root/sbin/detect_key \
    $(LOCAL_PATH)/fstab.dlx:recovery/root/fstab.dlx \

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_dlx
PRODUCT_DEVICE := dlx
