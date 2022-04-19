$env:MY_DEPLOY_DATA = "/Users/liquid/git-work/EmsDeployment/EmsDeploymentData/Source/Resources"

Import-Module PSReadLine
Import-Module az.tools.predictor
. $(Join-Path $PSScriptRoot functions.ps1)
. $(Join-Path $PSScriptRoot aliases.ps1)

Set-PSReadlineOption -EditMode vi
Set-PSReadlineOption -ViModeIndicator cursor
Set-PSReadlineOption -PredictionViewStyle ListView
Set-PSReadlineOption -PredictionSource HistoryAndPlugin

function Get-PSReadlineHistory () {
  Get-Content (Get-PSReadlineOption).HistorySavePath
} 

Invoke-Expression (&starship init powershell)
