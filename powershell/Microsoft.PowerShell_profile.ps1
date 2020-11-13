Import-Module PSReadLine
Import-Module oh-my-posh
Import-Module az.tools.predictor

Set-PSReadlineOption -EditMode vi
Set-PSReadlineOption -ViModeIndicator cursor
Set-PSReadlineOption -PredictionViewStyle ListView
Set-PSReadlineOption -PredictionSource HistoryAndPlugin

Set-Theme tehrob

Set-Alias ci code-insiders

function Get-PSReadlineHistory () {
  Get-Content (Get-PSReadlineOption).HistorySavePath
} 
