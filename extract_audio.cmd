@echo off

::setlocal EnableExtensions EnableDelayedExpansion
::title scaling down and compressing video

set USER_PATH=%CD%
set SCRIPT_PATH=%~dp0

set BIN_PATH=%SCRIPT_PATH%\bin

set INP_FILE=%~1
set OUTP_FILE=%~2


if "%INP_FILE%" == "" (
  echo "%0 <input> [output]"
  exit /b 1
)

if "%OUTP_FILE%" == "" (
  set OUTP_FILE=%~n1.wav
)

# TODO: use -ab <sampling rate> to force output sampling rate.
%BIN_PATH%\ffmpeg -y -i "%INP_FILE%" -f wav -vn "%OUTP_FILE%"

exit /b 0
