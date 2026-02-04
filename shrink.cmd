@echo off

::setlocal EnableExtensions EnableDelayedExpansion
::title scaling down and compressing video

set USER_PATH=%CD%
set SCRIPT_PATH=%~dp0

set TMP_PATH=%SCRIPT_PATH%\tmp
set BIN_PATH=%SCRIPT_PATH%\bin


:: the lower the value the higher the bitrate (24~30 is a good medium)
set CRF_VAL=%1
set IMG_HEIGHT=%2

set INP_FILE=%~3
set OUTP_FILE=%~4
set TMP_FILE=%TMP_PATH%\%~n1.tmp%~x1

set USAGE_STR="%0 <CRF> <IMG_HEIGHT> <INPUT> [OUTPUT]"

if "%CRF_VAL%" == "" (
  echo %USAGE_STR%

  exit /b 1
)

if "%IMG_HEIGHT%" == "" (
  echo %USAGE_STR%

  exit /b 1
)

if "%INP_FILE%" == "" (
  echo %USAGE_STR%

  exit /b 1
)

if "%OUTP_FILE%" == "" set OUTP_FILE=%INP_FILE%

copy /y /v /d "%INP_FILE%" "%TMP_FILE%"

::TODO: try the -af "volume=1.5" switch to adjust volume after mixing down 5.1 audio
%BIN_PATH%\ffmpeg -y -hwaccel auto -i "%TMP_FILE%" -map_metadata 0 -vcodec libx265 -crf %CRF_VAL% -ac 2 -vf scale=-2:%IMG_HEIGHT% "%OUTP_FILE%"

del /s /q /f "%TMP_FILE%"

exit /b 0
