function main {
    $filesExist = CheckExeFilesExist
    if ($filesExist) {
        Write-Host "The ffmpeg files exist. Skipping-"
        exit
    } else {
        Write-Host "The ffmpeg files do not exist. Downloading-"
    }

    $url = "https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-full.7z"
    $output = ".\assets\ffmpeg.7z"

    DownloadFile $url $output
    ExtractAndMoveFiles $output

    Read-Host "Press Enter to continue..."
}

function CheckExeFilesExist {
    $ffmpegPath = ".\assets\ffmpeg.exe"
    $ffplayPath = ".\assets\ffplay.exe"
    $ffprobePath = ".\assets\ffprobe.exe"

    return ((Test-Path $ffmpegPath) -and (Test-Path $ffplayPath) -and (Test-Path $ffprobePath))
}

function OpenAssetsFolder {
    explorer.exe .\assets
    Write-Host "Please extract and move the three exe files into the assets folder. Press any key to continue once done."
    $null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    CheckFilesExistAndPrompt
}

function CheckFilesExistAndPrompt {
    while ($true) {
        $filesExist = CheckExeFilesExist
        if ($filesExist) {
            Write-Host "The ffmpeg files exist. Skipping-"
            CleanAssetsFolder
            break
        } else {
            HandleManualExtraction
        }
    }
}

function DownloadFile($url, $output) {
    if (!(Test-Path $output)) {
        Invoke-WebRequest -Uri $url -OutFile $output
    }
}

function ExtractAndMoveFiles($output) {
    try {
        $7z = Get-Command 7z -ErrorAction Stop
        & $7z x $output -o".\assets"

        $extractedDir = Get-ChildItem -Path ".\assets" -Directory | Select-Object -First 1
        Rename-Item -Path $extractedDir.FullName -NewName "ffmpeg"
        Move-Item -Path ".\assets\ffmpeg\bin\*.exe" -Destination ".\assets"
        Remove-Item -Path ".\assets\ffmpeg" -Recurse -Force
    } catch {
        Write-Host "7z is not installed or not accessible from the command line. Please manually extract the downloaded file."
        HandleManualExtraction
    }
}

function CleanAssetsFolder() {
    $files = Get-ChildItem -Path ".\assets"
    $excludedFiles = "yt-dlp.exe", "ffmpeg.exe", "ffplay.exe", "ffprobe.exe"
    foreach ($file in $files) {
        if ($file.Name -notin $excludedFiles) {
            try {
                if ($file.PSIsContainer) {
                    # If the item is a directory, delete it and its contents
                    Remove-Item -Path $file.FullName -Recurse -Force -Confirm:$false
                } else {
                    # If the item is a file, delete it
                    Remove-Item -Path $file.FullName -Force
                }
            } catch {
                Write-Host "An error occurred while trying to delete the file: $_"
            }
        }
    }
    Write-Host "The assets folder has been cleaned."
}

function HandleManualExtraction {
    Write-Host "Once extracted, open the folder and go to the bin folder and move the three exe files in the assets folder"
    Write-Host "Once done, delete the extracted folder"

    $input = Read-Host "Press 1 to open the assets folder or 2 to continue if already done"

    if ($input -eq "1") {
        OpenAssetsFolder
    } elseif ($input -eq "2") {
        Write-Host "Continuing..."
        CheckFilesExistAndPrompt
    } else {
        Write-Host "Invalid choice. Please enter 1 or 2."
    }
}

main