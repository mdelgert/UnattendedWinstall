# Setup
```PS
git clone https://github.com/mdelgert/UnattendedWinstall
winget install PowerSoftware.AnyBurn
```

# Links
https://schneegans.de/windows/unattend-generator/
https://schneegans.de/windows/unattend-generator/usage/

# Based on
https://github.com/memstechtips/UnattendedWinstall

### Create a Custom ISO File or download iso from schneegans.de
1. Download your preferred `autounattend.xml` file and save it on your computer.
2. Download the [Windows 10](https://www.microsoft.com/en-us/software-download/windows10) or [Windows 11](https://www.microsoft.com/en-us/software-download/windows11) ISO file depending on the version you want.
3. Download and Install [AnyBurn](https://anyburn.com/download.php)
   - In AnyBurn, select the “Edit Image File” option.
   - Navigate to and select the Official Windows ISO file you downloaded in Step 2.
   - Click on “Add” and select the `autounattend.xml` file you downloaded in Step 1 or just click and drag the `autounattend.xml` into the AnyBurn window.
   - Click on “Next,” then on “Create Now.” You should be prompted to overwrite the ISO file, click on “Yes.”
   - Once the process is complete, close AnyBurn.

# Links
https://learn.microsoft.com/en-us/windows/terminal/tutorials/ssh
https://github.com/PowerShell/Win32-OpenSSH
https://github.com/mdelgert/ReferenceNotes/blob/main/Windows11/Windows11SshServerSetup.md
https://github.com/mdelgert/ReferenceNotes/blob/main/Windows11/Windows11SshServerAdminSetup.md

winget install Microsoft.OpenSSH.Preview
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

# How to Log In Automatically to Windows 11
https://www.howtogeek.com/838506/how-to-sign-into-your-windows-11-pc-automatically/

(Change from 2 to 0)
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PasswordLess\DevicePasswordLessBuildVersion
(Uncheck users must enter a password)
run netplwiz

# Install winget
https://www.tenforums.com/general-support/205725-i-need-script-silently-install-winget.html
https://github.com/asheroto/winget-install/tree/master

@echo off
powershell.exe "irm https://raw.githubusercontent.com/mdelgert/UnattendedWinstall/refs/heads/main/Scripts/WingetInstall.ps1 | iex | Out-Null"
%LOCALAPPDATA%\Microsoft\WindowsApps\winget.exe

# Winget-AutoUpdate
https://github.com/Romanitho/Winget-AutoUpdate

# Get package id
Get-StartApps | Where-Object { $_.Name -like "*Terminal*" }

# Look into
Export-StartLayout -Path "C:\Temp\LayoutModification.json"
