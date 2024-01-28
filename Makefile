ifndef SDK
$(error SDK is not set)
endif

ANDROID_VER := android-34
BUILD_TOOLS_VER := 34.0.0

BUILD_TOOLS := $(SDK)/build-tools/$(BUILD_TOOLS_VER)
PLATFORMS := $(SDK)/platforms/$(ANDROID_VER)

export PATH := $(BUILD_TOOLS):$(PATH)

shelltool.jar: bin/com/voltenable/shelltool/Main.class
	d8 --output shelltool.jar bin/com/voltenable/shelltool/Main.class

bin/com/voltenable/shelltool/Main.class: src/com/android/internal/telephony/ICarrierConfigLoader.java
	mkdir bin
	cd src; javac -source 1.8 -target 1.8 -cp .:$(PLATFORMS)/android.jar -d ../bin/ com/voltenable/shelltool/Main.java

src/com/android/internal/telephony/ICarrierConfigLoader.java:
	aidl -p $(PLATFORMS)/framework.aidl -I src src/com/android/internal/telephony/ICarrierConfigLoader.aidl

