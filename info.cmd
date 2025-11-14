@echo off

::setlocal EnableExtensions EnableDelayedExpansion
::title scaling down and compressing video

set BIN_PATH=.\bin

set INP_FILE=%~1

if "%INP_FILE%" == "" (
  echo "%0 <input>"

  exit /b 1
)


%BIN_PATH%\exiftool "%INP_FILE%"
%BIN_PATH%\exiftool -time:all -a -G0:1 -s "%INP_FILE%"

exit /b 0
