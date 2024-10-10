@echo off

::setlocal EnableExtensions EnableDelayedExpansion
::title scaling down and compressing video

set TMP_PATH=.\tmp
set BIN_PATH=.\bin

set INP_FILE=%~1
set OUTP_FILE=%~2

set TMP_FILE=%TMP_PATH%\%INP_FILE%.tmp

:: the lower the value the higher the bitrate (24~30 is a good medium)
set CRF_VAL=20

if "%INP_FILE%" == "" (
  echo "%0 <input> [output]"

  exit /b 1
)

if "%OUTP_FILE%" == "" (
  set OUTP_FILE=%INP_FILE%
)


copy /y /v /d "%INP_FILE%" "%TMP_FILE%"

%BIN_PATH%\ffmpeg -y -i "%TMP_FILE%" -vcodec libx265 -crf %CRF_VAL% "%OUTP_FILE%"


del /q /f "%TMP_FILE%"

exit /b 0
