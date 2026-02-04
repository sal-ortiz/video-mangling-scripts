@echo off

::setlocal EnableExtensions EnableDelayedExpansion
::title scaling down and compressing video

set USER_PATH=%CD%
set SCRIPT_PATH=%~dp0

set TMP_PATH=%SCRIPT_PATH%\tmp
set BIN_PATH=%SCRIPT_PATH%\bin

set INP_FILE=%~1
set OUTP_FILE=%~2

set TMP_FILE=%TMP_PATH%\%~n1.tmp%~x1

if "%INP_FILE%" == "" (
  echo "%0 <input> [output]"

  exit /b 1
)

if "%OUTP_FILE%" == "" set OUTP_FILE=%INP_FILE%

copy /y /v /d "%INP_FILE%" "%TMP_FILE%"

%BIN_PATH%\ffmpeg -y -i "%TMP_FILE%" -map_metadata -1 -c:v copy -c:a copy "%OUTP_FILE%"

del /q /f "%TMP_FILE%"

exit /b 0
