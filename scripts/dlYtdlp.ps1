$owner = "yt-dlp"
$repo = "yt-dlp"
$filename = "yt-dlp.exe"
$folder = "assets"

# Create the folder if it doesn't exist
if (!(Test-Path -Path $folder)) {
    New-Item -ItemType Directory -Path $folder
}

# Get the latest release info from GitHub API
$release = Invoke-RestMethod -Uri "https://api.github.com/repos/$owner/$repo/releases/latest"

# Find the asset with the given filename
$asset = $release.assets | Where-Object { $_.name -eq $filename }

if ($asset) {
    # Get the version of the file on GitHub
    $githubVersion = $release.tag_name

    # Get the version of the local file
    $localFile = "$folder\$filename"
    if (Test-Path -Path $localFile) {
        $localVersion = (Get-Command $localFile).FileVersionInfo.ProductVersion
    } else {
        $localVersion = "0"
    }

    # Compare the versions
    if ($githubVersion -gt $localVersion) {
        # Download the asset
        Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $localFile
    } else {
        Write-Output "The local file is up to date."
    }
} else {
    Write-Output "No asset found with the name $filename."
}