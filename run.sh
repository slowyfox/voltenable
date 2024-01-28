#!/bin/bash
set -e

adb shell mkdir -m 750 /data/local/tmp/voltenable
adb push shelltool.jar /data/local/tmp/voltenable/
adb push shellscript.sh /data/local/tmp/voltenable/
adb shell sh /data/local/tmp/voltenable/shellscript.sh "$@"
adb shell rm -r /data/local/tmp/voltenable
