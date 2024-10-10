@echo off

::setlocal EnableExtensions EnableDelayedExpansion
::title scaling down and compressing video

set TMP_PATH=.\tmp
set BIN_PATH=.\bin

set INP_FILE=%~1
set OUTP_FILE=%~2

set TMP_FILE=%TMP_PATH%\%INP_FILE%.tmp

if "%INP_FILE%" == "" (
  echo "%0 <input> [output]"

  exit /b 1
)

if "%OUTP_FILE%" == "" (
  set OUTP_FILE=%INP_FILE%
)


copy /y /v /d "%INP_FILE%" "%TMP_FILE%"

::%BIN_PATH%\ffmpeg -y -i "%TMP_FILE%" v -map_metadata -1 -c:v copy -c:a copy "%OUTP_FILE%"
%BIN_PATH%\exiftool -r -overwrite_original -title= -comment= -subtitle= -artist= -album= "%TMP_FILE%"

copy /v /y "%TMP_FILE%" "%OUTP_FILE%"
del /q /f "%TMP_FILE%"

exit /b 0
