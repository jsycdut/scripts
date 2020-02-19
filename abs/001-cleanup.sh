#!/bin/bash

# 变量命名，下划线分隔，退出码定义，专业

LOG_DIR=/var/log
ROOT_UID=0
LINES=50
E_WRONGARGS=85
E_XCD=86
E_NOTROOT=87

if [ "$UID" -ne "$ROOT_UID" ]; then
  echo "Must be root to run this script"
  exit $E_NOTROOT
fi

case "$1" in
  "")
    lines=50
    ;;
  *[!0-9]*)
    echo "Usage: `basename $0` lines-to-cleanup"
    exit $E_WRONGARGS
    ;;
  *) lines=$1;
    ;;
esac

cd $LOG_DIR

# basic check
if [ "$PWD" != "$LOG_DIR" ]; then
  echo "Cannot change to necessary directory" >&2
  exit $E_XCD
fi

# advanced check
#cd $LOG_DIR || {
#  echo "Cannot change to necessary directory" >&2
#  exit $E_XCD
#}

tail -n $lines messages > mesg.tmp
mv mesg.tmp messages

cat /dev/null > wtmp # ': > wtmp' does the same thing
echo "Log files cleaned up"

exit 0
