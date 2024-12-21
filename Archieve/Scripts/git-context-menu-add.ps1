# Define registry keys and values for Git Bash
$gitBashKeyDirBg = "HKCU:\Software\Classes\Directory\Background\shell\git_bash"
$gitBashCommandDirBg = "HKCU:\Software\Classes\Directory\Background\shell\git_bash\command"
$gitBashKeyAllFiles = "HKCU:\Software\Classes\*\shell\git_bash"
$gitBashCommandAllFiles = "HKCU:\Software\Classes\*\shell\git_bash\command"

# Define registry keys and values for Git GUI
$gitGuiKeyDirBg = "HKCU:\Software\Classes\Directory\Background\shell\git_gui"
$gitGuiCommandDirBg = "HKCU:\Software\Classes\Directory\Background\shell\git_gui\command"
$gitGuiKeyAllFiles = "HKCU:\Software\Classes\*\shell\git_gui"
$gitGuiCommandAllFiles = "HKCU:\Software\Classes\*\shell\git_gui\command"

# Create Git Bash registry entries
New-Item -Path $gitBashKeyDirBg -Force
Set-ItemProperty -Path $gitBashKeyDirBg -Name "(default)" -Value "Open Git Bash here"
Set-ItemProperty -Path $gitBashKeyDirBg -Name "Icon" -Value "`"C:\Program Files\Git\git-bash.exe`",0"

New-Item -Path $gitBashCommandDirBg -Force
Set-ItemProperty -Path $gitBashCommandDirBg -Name "(default)" -Value "`"C:\Program Files\Git\git-bash.exe`""

New-Item -Path $gitBashKeyAllFiles -Force
Set-ItemProperty -Path $gitBashKeyAllFiles -Name "(default)" -Value "Open Git Bash here"
Set-ItemProperty -Path $gitBashKeyAllFiles -Name "Icon" -Value "`"C:\Program Files\Git\git-bash.exe`",0"

New-Item -Path $gitBashCommandAllFiles -Force
Set-ItemProperty -Path $gitBashCommandAllFiles -Name "(default)" -Value "`"C:\Program Files\Git\git-bash.exe`""

# Create Git GUI registry entries
New-Item -Path $gitGuiKeyDirBg -Force
Set-ItemProperty -Path $gitGuiKeyDirBg -Name "(default)" -Value "Open Git GUI here"
Set-ItemProperty -Path $gitGuiKeyDirBg -Name "Icon" -Value "`"C:\Program Files\Git\cmd\git-gui.exe`",0"

New-Item -Path $gitGuiCommandDirBg -Force
Set-ItemProperty -Path $gitGuiCommandDirBg -Name "(default)" -Value "`"C:\Program Files\Git\cmd\git-gui.exe`""

New-Item -Path $gitGuiKeyAllFiles -Force
Set-ItemProperty -Path $gitGuiKeyAllFiles -Name "(default)" -Value "Open Git GUI here"
Set-ItemProperty -Path $gitGuiKeyAllFiles -Name "Icon" -Value "`"C:\Program Files\Git\cmd\git-gui.exe`",0"

New-Item -Path $gitGuiCommandAllFiles -Force
Set-ItemProperty -Path $gitGuiCommandAllFiles -Name "(default)" -Value "`"C:\Program Files\Git\cmd\git-gui.exe`""
