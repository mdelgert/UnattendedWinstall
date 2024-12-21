# Define the registry path where the key resides (include the Device subkey)
$RegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\Device"

# Define the name of the registry key to modify
$RegistryKey = "DevicePasswordLessBuildVersion"

# Define the new value to set
$NewValue = 0

# Set the new value for the registry key
Set-ItemProperty -Path $RegistryPath -Name $RegistryKey -Value $NewValue

# Output confirmation
Write-Output "The registry key '$RegistryKey' at path '$RegistryPath' has been updated to value $NewValue."

# Set the username for automatic login
$username = "admin"   # Replace with your username
$domain = "."                # Replace with the domain if needed; "." means local computer
$password = "password123"   # Replace with your password

# Registry path for Winlogon settings
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"

# Set registry keys for automatic login
try {
    Write-Host "Setting registry keys for automatic login..." -ForegroundColor Cyan

    # Set the username
    Set-ItemProperty -Path $regPath -Name "DefaultUserName" -Value $username
    # Set the domain
    Set-ItemProperty -Path $regPath -Name "DefaultDomainName" -Value $domain
    # Set the password
    Set-ItemProperty -Path $regPath -Name "DefaultPassword" -Value $password
    # Enable automatic login
    Set-ItemProperty -Path $regPath -Name "AutoAdminLogon" -Value "1"

    Write-Host "Automatic login configured successfully!" -ForegroundColor Green
} catch {
    Write-Host "An error occurred while configuring automatic login: $($_.Exception.Message)" -ForegroundColor Red
}
