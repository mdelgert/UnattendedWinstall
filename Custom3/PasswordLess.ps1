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
