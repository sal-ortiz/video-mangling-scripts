#!/usr/bin/env bash

APP_ROOT=$( readlink --canonicalize $( dirname $0 ) )
USER_PATH=$( pwd )

TMP_PATH=$APP_ROOT/tmp
BIN_PATH=$APP_ROOT/bin

INP_FILE=$1
OUTP_FILE=$2

TMP_FILE=$TMP_PATH/$INP_FILE.tmp

if [ -z $INP_FILE ]; then
  echo "$( basename $0 ) <input> [output]"

  exit 1
fi

if [ -z $OUTP_FILE ]; then
  OUTP_FILE=$INP_FILE
fi


cp -fv $INP_FILE $TMP_FILE

$BIN_PATH/exiftool -r -overwrite_original -title= -comment= -subtitle= $TMP_FILE

mv -f $TMP_FILE $OUTP_FILE

exit 0
