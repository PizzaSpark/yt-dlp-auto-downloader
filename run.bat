@echo off

PowerShell -ExecutionPolicy Bypass -File .\scripts\dlYtdlp.ps1
PowerShell -ExecutionPolicy Bypass -File .\scripts\dlFfmpeg.ps1

call .\scripts\download.bat

pause