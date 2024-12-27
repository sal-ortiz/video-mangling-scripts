#!/usr/bin/env bash

APP_ROOT=$( readlink --canonicalize $( dirname $0 ) )
USER_PATH=$( pwd )

TMP_PATH=$APP_ROOT/tmp
BIN_PATH=$APP_ROOT/bin

INP_FILE=$1
OUTP_FILE=$2

# the lower the value the higher the bitrate (24~30 is a good medium)
CRF_VAL=33

if [ -z "$INP_FILE" ]; then
  echo "$( basename $0 ) <input> [output]"

  exit 1
fi

if [ -z "$OUTP_FILE" ]; then
  OUTP_FILE=$INP_FILE
fi

TMP_FILE=$( readlink --canonicalize "$TMP_PATH/$( basename "$INP_FILE" ).tmp" )

cp -fv "$( readlink --canonicalize "$USER_PATH/$INP_FILE" )" "$TMP_FILE"

"$BIN_PATH/ffmpeg" -y -i "$TMP_FILE" -vcodec libx265 -crf $CRF_VAL "$( readlink --canonicalize "$USER_PATH/$OUTP_FILE" )"

rm -fv "$TMP_FILE"

exit 0
