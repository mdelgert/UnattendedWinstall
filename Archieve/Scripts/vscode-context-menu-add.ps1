# Define registry keys and values for "Open with Code" for all files
$openWithCodeKeyAllFiles = "HKCU:\Software\Classes\*\shell\Open with Code"
$openWithCodeCommandAllFiles = "HKCU:\Software\Classes\*\shell\Open with Code\command"

# Define registry keys and values for "Open with Code" for directories
$openWithCodeKeyDirectory = "HKCU:\Software\Classes\Directory\shell\Open with Code"
$openWithCodeCommandDirectory = "HKCU:\Software\Classes\Directory\shell\Open with Code\command"

# Create "Open with Code" registry entries for all files
New-Item -Path $openWithCodeKeyAllFiles -Force
Set-ItemProperty -Path $openWithCodeKeyAllFiles -Name "(default)" -Value "Open with Code"
Set-ItemProperty -Path $openWithCodeKeyAllFiles -Name "Icon" -Value "`"C:\Program Files\Microsoft VS Code\Code.exe`",0"

New-Item -Path $openWithCodeCommandAllFiles -Force
Set-ItemProperty -Path $openWithCodeCommandAllFiles -Name "(default)" -Value "`"C:\Program Files\Microsoft VS Code\Code.exe`" `"%1`""

# Create "Open with Code" registry entries for directories
New-Item -Path $openWithCodeKeyDirectory -Force
Set-ItemProperty -Path $openWithCodeKeyDirectory -Name "(default)" -Value "Open with Code"
Set-ItemProperty -Path $openWithCodeKeyDirectory -Name "Icon" -Value "`"C:\Program Files\Microsoft VS Code\Code.exe`",0"

New-Item -Path $openWithCodeCommandDirectory -Force
Set-ItemProperty -Path $openWithCodeCommandDirectory -Name "(default)" -Value "`"C:\Program Files\Microsoft VS Code\Code.exe`" `"%V`""
