CUSTOM_DATE_YEAR := $(shell date -u +%Y)
CUSTOM_DATE_MONTH := $(shell date -u +%m)
CUSTOM_DATE_DAY := $(shell date -u +%d)
CUSTOM_DATE_HOUR := $(shell date -u +%H)
CUSTOM_DATE_MINUTE := $(shell date -u +%M)
CUSTOM_BUILD_DATE_UTC := $(shell date -d '$(CUSTOM_DATE_YEAR)-$(CUSTOM_DATE_MONTH)-$(CUSTOM_DATE_DAY) $(CUSTOM_DATE_HOUR):$(CUSTOM_DATE_MINUTE) UTC' +%s)
CUSTOM_BUILD_DATE := $(CUSTOM_DATE_YEAR)$(CUSTOM_DATE_MONTH)$(CUSTOM_DATE_DAY)-$(CUSTOM_DATE_HOUR)$(CUSTOM_DATE_MINUTE)

BLAZE_VERSION := 4.2
BLAZE_TAG := EOL
BLAZE_BUILD_TYPE ?= UNOFFICIAL
BLAZE_MAINTAINER ?= ProDev

CUSTOM_VERSION := ProjectBlaze_$(CUSTOM_BUILD)-$(BLAZE_VERSION)-$(BLAZE_TAG)-$(CUSTOM_BUILD_DATE)-$(BLAZE_BUILD_TYPE)

# ProjectBlaze Platform Version
PRODUCT_PRODUCT_PROPERTIES += \
    ro.custom.build.date=$(BUILD_DATE) \
    ro.custom.device=$(CUSTOM_BUILD) \
    ro.custom.fingerprint=$(ROM_FINGERPRINT) \
    ro.custom.version=$(CUSTOM_VERSION) \
    ro.modversion=$(CUSTOM_VERSION)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    org.blaze.version=$(BLAZE_VERSION) \
    ro.blaze.buildtype=$(BLAZE_BUILD_TYPE) \
    ro.blaze.maintainer=$(BLAZE_MAINTAINER)

# Signing
ifneq (eng,$(TARGET_BUILD_VARIANT))
ifneq (,$(wildcard vendor/blaze/signing/keys/releasekey.pk8))
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/blaze/signing/keys/releasekey
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.oem_unlock_supported=1
endif
ifneq (,$(wildcard vendor/blaze/signing/keys/otakey.x509.pem))
PRODUCT_OTA_PUBLIC_KEYS := vendor/blaze/signing/keys/otakey.x509.pem
endif
endif
