#!/bin/bash
set -e

adb shell sh -c 'umask 047; rm -r /data/local/tmp/voltenable 2>/dev/null; mkdir /data/local/tmp/voltenable'
adb push shelltool.jar /data/local/tmp/voltenable/
adb push shellscript.sh /data/local/tmp/voltenable/
adb shell sh /data/local/tmp/voltenable/shellscript.sh "$@"
