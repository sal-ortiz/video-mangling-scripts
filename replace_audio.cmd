@echo off

::setlocal EnableExtensions EnableDelayedExpansion
::title scaling down and compressing video

set TMP_PATH=.\tmp
set BIN_PATH=.\bin

set VID_INPUT=%~1
set AUD_INPUT=%~2
set OUTP_FILE=%~3

set TMP_FILE=%TMP_PATH%\%VID_INPUT%.tmp

if "%VID_INPUT%" == "" (
  echo "%0 <video> <audio> [output]"
  exit /b 1
)

if "%AUD_INPUT%" == "" (
  echo "%0 <video> <audio> [output]"
  exit /b 1
)

if "%OUTP_FILE%" == "" (
  set OUTP_FILE=%VID_INPUT%
)

copy /y /v /d "%VID_INPUT%" "%TMP_FILE%"

%BIN_PATH%\ffmpeg -y -i "%TMP_FILE%" -i %AUD_INPUT% -c:v copy -map 0:v:0 -map 1:a:0 %OUTP_FILE%

del /q /f "%TMP_FILE%"

exit /b 0



