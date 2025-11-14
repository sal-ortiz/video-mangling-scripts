@echo off

::setlocal EnableExtensions EnableDelayedExpansion
::title scaling down and compressing video

set TMP_PATH=.\tmp
set BIN_PATH=.\bin

set FFMPEG_URL=https://github.com/GyanD/codexffmpeg/releases/download/7.1/ffmpeg-7.1-full_build-shared.zip
set EXIFTOOL_URL=https://exiftool.org/exiftool-13.41_64.zip

if not exist %TMP_PATH%\ (
  mkdir %TMP_PATH%
)

if not exist %BIN_PATH%\ (
  mkdir %BIN_PATH%
)


powershell Invoke-WebRequest %FFMPEG_URL% -OutFile %TMP_PATH%\ffmpeg.zip
powershell Expand-Archive %TMP_PATH%\ffmpeg.zip -DestinationPath %TMP_PATH%\

powershell Invoke-WebRequest %EXIFTOOL_URL% -OutFile %TMP_PATH%\exiftool.zip
powershell Expand-Archive %TMP_PATH%\exiftool.zip -DestinationPath %TMP_PATH%\

copy /v /y %TMP_PATH%\ffmpeg-7.1-full_build-shared\bin\* %BIN_PATH%\
xcopy /v /y /e %TMP_PATH%\exiftool-13.41_64\* %BIN_PATH%\

rename "%BIN_PATH%\exiftool(-k).exe" exiftool.exe

exit /b 0
