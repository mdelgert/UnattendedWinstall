Stop-Service sshd
Set-Service sshd -StartupType Disabled
takeown /F "C:\Windows\System32\OpenSSH" /R /D Y
icacls "C:\Windows\System32\OpenSSH" /grant Administrators:F /T
Remove-Item -Path "C:\Windows\System32\OpenSSH" -Recurse -Force

