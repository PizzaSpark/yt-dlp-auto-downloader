function CheckExeFilesExist {
    $ffmpegPath = ".\assets\ffmpeg.exe"
    $ffplayPath = ".\assets\ffplay.exe"
    $ffprobePath = ".\assets\ffprobe.exe"

    return ((Test-Path $ffmpegPath) -and (Test-Path $ffplayPath) -and (Test-Path $ffprobePath))
}

$filesExist = CheckExeFilesExist
if ($filesExist) {
    Write-Host "The ffmpeg files exist. Skipping-"
    exit
} else {
    Write-Host "The ffmpeg files do not exist. Downloading-"
}

# Define the URL for the latest FFmpeg build
$url = "https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-full.7z"

# Define the output path
$output = ".\assets\ffmpeg.7z"

# Check if the file already exists
if (Test-Path $output) {
    Write-Host "FFmpeg file already downloaded before. Skipping download."
} else {
    # Use Invoke-WebRequest to download the file
    Invoke-WebRequest -Uri $url -OutFile $output
}

# Check if 7z is installed
try {
    $7z = Get-Command 7z -ErrorAction Stop
    # Extract the downloaded 7z file
    & $7z x $output -o".\assets"

    # Get the name of the extracted directory
    $extractedDir = Get-ChildItem -Path ".\assets" -Directory | Select-Object -First 1

    # Rename the extracted directory to "ffmpeg"
    Rename-Item -Path $extractedDir.FullName -NewName "ffmpeg"

    # Move the exe files to the assets directory
    Move-Item -Path ".\assets\ffmpeg\bin\*.exe" -Destination ".\assets"

    # Remove the ffmpeg directory
    Remove-Item -Path ".\assets\ffmpeg" -Recurse -Force

} catch {
    Write-Host "7z is not installed or not accessible from the command line. Please manually extract the downloaded file."
    
    Write-Host "Once extracted, open the folder and go to the bin folder and move the three exe files in the assets folder"

    Write-Host "Once done, delete the extracted folder"

    $input = Read-Host "Press 1 to open the assets folder or 2 to continue if already done"

    if ($input -eq "1") {
        # Open the assets folder
        explorer.exe .\assets
    } elseif ($input -eq "2") {
        # Continue with the script
        Write-Host "Continuing..."

        while ($true) {
            $filesExist = CheckExeFilesExist
            if ($filesExist) {
                Write-Host "The ffmpeg files exist. Skipping-"
                break
            } else {
                Write-Host "The ffmpeg files do not exist. Please double check if the exe files are in the assets folder directly"
                Read-Host "Press any key to check again"
            }
        }

    } else {
        Write-Host "Invalid choice. Please enter 1 or 2."
    }
}


try {
    # Attempt to remove the downloaded 7z file
    Remove-Item -Path $output -ErrorAction Stop
}
catch {
    # Handle any errors that occur
    Write-Host "The 7z file is either already deleted or theres an error deleting it"
}

# Get all the files in the assets folder
$files = Get-ChildItem -Path ".\assets"

# Loop through each file
foreach ($file in $files) {
    # If the file is not one of the four specified files, delete it
    if ($filesExist -and $file.Name -ne "yt-dlp.exe") {
        try {
            Remove-Item -Path $file.FullName -ErrorAction Stop
        }
        catch {
            Write-Host "An error occurred while trying to delete the file: $_"
        }
    }
}