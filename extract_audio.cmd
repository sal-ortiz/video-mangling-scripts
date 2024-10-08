@echo off

::setlocal EnableExtensions EnableDelayedExpansion
::title scaling down and compressing video

set BIN_PATH=.\bin

set INP_FILE=%~1
set OUTP_FILE=%~2


if "%INP_FILE%" == "" (
  echo "%0 <input> <output>"
  exit /b 1
)

if "%OUTP_FILE%" == "" (
  set OUTP_FILE=%~n1.mp3
)

%BIN_PATH%\ffmpeg -i "%INP_FILE%" -f mp3 -ab 192000 -vn "%OUTP_FILE%"

exit /b 0
