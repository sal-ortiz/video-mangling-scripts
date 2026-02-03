#!/usr/bin/env bash

EXIF_VER=13.43

APP_ROOT=$( readlink --canonicalize $( dirname $0 ) )
USER_PATH=$( pwd )

TMP_PATH=$APP_ROOT/tmp
BIN_PATH=$APP_ROOT/bin

FFMPEG_URL=https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz
EXIFTOOL_URL=https://sourceforge.net/projects/exiftool/files/Image-ExifTool-$EXIF_VER.tar.gz

if [ ! -d $BIN_PATH ]; then
  mkdir $BIN_PATH
fi

if [ ! -d $TMP_PATH ]; then
  mkdir $TMP_PATH
fi


wget $FFMPEG_URL -O $TMP_PATH/ffmpeg.tar.xz
wget $EXIFTOOL_URL -O $TMP_PATH/exiftool.tar.gz

cd $TMP_PATH
tar -xvf ./ffmpeg.tar.xz
tar -xvf ./exiftool.tar.gz
cd $USER_PATH

ln -sfv $TMP_PATH/ffmpeg-7.0.2-amd64-static/ffmpeg $BIN_PATH/
ln -sfv $TMP_PATH/ffmpeg-7.0.2-amd64-static/ffprobe $BIN_PATH/
ln -sfv $TMP_PATH/Image-ExifTool-$EXIF_VER/exiftool $BIN_PATH/

exit 0
