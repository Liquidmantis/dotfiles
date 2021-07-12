Import-Module PSReadLine
Import-Module az.tools.predictor

Set-PSReadlineOption -EditMode vi
Set-PSReadlineOption -ViModeIndicator cursor
Set-PSReadlineOption -PredictionViewStyle ListView
Set-PSReadlineOption -PredictionSource HistoryAndPlugin

function Get-PSReadlineHistory () {
  Get-Content (Get-PSReadlineOption).HistorySavePath
} 

Set-Alias h Get-PSReadlineHistory

Set-Alias ci code-insiders
Set-Alias vi nvim
Set-Alias tf terraform

Invoke-Expression (&starship init powershell)

$f   = 'foo'
