@echo off

cd /d "%~dp0..\assets"

:MENU
cls
echo What do you want to download?: 
echo.
echo 1. Video
echo 2. Audio
echo 3. Video Playlist
echo 4. Audio Playlist
echo 3. Exit
echo.
set /p choice=Choice: 
if "%choice%"=="1" goto VIDEO
if "%choice%"=="2" goto AUDIO
if "%choice%"=="3" goto BATCH_VIDEO
if "%choice%"=="4" goto BATCH_AUDIO
if "%choice%"=="5" goto END
echo Invalid choice, please try again.
pause
goto MENU

:VIDEO
call :DOWNLOAD "../downloads/video" "%%(title)s.%%(ext)s" "-S "res:1080" --remux-video mp4"
goto REPEAT

:AUDIO
call :DOWNLOAD "../downloads/audio" "%%(title)s.%%(ext)s" "-x --audio-format mp3"
goto REPEAT

:BATCH_VIDEO
call :DOWNLOAD "../downloads/video" "%%(playlist)s/%%(title)s.%%(ext)s" "-S "res:1080" --remux-video mp4"

:BATCH_AUDIO
call :DOWNLOAD "../downloads/audio" "%%(playlist)s/%%(title)s.%%(ext)s" "-x --audio-format mp3"

:DOWNLOAD
set /p input=Input link: 
yt-dlp -P ".\%~1" -o %~2 %~3 %input% || echo Download failed!
goto :eof

:REPEAT
set /p choice= Do you want to download another file (Y/N)? 
if /I "%choice%"=="N" goto END
if /I "%choice%"=="Y" goto MENU
echo Invalid choice, please try again.
goto REPEAT

:END