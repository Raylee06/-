#!/bin/bash
set -x
filename="$1"
echo "文件名是 $filename"
ls $filename
set +x
echo "调试结束"
