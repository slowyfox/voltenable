Enable VoLTE for Google Pixel users in "unsupported" countries, by executing a Java executable in the adb shell.

This patch works by setting `KEY_CARRIER_VOLTE_AVAILABLE_BOOL` to `true`, like the pixel-volte-patch. But unlike the pixel-volte-patch, this patch does not require installing apps or grant apps USB/wireless debugging permission.

# Requirement
- Pixel.
- A computer that you trust.
- USB cable.

# Usage
## Build
### Set up Android SDK
You'll need install platforms and build tools for android-34. Then add build tools to your `PATH` so that you can run `d8 --help` in your shell.

### make
Run `make SDK=/path/to/sdk`

## Prepare the phone
Enable USB debugging and connect it to the computer. Run `adb devices` on the computer. Make sure you can see your device.

## Find subId
Turn off airplane mode if it's on. Then run `adb logcat -b radio | grep -E 'subId=[0-9]+' | tail`. Take a note of the subId.

## Apply the patch
Run `./run.sh <subId>`. If everything is okay it will print `OK` at the end.

## Verify that it works
In `Settings -> Network & Internet -> SIMs -> <Your SIM card>`, there should be a toggle for VoLTE.

## Disable USB debugging
Now you can disable USB debugging. Developer options can also be disabled if you do not need it.

# References
[pixel-volte-patch](https://github.com/kyujin-cho/pixel-volte-patch/blob/main/README.en.md)
[programmatically-talking-to-the-android-system-adb-shell](https://raccoon.onyxbits.de/blog/programmatically-talking-to-the-android-system-adb-shell/)
