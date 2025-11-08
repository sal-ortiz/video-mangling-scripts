#!/usr/bin/env bash

APP_ROOT=$( readlink --canonicalize $( dirname $0 ) )
USER_PATH=$( pwd )

TMP_PATH=$APP_ROOT/tmp
BIN_PATH=$APP_ROOT/bin

# the lower the value the higher the bitrate
# (24~30 is a good medium). zero is lossless.
CRF_VAL=$1

# scale down to this given screen width
IMG_WIDTH=$2

INP_FILE=$3
OUTP_FILE=$4


if [ -z "$INP_FILE" ] || [ -z "$CRF_VAL" ] || [ -z "$IMG_WIDTH" ]; then
  echo "$( basename $0 ) <crf> <width> <input> [output]"

  exit 1
fi

if [ -z "$OUTP_FILE" ]; then
  OUTP_FILE=$INP_FILE
fi


TMP_FILE=$( readlink --canonicalize "$TMP_PATH/$( basename "$INP_FILE" ).tmp" )

cp -fv "$( readlink --canonicalize "$USER_PATH/$INP_FILE" )" "$TMP_FILE"

"$BIN_PATH/ffmpeg" -y -i "$TMP_FILE" -vcodec libx265 -crf $CRF_VAL -vf scale=-2:$IMG_WIDTH "$( readlink --canonicalize "$USER_PATH/$OUTP_FILE" )"

rm -fv "$TMP_FILE"

exit 0
