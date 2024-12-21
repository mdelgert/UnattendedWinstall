# List of applications to install
$apps = @(
    'Microsoft.PowerShell',
    'Brave.Brave',
    'Git.Git',
    'Microsoft.VisualStudioCode'
)

# Install each app using winget
foreach ($app in $apps) {
    try {
        Write-Host "Installing $app..." -ForegroundColor Cyan
        winget install --id=$app --silent --accept-source-agreements --accept-package-agreements
        if ($LASTEXITCODE -eq 0) {
            Write-Host "$app installed successfully!" -ForegroundColor Green
        } else {
            Write-Host "Failed to install $app. Exit code: $LASTEXITCODE" -ForegroundColor Red
        }
    } catch {
        Write-Host "An error occurred while trying to install $app. Details: $($_)" -ForegroundColor Red
    }
}

Write-Host "All installations complete." -ForegroundColor Cyan
