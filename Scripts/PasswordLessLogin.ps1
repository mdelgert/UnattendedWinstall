# Not working

# # Set the username for automatic login
# $username = "admin"   # Replace with your username
# $domain = "."                # Replace with the domain if needed; "." means local computer
# $password = "password123"   # Replace with your password

# # Registry path for Winlogon settings
# $regPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"

# # Set registry keys for automatic login
# try {
#     Write-Host "Setting registry keys for automatic login..." -ForegroundColor Cyan

#     # Set the username
#     Set-ItemProperty -Path $regPath -Name "DefaultUserName" -Value $username
#     # Set the domain
#     Set-ItemProperty -Path $regPath -Name "DefaultDomainName" -Value $domain
#     # Set the password
#     Set-ItemProperty -Path $regPath -Name "DefaultPassword" -Value $password
#     # Enable automatic login
#     Set-ItemProperty -Path $regPath -Name "AutoAdminLogon" -Value "1"

#     Write-Host "Automatic login configured successfully!" -ForegroundColor Green
# } catch {
#     Write-Host "An error occurred while configuring automatic login: $($_.Exception.Message)" -ForegroundColor Red
# }
