@echo off

::setlocal EnableExtensions EnableDelayedExpansion
::title scaling down and compressing video

set BIN_PATH=.\bin

set INP_FILE=%~1

if "%INP_FILE%" == "" (
  echo "%0 <input>"

  exit /b 1
)


::%BIN_PATH%\ffprobe -loglevel error -show_entries stream_tags:format_tags -of json "%INP_FILE%"
%BIN_PATH%\exiftool -*title* -*subtitle* -*comment* -*artist* -*album* "%INP_FILE%"

exit /b 0
