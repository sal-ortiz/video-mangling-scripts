@echo off

::setlocal EnableExtensions EnableDelayedExpansion
::title scaling down and compressing video

set USER_PATH=%CD%
set SCRIPT_PATH=%~dp0

set TMP_PATH=%SCRIPT_PATH%\tmp
set BIN_PATH=%SCRIPT_PATH%\bin


:: the lower the value the higher the bitrate (24~30 is a good medium)
set INP_FILE=%~1
set OUTP_FILE=%~2
set TMP_FILE=%TMP_PATH%\%~n1.tmp%~x1

set USAGE_STR="%~nx0 <INPUT> [OUTPUT]"

if "%INP_FILE%" == "" (
  echo %USAGE_STR%

  exit /b 1
)

if "%OUTP_FILE%" == "" (
  echo %USAGE_STR%

  exit /b 1
)


copy /y /v /d "%INP_FILE%" "%TMP_FILE%"

%BIN_PATH%\ffmpeg -y -i "%TMP_FILE%" -c:v copy -c:a copy -map_metadata 0 "%OUTP_FILE%"

del /q /f "%TMP_FILE%"

exit /b 0

