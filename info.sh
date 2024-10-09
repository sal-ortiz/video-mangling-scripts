#!/usr/bin/env bash

APP_ROOT=$( readlink --canonicalize $( dirname $0 ) )
USER_PATH=$( pwd )

TMP_PATH=$APP_ROOT/tmp
BIN_PATH=$APP_ROOT/bin

INP_FILE=$1

if [ -z $1 ]; then
  echo "$( basename $0 ) <input>"

  exit 1
fi

$BIN_PATH/exiftool -*Title* -*Comment* $INP_FILE

exit 0
