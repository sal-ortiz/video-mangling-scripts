#!/usr/bin/env bash

APP_ROOT=$( readlink --canonicalize $( dirname $0 ) )
USER_PATH=$( pwd )

TMP_PATH=$APP_ROOT/tmp
BIN_PATH=$APP_ROOT/bin

NUM_CHANNELS=$1
VOL_MULTIPILER=$2
INP_FILE=$3
OUTP_FILE=$4

if [ -z "$INP_FILE" ] || [ -z "$NUM_CHANNELS" ] || [ -z "$VOL_MULTIPILER" ]; then
  echo "$( basename $0 ) <channels> <volume> <input> [output]"

  exit 1
fi

if [ -z "$OUTP_FILE" ]; then
  OUTP_FILE=$INP_FILE
fi

TMP_FILE="$( basename "$INP_FILE")"
TMP_FILE="$TMP_PATH/"${TMP_FILE%.*}".tmp."${INP_FILE##*.}""

cp -fv "$( readlink --canonicalize "$USER_PATH/$INP_FILE" )" "$TMP_FILE"

$BIN_PATH/ffmpeg -y -i "$TMP_FILE" -c:v copy -c:a aac -ac $NUM_CHANNELS -filter:a "volume=$VOL_MULTIPLIER" "$( readlink --canonicalize "$USER_PATH/$OUTP_FILE" )"

rm -fv "$TMP_FILE"

exit 0
