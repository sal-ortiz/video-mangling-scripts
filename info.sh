#!/usr/bin/env bash

APP_ROOT=$( readlink --canonicalize $( dirname $0 ) )
USER_PATH=$( pwd )

TMP_PATH=$APP_ROOT/tmp
BIN_PATH=$APP_ROOT/bin

INP_FILE=$1

if [ -z "$INP_FILE" ]; then
  echo "$( basename $0 ) <input>"

  exit 1
fi

"$BIN_PATH/exiftool" "$INP_FILE"
"$BIN_PATH/exiftool" -time:all -a -G0:1 -s "$INP_FILE"

exit 0
