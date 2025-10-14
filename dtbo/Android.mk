include $(CLEAR_VARS)
LOCAL_MODULE := dtboimage
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(PRODUCT_OUT)
LOCAL_PREBUILT_MODULE_FILE := $(PRODUCT_OUT)/dtbo.img
LOCAL_MODULE_TAGS := optional

$(LOCAL_PREBUILT_MODULE_FILE): $(wildcard $(LOCAL_PATH)/*.dtbo)
	@echo "Creating DTBO image..."
	$(DEVICE_PATH)/dtbo/mkdtbo.sh

include $(BUILD_PREBUILT)
