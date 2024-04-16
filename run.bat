@echo off

PowerShell -ExecutionPolicy Bypass -File .\scripts\update_code.ps1
PowerShell -ExecutionPolicy Bypass -File .\scripts\dl_ytdlp.ps1
PowerShell -ExecutionPolicy Bypass -File .\scripts\dl_ffmpeg.ps1

call .\scripts\download.bat

pause