#!/usr/bin/env bash

APP_ROOT=$( readlink --canonicalize $( dirname $0 ) )
USER_PATH=$( pwd )

BIN_PATH=$APP_ROOT/bin

INP_FILE=$1
OUTP_FILE=$2

if [ -z $INP_FILE ]; then
  echo "$( basename $0 ) <input> <output>"
  exit 1
fi

if [ -z $OUTP_FILE ]; then
  OUTP_FILE=$INP_FILE.mp3
fi

# TODO: use -ab <sampling rate> to force output sampling rate.
$BIN_PATH/ffmpeg -y -i $INP_FILE -f mp3 -vn $OUTP_FILE

exit 0
