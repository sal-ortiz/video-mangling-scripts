@echo off

::setlocal EnableExtensions EnableDelayedExpansion
::title scaling down and compressing video

set USER_PATH=%CD%
set SCRIPT_PATH=%~dp0

set TMP_PATH=%SCRIPT_PATH%\tmp
set BIN_PATH=%SCRIPT_PATH%\bin

set NUM_CHANNELS=%1
set VOL_MULTIPLIER=%2
set INP_FILE=%~3
set OUTP_FILE=%~4

set TMP_FILE=%TMP_PATH%\%~n3.tmp%~x3

set USAGE_STR="%0 <channels> <volume> <input> [output]"

if "%NUM_CHANNELS%" == "" (
  echo %USAGE_STR%

  exit /b 1
)

if "%VOL_MULTIPLIER%" == "" (
  echo %USAGE_STR%

  exit /b 1
)

if "%INP_FILE%" == "" (
  echo %USAGE_STR%

  exit /b 1
)

if "%OUTP_FILE%" == "" set OUTP_FILE=%INP_FILE%

copy /y /v /d "%INP_FILE%" "%TMP_FILE%"

%BIN_PATH%\ffmpeg -y -i "%TMP_FILE%" -c:a ac3 -ac %NUM_CHANNELS% -filter:a "volume=%VOL_MULTIPLIER%" "%OUTP_FILE%"

del /s /q /f "%TMP_FILE%"

exit /b 0
