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

