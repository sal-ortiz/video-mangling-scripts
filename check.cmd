@echo off

::setlocal EnableExtensions EnableDelayedExpansion
::title scaling down and compressing video

set USER_PATH=%CD%
set SCRIPT_PATH=%~dp0

set BIN_PATH=%SCRIPT_PATH%\bin

set INP_FILE=%~1

if "%INP_FILE%" == "" (
  echo "%0 <input>"

  exit /b 1
)

%BIN_PATH%\ffmpeg -stats -v error -i %INP_FILE% -f null -

exit /b 0
