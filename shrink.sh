#!/usr/bin/env bash

APP_ROOT=$( readlink --canonicalize $( dirname $0 ) )
USER_PATH=$( pwd )

TMP_PATH=$APP_ROOT/tmp
BIN_PATH=$APP_ROOT/bin

# the lower the value the higher the bitrate
# (24~30 is a good medium). zero is lossless.
CRF_VAL=$1

# scale down to this given screen width
IMG_HEIGHT=$2

INP_FILE=$3
OUTP_FILE=$4


if [ -z "$INP_FILE" ] || [ -z "$CRF_VAL" ] || [ -z "$IMG_HEIGHT" ]; then
  echo "$( basename $0 ) <crf> <height> <input> [output]"

  exit 1
fi

if [ -z "$OUTP_FILE" ]; then
  OUTP_FILE=$INP_FILE
fi

TMP_FILE=$TMP_PATH/"${INP_FILE%.*}".tmp."${INP_FILE##*.}"

cp -fv "$( readlink --canonicalize "$USER_PATH/$INP_FILE" )" "$TMP_FILE"

# TODO: try the "volume=1.5" switch to adjust volume after mixing down 5.1 audio
"$BIN_PATH/ffmpeg" -y -hwaccel auto -i "$TMP_FILE" -map_metadata 0 -vcodec libx265 -crf $CRF_VAL -ac 2 -vf scale=-2:$IMG_HEIGHT "$( readlink --canonicalize "$USER_PATH/$OUTP_FILE" )"

rm -fv "$TMP_FILE"

exit 0
