#!/usr/bin/env bash

APP_ROOT=$( readlink --canonicalize $( dirname $0 ) )
USER_PATH=$( pwd )

TMP_PATH=$APP_ROOT/tmp
BIN_PATH=$APP_ROOT/bin

VID_INPUT=$1
AUD_INPUT=$2
OUTP_FILE=$3

TMP_FILE=$TMP_PATH/$VID_INPUT.tmp

if [ -z $VID_INPUT ] || [ -z $AUD_INPUT ]; then
  echo "$( basename $0 ) <video> <audio> [output]"

  exit 1
fi

if [ -z $OUTP_FILE ]; then
  OUTP_FILE=$VID_INPUT
fi

cp -fv $VID_INPUT $TMP_FILE

$BIN_PATH/ffmpeg -y -i $TMP_FILE -i $AUD_INPUT -c:v copy -map 0:v:0 -map 1:a:0 $OUTP_FILE

rm -fv $TMP_FILE

exit 0
