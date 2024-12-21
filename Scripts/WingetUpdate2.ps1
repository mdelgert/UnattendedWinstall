# Not working just testing options

# Update winget run as seperate script first
#winget upgrade --id Microsoft.AppInstaller --accept-source-agreements
#winget upgrade --all --accept-source-agreements

# Step 1: Reset sources
Write-Host "Resetting winget sources..." -ForegroundColor Cyan
winget source reset --force

# Step 2: Add the winget source if not already added
Write-Host "Adding winget source..." -ForegroundColor Cyan
try {
    winget source add --name winget --type Microsoft.Rest --arg https://winget.azureedge.net/cache
} catch {
    Write-Host "Winget source already exists or failed to add." -ForegroundColor Yellow
}

# Step 3: Accept msstore source agreements
Write-Host "Accepting msstore source agreements..." -ForegroundColor Cyan
try {
    winget source update --name msstore --accept-source-agreements
} catch {
    Write-Host "Failed to update msstore source: $($_.Exception.Message)" -ForegroundColor Red
}

# Step 4: Upgrade winget (Microsoft.DesktopAppInstaller) silently
Write-Host "Upgrading Microsoft.DesktopAppInstaller..." -ForegroundColor Cyan
try {
    winget upgrade --id Microsoft.DesktopAppInstaller --accept-source-agreements --silent
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Microsoft.DesktopAppInstaller upgraded successfully!" -ForegroundColor Green
    } else {
        Write-Host "Failed to upgrade Microsoft.DesktopAppInstaller. Exit code: $LASTEXITCODE" -ForegroundColor Red
    }
} catch {
    Write-Host "An error occurred during upgrade: $($_.Exception.Message)" -ForegroundColor Red
}
