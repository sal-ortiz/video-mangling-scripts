@echo off

::setlocal EnableExtensions EnableDelayedExpansion
::title scaling down and compressing video

set TMP_PATH=.\tmp
set BIN_PATH=.\bin

if exist %BIN_PATH% (
  del /s /q %BIN_PATH%
  rmdir /s /q %BIN_PATH%
)

if exist %TMP_PATH% (
  del /s /q %TMP_PATH%
  rmdir /s /q %TMP_PATH%
)

exit /b 0
