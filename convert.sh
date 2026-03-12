#!/usr/bin/env bash

APP_ROOT=$( readlink --canonicalize $( dirname $0 ) )
USER_PATH=$( pwd )

TMP_PATH=$APP_ROOT/tmp
BIN_PATH=$APP_ROOT/bin

INP_FILE=$1
OUTP_FILE=$2


if [ -z "$INP_FILE" ] || [ -z "$OUTP_FILE" ]; then
  echo "$( basename $0 ) <input> [output]"

  exit 1
fi

TMP_FILE=$TMP_PATH/"${INP_FILE%.*}".tmp."${INP_FILE##*.}"

cp -fv "$( readlink --canonicalize "$USER_PATH/$INP_FILE" )" "$TMP_FILE"

"$BIN_PATH/ffmpeg" -y -i "$TMP_FILE" -c:v copy -c:a copy -map_metadata 0 "$OUTP_FILE"

rm -fv "$TMP_FILE"

exit 0
