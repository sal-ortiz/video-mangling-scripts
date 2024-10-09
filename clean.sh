#!/usr/bin/env bash

APP_ROOT=$( readlink --canonicalize $( dirname $0 ) )
#USER_PATH=$( pwd )

TMP_PATH=$APP_ROOT/tmp
BIN_PATH=$APP_ROOT/bin

if [ -d $BIN_PATH ]; then
  rm -rf $BIN_PATH
fi

if [ -d $TMP_PATH ]; then
  rm -rf $TMP_PATH
fi

exit 0
