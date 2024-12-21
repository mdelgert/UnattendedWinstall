# List of applications to uninstall
$apps = @(
    'Microsoft.PowerShell',
    'Brave.Brave',
    'Git.Git',
    'Microsoft.VisualStudioCode'
)

# Uninstall each app using winget
foreach ($app in $apps) {
    try {
        Write-Host "Uninstalling $app..." -ForegroundColor Cyan
        # Use winget uninstall command without invalid arguments
        winget uninstall --id=$app --silent --exact
        if ($LASTEXITCODE -eq 0) {
            Write-Host "$app uninstalled successfully!" -ForegroundColor Green
        } else {
            Write-Host "Failed to uninstall $app. Exit code: $LASTEXITCODE" -ForegroundColor Red
        }
    } catch {
        Write-Host "An error occurred while trying to uninstall $app. Details: $($_)" -ForegroundColor Red
    }
}

Write-Host "All uninstallations complete." -ForegroundColor Cyan
