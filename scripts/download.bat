@echo off

:MENU
cls
echo What do you want to download?: 
echo.
echo 1. Video
echo 2. Audio
echo 3. Exit
echo.
set /p choice=Choice: 
if "%choice%"=="1" goto VIDEO
if "%choice%"=="2" goto AUDIO
if "%choice%"=="3" goto END
echo Invalid choice, please try again.
pause
goto MENU

:VIDEO
call :DOWNLOAD "video" "-S "res:1080" --remux-video mp4"
goto REPEAT

:AUDIO
call :DOWNLOAD "audio" "-x --audio-format mp3"
goto REPEAT

:DOWNLOAD
set /p input=Input link: 
yt-dlp -P ".\%~1" -o "%%(title)s.%%(ext)s" %~2 %input% --ffmpeg-location "./ffmpeg" || echo Download failed!
goto :eof

:REPEAT
set /p choice= Do you want to download another file (Y/N)? 
if /I "%choice%"=="N" goto END
if /I "%choice%"=="Y" goto MENU
echo Invalid choice, please try again.
goto REPEAT

:END