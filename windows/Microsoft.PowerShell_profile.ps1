# Import prompt and modules
Invoke-Expression (&starship init powershell)
Import-Module git-aliases -DisableNameChecking
Import-Module PSReadLine

# Aliases
Set-Alias -Name which -Value Get-Command
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name lzd -Value lazydocker

Function changeDirDotDot {Set-Location -Path ..}
Set-Alias -Name .. -Value changeDirDotDot

Function import-poshgit {Import-Module posh-git}
Set-Alias -Name pg -Value import-poshgit

Set-Alias -Name we -Value explorer.exe

# Shortcuts
# Set command history config
Set-PSReadlineOption -HistoryNoDuplicates
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

# history substring search
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Tab completion
Set-PSReadlineKeyHandler -Chord 'Shift+Tab' -Function Complete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Ctrl-D like bash
Set-PSReadLineKeyHandler -Key 'Ctrl+d' -Function DeleteCharOrExit
