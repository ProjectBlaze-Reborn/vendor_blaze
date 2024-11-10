# Inherit mobile full common stuff
$(call inherit-product, vendor/blaze/config/common_mobile_full.mk)

# Inherit tablet common stuff
$(call inherit-product, vendor/blaze/config/tablet.mk)

$(call inherit-product, vendor/blaze/config/wifionly.mk)
