# Step 1: Reset winget sources
Write-Host "Resetting winget sources..." -ForegroundColor Cyan
winget source reset --force

# Step 2: Add the winget source if not already added
Write-Host "Adding winget source..." -ForegroundColor Cyan
try {
    winget source add --name winget --type Microsoft.Rest --arg https://winget.azureedge.net/cache
} catch {
    Write-Host "Winget source already exists or failed to add." -ForegroundColor Yellow
}

# Step 3: Update msstore source and accept agreements
Write-Host "Updating msstore source and accepting agreements..." -ForegroundColor Cyan
try {
    # Manually re-add the msstore source to ensure it works
    winget source remove msstore
    winget source add --name msstore --type Microsoft.Rest --arg https://storeedgefd.dsx.mp.microsoft.com/v9.0
    echo Y | winget source update --name msstore
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Source agreements accepted successfully." -ForegroundColor Green
    } else {
        Write-Host "Failed to accept source agreements. Exit code: $LASTEXITCODE" -ForegroundColor Red
    }
} catch {
    Write-Host "Failed to update msstore source: $($_.Exception.Message)" -ForegroundColor Red
}

# Step 4: Upgrade Microsoft.DesktopAppInstaller silently
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
