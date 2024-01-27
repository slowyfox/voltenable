#!/bin/sh

base=/data/local/tmp/voltenable
export CLASSPATH="${base}"/shelltool.jar
export ANDROID_DATA="${base}"

cd "${base}"
mkdir -p "${base}"/dalvik-cache
exec app_process "${base}" com.voltenable.shelltool.Main "$@"
