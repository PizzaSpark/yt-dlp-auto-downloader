$owner = "yt-dlp"
$repo = "yt-dlp"
$filename = "yt-dlp.exe"
$folder = "assets"

# Ensure the target folder exists
if (!(Test-Path -Path $folder)) {
    New-Item -ItemType Directory -Path $folder | Out-Null
}

# Fetch the latest release info from GitHub API
$release = Invoke-RestMethod -Uri "https://api.github.com/repos/$owner/$repo/releases/latest"

# Find the asset with the specified filename
$asset = $release.assets | Where-Object { $_.name -eq $filename }

if ($asset) {
    # Get the version of the file on GitHub
    $githubVersion = $release.tag_name

    # Define the local file path
    $localFile = Join-Path $folder $filename

    # Check if the local file exists
    if (Test-Path -Path $localFile) {
        Write-Output "yt-dlp already exists."

        # Get the version of the local file
        $localVersion = (Get-Command $localFile).FileVersionInfo.ProductVersion

        # If the GitHub version is newer, download the asset
        if ($githubVersion -gt $localVersion) {
            Write-Output "The current yt-dlp is outdated, downloading the latest version."
            Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $localFile
        } else {
            Write-Output "yt-dlp is up to date."
        }
    } else {
        Write-Output "yt-dlp does not exist, downloading the latest version."
        Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $localFile
    }
} else {
    Write-Output "No asset found with the name $filename."
}