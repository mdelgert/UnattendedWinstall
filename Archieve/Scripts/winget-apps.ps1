# Applications to install
$apps = @(
    'Microsoft.PowerShell',
    'Brave.Brave',
    'Microsoft.VisualStudioCode',
    'Git.Git'
)

# Install each app using winget
foreach ($app in $apps) {
    winget install --id=$app --silent --accept-source-agreements --accept-package-agreements
}