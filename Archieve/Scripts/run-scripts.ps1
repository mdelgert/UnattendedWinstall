# run-scripts.ps1

# Get the folder of the current script
$currentFolder = (Get-Location).Path

# Define an array of script names
$scripts = @(
    "message-begin.ps1",
    "winget-update.ps1",
    "message-end.ps1"
)

# Loop through each script and run it
foreach ($script in $scripts) {
    $scriptPath = Join-Path $currentFolder $script
    Write-Host "Running $scriptPath..."
    & $scriptPath

    # Check if the script ran successfully
    if ($LASTEXITCODE -eq 0) {
        Write-Host "$script completed successfully."
    } else {
        Write-Host "$script failed. Exiting."
        exit 1
    }
}

Write-Host "All scripts completed successfully."
