shelltool.jar: bin/com/voltenable/shelltool/Main.class
	d8 --output shelltool.jar bin/com/voltenable/shelltool/Main.class

bin/com/voltenable/shelltool/Main.class: src/com/android/internal/telephony/ICarrierConfigLoader.java
	mkdir bin
	cd src; javac -source 1.8 -target 1.8 -cp .:${SDK}/platforms/android-34/android.jar -d ../bin/ com/voltenable/shelltool/Main.java

src/com/android/internal/telephony/ICarrierConfigLoader.java:
	aidl -p ${SDK}/platforms/android-34/framework.aidl -I src src/com/android/internal/telephony/ICarrierConfigLoader.aidl

