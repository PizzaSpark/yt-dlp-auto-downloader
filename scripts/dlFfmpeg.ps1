# Define the paths to the exe files
$ffmpegPath = ".\assets\ffmpeg.exe"
$ffplayPath = ".\assets\ffplay.exe"
$ffprobePath = ".\assets\ffprobe.exe"

# Check if the exe files already exist
if ((Test-Path $ffmpegPath) -and (Test-Path $ffplayPath) -and (Test-Path $ffprobePath)) {
    Write-Output "ffmpeg.exe, ffplay.exe, and ffprobe.exe already exist in the assets folder."
    exit
}

# Define the URL for the latest FFmpeg build
$url = "https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-full.7z"

# Define the output path
$output = ".\assets\ffmpeg.7z"

# Use Invoke-WebRequest to download the file
Invoke-WebRequest -Uri $url -OutFile $output

# Extract the downloaded 7z file
7z x $output -o".\assets"

# Remove the downloaded 7z file
Remove-Item -Path $output

# Move the exe files to the assets directory
Move-Item -Path ".\assets\ffmpeg\bin\*.exe" -Destination ".\assets"

# Remove the ffmpeg directory
Remove-Item -Path ".\assets\ffmpeg" -Recurse -Force