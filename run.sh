#!/bin/bash
set -e

subid="`adb logcat -b radio -d | grep -Eo 'subId=[0-9]+' | grep -Eo '[0-9]+' | tail -1`"
echo "subId=${subid}"

adb shell mkdir -m 750 /data/local/tmp/voltenable
adb push shelltool.jar /data/local/tmp/voltenable/
adb push shellscript.sh /data/local/tmp/voltenable/
adb shell sh /data/local/tmp/voltenable/shellscript.sh "${subid}" "$@"
adb shell rm -r /data/local/tmp/voltenable
