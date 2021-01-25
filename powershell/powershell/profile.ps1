# Import-Module PSReadLine
Import-Module oh-my-posh

Set-PSReadlineOption -EditMode vi
Set-PSReadlineOption -ViModeIndicator cursor
Set-PSReadlineKeyHandler -Chord tab -Function MenuComplete
Set-Theme tehrob
Set-Alias ci code-insiders