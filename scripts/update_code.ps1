function main {
    CheckIfUpToDate
}

function CheckIfUpToDate() {
    try {
        # Navigate to the repository directory
        Set-Location ..

        # Fetch the latest information from the remote repository
        git fetch

        # Compare the local HEAD commit with the remote HEAD commit
        $local = git rev-parse HEAD
        $remote = git rev-parse @{u}

        if ($local -eq $remote) {
            Write-Host "The local repository is up-to-date with the remote repository."
        } else {
            Write-Host "The local repository is not up-to-date with the remote repository."
            git pull
        }
    } catch {
        Write-Host "An error occurred while trying to check if the repository is up-to-date: $_"
    }
}

main