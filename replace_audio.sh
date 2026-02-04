#!/usr/bin/env bash

APP_ROOT=$( readlink --canonicalize $( dirname $0 ) )
USER_PATH=$( pwd )

TMP_PATH=$APP_ROOT/tmp
BIN_PATH=$APP_ROOT/bin

VID_INP=$1
AUD_INP=$2
OUTP_FILE=$3

TMP_FILE=$TMP_PATH/"${VID_INP%.*}".tmp."${VID_INP##*.}"

if [ -z "$VID_INP" ] || [ -z "$AUD_INP" ]; then
  echo "$( basename $0 ) <video> <audio> [output]"

  exit 1
fi

if [ -z "$OUTP_FILE" ]; then
  OUTP_FILE=$VID_INP
fi

cp -fv "$VID_INP" "$TMP_FILE"

$BIN_PATH/ffmpeg -y -i "$TMP_FILE" -i "$AUD_INP" -c:v copy -map 0:v:0 -map 1:a:0 "$OUTP_FILE"

rm -fv $TMP_FILE

exit 0
